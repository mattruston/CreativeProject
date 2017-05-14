//
//  GameNavigationController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class GameNavigationController: UINavigationController {
    
    fileprivate var characters: [Character] = []
    fileprivate var currentCharacter = 0
    fileprivate var roundsComplete = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = HomeViewController()
        homeViewController.delegate = self
        viewControllers = [homeViewController]
        
        isNavigationBarHidden = true
    }
}


// MARK: - HomeViewControllerDelegate

extension GameNavigationController: HomeViewControllerDelegate {
    func didTapStart() {
        let introViewController = StoryViewController()
        introViewController.delegate = self
        show(introViewController, sender: self)
    }
}


// MARK: - StoryViewControllerDelegate

extension GameNavigationController: StoryViewControllerDelegate {
    func didTapNext() {
        let characterSelectViewController = CharacterSelectViewController()
        characterSelectViewController.delegate = self
        show(characterSelectViewController, sender: self)
    }
}


// MARK: - CharacterSelectViewControllerDelegate

extension GameNavigationController: CharacterSelectViewControllerDelegate {
    func didSelect(characters: [Character]) {
        self.characters = characters
        
        let character = characters[currentCharacter]
        let stageSelectViewController = StageSelectViewController(character: character)
        stageSelectViewController.delegate = self
        
        show(stageSelectViewController, sender: self)
    }
}


// MARK: - StageSelectViewControllerDelegate

extension GameNavigationController: StageSelectViewControllerDelegate {
    func didSelect(location: Location) {
        let activitySelectViewController = ActivitySelectViewController(location: location)
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
            
            if roundsComplete >= 8 {
                // Move on to events
            }
        }
        
        // Next activity
        let character = characters[currentCharacter]
        let stageSelectViewController = StageSelectViewController(character: character)
        stageSelectViewController.delegate = self
        pushViewController(stageSelectViewController, animated: false)
    }
}


