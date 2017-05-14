//
//  GameNavigationController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol GameNavigationControllerDelegate: class {
    func gameFinished()
}

class GameNavigationController: UINavigationController {
    
    let introText = "Hi"//"Rumors speak of a spontaneous worldwide competition, one that occurs with little warning. The last supposed occurrence featured events no nation had been able to predict such as cookie baking and horse grooming, but that was centuries ago.\nJust today, the seers appeared once again, unseen for almost three hundred years. The Miramortem Games were announced with the date set for two months down the line. They listed off the participants, and you were included as one of many to represent your nation. No hints are given as to what the nations will be tested on come time of the event, but everyone knows that placing last will have negative consequences.\n\nAfter all, the last nation to supposedly have lost no longer exists."
    
    let transitionText = "hi"
    
    fileprivate var characters: [Character] = []
    fileprivate var possibleLocations: [Location] = []
    fileprivate var currentCharacter = 0
    fileprivate var roundsComplete = 0
    fileprivate var trainingComplete = false
    fileprivate var gameDone = false
    
    fileprivate var events: [Event] = []
    fileprivate var completedEvents: [Bool] = []
    fileprivate var eventOutcomes: [SuccessType] = []
    
    weak var gameDelegate: GameNavigationControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        viewControllers = [homeViewController]
        
        isNavigationBarHidden = true
    }
    
    fileprivate func startEvents() {
        var possibleEvents: [Event] = [.weddingCakeMaking, .lightBulbChanging, .potionMaking, .demonSummoning, .extremeYoyoing, .cardThrowing, .buildingFire, .uprootingTree, .perfectDate, .ikeaFurnitureBuilding, .presentWrapping, .escapingCornMaze, .catchingFly, .flowerArranging, .dogWalking]
        
        for _ in 0..<4 {
            let index = Int(arc4random_uniform(UInt32(possibleEvents.count)))
            events.append(possibleEvents[index])
            possibleEvents.remove(at: index)
        }
        
        completedEvents = [false, false, false, false]
    }
    
    fileprivate func resetLocations() {
        possibleLocations = [.bar, .library, .gym, .park, .cafe, .beach, .concert, .cinema, .stadium]
    }
    
    fileprivate func endStateText() -> String {
        var victoryType = SuccessType.failure
        
        eventOutcomes.sort(by: { (first, second) -> Bool in
            return first.rawValue > second.rawValue
        })
        
        var overwhelming = false
        var moderate = false
        var success = false
        
        switch eventOutcomes.count {
        case 1:
            overwhelming = eventOutcomes[0] == .overwhelmingSuccess
            moderate = eventOutcomes[0] == .moderateSuccess
            success = eventOutcomes[0] == .success
            
        case 2:
            overwhelming = eventOutcomes[0] == .overwhelmingSuccess && eventOutcomes[1] != .failure
            moderate = eventOutcomes[0] == .moderateSuccess && eventOutcomes[1] != .failure
            success = eventOutcomes[0] == .overwhelmingSuccess
            success = success || (eventOutcomes[0] == .success && eventOutcomes[1] == .success)
            
        case 3:
            overwhelming = eventOutcomes[0] == .overwhelmingSuccess &&
                               eventOutcomes[1].rawValue >= SuccessType.moderateSuccess.rawValue &&
                               eventOutcomes[2] != .failure
            moderate = eventOutcomes[0] == .moderateSuccess &&
                           eventOutcomes[1] != .failure &&
                           eventOutcomes[2] != .failure
            success = eventOutcomes[0] == .success && eventOutcomes[1] == .success && eventOutcomes[2] == .success
            success = success || (eventOutcomes[0] == .overwhelmingSuccess &&
                                  eventOutcomes[1].rawValue >= SuccessType.success.rawValue)
            
        case 4:
            overwhelming = eventOutcomes[0] == .overwhelmingSuccess &&
                               eventOutcomes[1] == .overwhelmingSuccess &&
                               eventOutcomes[2] != .failure &&
                               eventOutcomes[3] != .failure
            moderate = eventOutcomes[0].rawValue >= SuccessType.moderateSuccess.rawValue &&
                           eventOutcomes[1].rawValue >= SuccessType.moderateSuccess.rawValue &&
                           eventOutcomes[2] != .failure &&
                           eventOutcomes[3] != .failure
            success = eventOutcomes[0] == .success &&
                          eventOutcomes[1] == .success &&
                          eventOutcomes[2] == .success &&
                          eventOutcomes[3] == .success
            success = success || (eventOutcomes[0] == .overwhelmingSuccess &&
                                  eventOutcomes[1].rawValue >= SuccessType.success.rawValue &&
                                  eventOutcomes[2].rawValue >= SuccessType.success.rawValue)
            success = success || (eventOutcomes[0] == .overwhelmingSuccess &&
                                  eventOutcomes[1] == .overwhelmingSuccess)
            
        default:
            break
        }
        
        if overwhelming {
            victoryType = .overwhelmingSuccess
        } else if moderate {
            victoryType = .moderateSuccess
        } else if success {
            victoryType = .success
        } else {
            victoryType = .failure
        }
        
        switch victoryType {
        case .overwhelmingSuccess:
            return "This is an overwhelming success"
        case .moderateSuccess:
            return "This is a moderate success"
        case .success:
            return "This is a success"
        case .failure:
            return "This is a failure"
        }
    }
}


