//
//  GameNavigationController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class GameNavigationController: UINavigationController {
    
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
    func didSelect() {
        let character = Character()
        let stageSelectViewController = StageSelectViewController(character: character)
        show(stageSelectViewController, sender: self)
    }
}
