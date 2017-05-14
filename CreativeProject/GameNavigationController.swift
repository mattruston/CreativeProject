//
//  GameNavigationController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class GameNavigationController: UINavigationController {
    
    let introText = "Hi"//"Rumors speak of a spontaneous worldwide competition, one that occurs with little warning. The last supposed occurrence featured events no nation had been able to predict such as cookie baking and horse grooming, but that was centuries ago.\nJust today, the seers appeared once again, unseen for almost three hundred years. The Miramortem Games were announced with the date set for two months down the line. They listed off the participants, and you were included as one of many to represent your nation. No hints are given as to what the nations will be tested on come time of the event, but everyone knows that placing last will have negative consequences.\n\nAfter all, the last nation to supposedly have lost no longer exists."
    
    let transitionText = "hi"
    
    fileprivate var characters: [Character] = []
    fileprivate var currentCharacter = 0
    fileprivate var roundsComplete = 0
    fileprivate var trainingComplete = false
    
    fileprivate var events: [Event] = []
    fileprivate var completedEvents: [Bool] = []
    fileprivate var eventOutcomes: [SuccessType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        viewControllers = [homeViewController]
        
        isNavigationBarHidden = true
    }
    
    fileprivate func startEvents() {
        var possibleEvents: [Event] = [.weddingCakeMaking, .weddingCakeMaking, .weddingCakeMaking, .weddingCakeMaking]
        for _ in 0..<4 {
            let index = Int(arc4random_uniform(UInt32(possibleEvents.count)))
            events.append(possibleEvents[index])
            possibleEvents.remove(at: index)
        }
        
        completedEvents = [false, false, false, false]
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
        if trainingComplete == false {
            let characterSelectViewController = CharacterSelectViewController()
            characterSelectViewController.delegate = self
            show(characterSelectViewController, sender: self)
        } else {
            startEvents()
            let eventSelectViewController = EventSelectViewController(character: characters[currentCharacter], events: events, completed: completedEvents)
            show(eventSelectViewController, sender: self)
        }
    }
}


// MARK: - CharacterSelectViewControllerDelegate

extension GameNavigationController: CharacterSelectViewControllerDelegate {
    func didSelect(characters: [Character]) {
        self.characters = characters
        trainingComplete = true
        
        let character = characters[currentCharacter]
        let stageSelectViewController = StageSelectViewController(character: character)
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
    func completedActivity() {
        // Dismiss the activity view controller, and the previous stage select view controller
        dismiss(animated: false, completion: nil)
        popViewController(animated: false)
        
        currentCharacter += 1// currentCharacter >= characters.count - 1 ? 0 : currentCharacter + 1
        if currentCharacter >= characters.count {
            currentCharacter = 0
            roundsComplete += 1
            
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
        let stageSelectViewController = StageSelectViewController(character: character)
        stageSelectViewController.delegate = self
        pushViewController(stageSelectViewController, animated: false)
    }
}