// MARK: - HomeViewControllerDelegate

extension GameNavigationController: HomeViewControllerDelegate {
    func didTapStart() {
        let introViewController = StoryViewController(text: introText)
        introViewController.delegate = self
        show(introViewController, sender: self)
    }
}


// MARK: - StoryViewControllerDelegate

extension GameNavigationController: StoryViewControllerDelegate {
    func didTapNext() {
        if gameDone == true {
            gameDelegate?.gameFinished()
            return
        }
        
        if trainingComplete == false {
            let characterSelectViewController = CharacterSelectViewController()
            characterSelectViewController.delegate = self
            show(characterSelectViewController, sender: self)
        } else {
            startEvents()
            let eventSelectViewController = EventSelectViewController(character: characters[currentCharacter], events: events, completed: completedEvents)
            eventSelectViewController.delegate = self
            show(eventSelectViewController, sender: self)
        }
    }
}


// MARK: - CharacterSelectViewControllerDelegate

extension GameNavigationController: CharacterSelectViewControllerDelegate {
    func didSelect(characters: [Character]) {
        self.characters = characters
        trainingComplete = true
        resetLocations()
        
        let character = characters[currentCharacter]
        let stageSelectViewController = StageSelectViewController(character: character, locations: possibleLocations)
        stageSelectViewController.delegate = self
        
        show(stageSelectViewController, sender: self)
    }
}


// MARK: - StageSelectViewControllerDelegate

extension GameNavigationController: StageSelectViewControllerDelegate {
    func didSelect(location: Location) {
        let activitySelectViewController = ActivitySelectViewController(location: location, character: characters[currentCharacter])
        activitySelectViewController.delegate = self
        present(activitySelectViewController, animated: false, completion: nil)
    }
}


// MARK: - ActivitySelectViewController

extension GameNavigationController: ActivitySelectViewControllerDelegate {
    func completedActivity(at location: Location) {
        // Dismiss the activity view controller, and the previous stage select view controller
        dismiss(animated: false, completion: nil)
        popViewController(animated: false)
        
        for x in 0..<possibleLocations.count {
            if possibleLocations[x] == location {
                possibleLocations.remove(at: x)
                break
            }
        }
        
        currentCharacter += 1
        if currentCharacter >= characters.count {
            currentCharacter = 0
            roundsComplete += 1
            resetLocations()
            
            if roundsComplete >= 1 {
                // Move on to events
                let transitionViewController = StoryViewController(text: transitionText)
                transitionViewController.delegate = self
                pushViewController(transitionViewController, animated: false)
                return
            }
        }
        
        // Next activity
        let character = characters[currentCharacter]
        let stageSelectViewController = StageSelectViewController(character: character, locations: possibleLocations)
        stageSelectViewController.delegate = self
        pushViewController(stageSelectViewController, animated: false)
    }
}


// MARK: - EventSelectViewControllerDelegate

extension GameNavigationController: EventSelectViewControllerDelegate {
    func didSelect(event: Event) {
        for x in 0..<events.count {
            if event == events[x] {
                completedEvents[x] = true
                break
            }
        }
        
        let eventViewController = EventViewController(event: event, character: characters[currentCharacter])
        eventViewController.delegate = self
        present(eventViewController, animated: false, completion: nil)
    }
}


// MARK: - EventViewControllerDelegate

extension GameNavigationController: EventViewControllerDelegate {
    func completedEvent(with success: SuccessType) {
        eventOutcomes.append(success)
        
        // Dismiss the event view controller, and the previous event select view controller
        dismiss(animated: false, completion: nil)
        popViewController(animated: false)
        
        currentCharacter += 1
        if currentCharacter >= characters.count {
            gameDone = true
            
            let endText = endStateText()
            
            let endViewController = StoryViewController(text: endText, end: true)
            endViewController.delegate = self
            pushViewController(endViewController, animated: false)
            return
        }
        
        // Next activity
        let eventSelectViewController = EventSelectViewController(character: characters[currentCharacter], events: events, completed: completedEvents)
        eventSelectViewController.delegate = self
        pushViewController(eventSelectViewController, animated: false)
    }
}




