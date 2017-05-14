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
    
    let introText = "Rumors speak of a spontaneous worldwide competition, one that occurs with little warning. The last supposed occurrence featured events no nation had been able to predict such as cookie baking and horse grooming, but that was centuries ago.\nJust today, the seers appeared once again, unseen for almost three hundred years. The Miramortem Games were announced with the date set for two months down the line. They listed off the participants, and you were included as one of many to represent your nation. No hints are given as to what the nations will be tested on come time of the event, but everyone knows that placing last will have negative consequences.\n\nAfter all, the last nation to supposedly have lost no longer exists."
    
    let transitionText = "The eight weeks allotted for training finally come to an end. You, along with all the other competitors, are flown to the event and brought into the stadium. The seers appear before the gathered people and announce the groups through which you will select your event along with the various activities in which you will compete. \nAfterwards, you and the rest of your group are guided to a small room where you decide who gets to do what..."
    
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
            return "You can feel the confidence of your fellow countrymen as you stand on the field waiting for the results. You, personally, did very well, and, from what you heard, so did everyone else chosen from your homeland. The entire audience, and likely the world, goes silent as the Seers appear on the field holding the fate of the world in their hands. They announce each event’s outcome individually before divulging the final standing. The moment your country is revealed as the winner, cheers erupt throughout the stadium, drowning out the rest of the results. Your country celebrates the victory for months, seeing an increase in tourism as well as trainees for future competitions. Of course, the foreboding fact that your country will be forced to host the next event dampens spirits slightly once the initial joy passes."
        case .moderateSuccess:
            return "You stay close to your fellow competitors, mingling with others from various nations. You make small talk for a while, discussing various successes and failures in events. One of your comrades is cut off mid-sentence by the appearance of the Seers. All eyes are glued as they make their way to the podium. Result after result is announced until it is time for the final standing. While your country didn’t manage first, they managed a solid second place. The entire populace is incredibly relieved at the result, no death and no obligation to host the next occurrence of the Miramortem Games. Business sees a small boom as other nation’s encourage visitation and study in the land that avoided all punishment."
        case .success:
            return "You worry about what the final standing of your country will be as the results of each individual event was a grab bag of successes and failures. The appearance of the Seers on the stadium grounds is followed by a wave of silence throughout the audience and competitors. They read the results of every single event, results no country could have predicted. The final standings are revealed shortly after. In the end, your country managed 3rd place, which, while better than last, is not what anyone hoped for. The people begins to blame the loss on the government, saying the lack of necessary facilities led to less than stellar result. You hear rumors of underground cults beginning to form, and you fear a revolution is to come."
        case .failure:
            return "You stand next to the rest of the competitors, eagerly awaiting the results with bated breath. Silence spreads throughout the stadium as the Seers appear, envelope in hand. As they announce the outcome of the each event, you slowly realize your country did not fare very well. As it comes to a close and final standings are announced, with your homeland in deadlast, you along with all of your countrymen cease to exist."
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
            
            if roundsComplete >= 8 {
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




