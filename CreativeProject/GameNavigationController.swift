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
        show(introViewController, sender: self)
    }
}
