//
//  StageSelectViewController.swift
//  CreativeProject
//
//  Created by Milla J. Vilkki on 3/28/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class StageSelectViewController: UIViewController {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var characterImageView: UIImageView!
    
    let locations: [Location] = [.bar, .library, .gym, .park, .cafe, .beach, .concert, .cinema, .stadium]
    let currentCharacter: Character
    
    private var selectedLocation = 0
    
    init(character: Character) {
        currentCharacter = character
        
        super.init(nibName: String(describing: StageSelectViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = locations[selectedLocation].image()
        characterImageView.image = currentCharacter.image
    }
    
    @IBAction private func previousLocation() {
        selectedLocation = selectedLocation <= 0 ? locations.count - 1 : selectedLocation - 1
        updateImage()
    }
    
    @IBAction private func nextLocation() {
        selectedLocation = selectedLocation >= locations.count - 1 ? 0 : selectedLocation + 1
        updateImage()
    }
    
    private func updateImage() {
        UIView.transition(with: backgroundImageView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.backgroundImageView.image = self.locations[self.selectedLocation].image()
        }, completion: nil)
    }
    
}
