//
//  StageSelectViewController.swift
//  CreativeProject
//
//  Created by Milla J. Vilkki on 3/28/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol StageSelectViewControllerDelegate: class {
    func didSelect(location: Location)
}

class StageSelectViewController: UIViewController {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var brawnLabel: UILabel!
    @IBOutlet private weak var enduranceLabel: UILabel!
    @IBOutlet private weak var agilityLabel: UILabel!
    @IBOutlet private weak var finesseLabel: UILabel!
    @IBOutlet private weak var witsLabel: UILabel!
    @IBOutlet private weak var magicLabel: UILabel!
    @IBOutlet private weak var charmLabel: UILabel!
    
    let locations: [Location] = [.bar, .library, .gym, .park, .cafe, .beach, .concert, .cinema, .stadium]
    let currentCharacter: Character
    weak var delegate: StageSelectViewControllerDelegate?
    
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
        displayCharacterStats()
    }
    
    @IBAction private func previousLocation() {
        selectedLocation = selectedLocation <= 0 ? locations.count - 1 : selectedLocation - 1
        updateImage()
    }
    
    @IBAction private func nextLocation() {
        selectedLocation = selectedLocation >= locations.count - 1 ? 0 : selectedLocation + 1
        updateImage()
    }
    
    @IBAction private func select() {
        delegate?.didSelect(location: locations[selectedLocation])
    }
    
    private func updateImage() {
        UIView.transition(with: backgroundImageView, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.backgroundImageView.image = self.locations[self.selectedLocation].image()
        }, completion: nil)
    }
    
    private func displayCharacterStats() {
        brawnLabel.text = String(currentCharacter.brawn)
        enduranceLabel.text = String(currentCharacter.endurance)
        agilityLabel.text = String(currentCharacter.agility)
        finesseLabel.text = String(currentCharacter.finesse)
        witsLabel.text = String(currentCharacter.wits)
        magicLabel.text = String(currentCharacter.magic)
        charmLabel.text = String(currentCharacter.charm)
    }
    
}
