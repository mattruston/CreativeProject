//
//  CharacterSelectViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/28/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol CharacterSelectViewControllerDelegate: class {
    func didSelect(characters: [Character])
}

class CharacterSelectViewController: UIViewController {
    
    weak var delegate: CharacterSelectViewControllerDelegate?
    
    @IBOutlet weak var character1Icon: UIImageView!
    @IBOutlet weak var character2Icon: UIImageView!
    @IBOutlet weak var character3Icon: UIImageView!
    @IBOutlet weak var character4Icon: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let character1Tapped = UITapGestureRecognizer(target: self, action: #selector(self.image1Tapped(sender:)))
        character1Tapped.numberOfTapsRequired = 1
        character1Icon.addGestureRecognizer(character1Tapped)
        character1Icon.isUserInteractionEnabled = true
        
        let character2Tapped = UITapGestureRecognizer(target: self, action: #selector(self.image2Tapped(sender:)))
        character2Tapped.numberOfTapsRequired = 1
        character2Icon.addGestureRecognizer(character2Tapped)
        character2Icon.isUserInteractionEnabled = true
        
        let character3Tapped = UITapGestureRecognizer(target: self, action: #selector(self.image3Tapped(sender:)))
        character3Tapped.numberOfTapsRequired = 1
        character3Icon.addGestureRecognizer(character3Tapped)
        character3Icon.isUserInteractionEnabled = true
        
        let character4Tapped = UITapGestureRecognizer(target: self, action: #selector(self.image4Tapped(sender:)))
        character4Tapped.numberOfTapsRequired = 1
        character4Icon.addGestureRecognizer(character4Tapped)
        character4Icon.isUserInteractionEnabled = true
        
        continueButton.setTitleColor(UIColor.lightText, for: .disabled)
        continueButton.setTitleColor(UIColor.white, for: .normal)

    }
    
    func image1Tapped(sender: UITapGestureRecognizer) {
        character1Icon.isHighlighted = !character1Icon.isHighlighted
        updateButton()
    }
    
    func image2Tapped(sender: UITapGestureRecognizer) {
        character2Icon.isHighlighted = !character2Icon.isHighlighted
        updateButton()
    }
    
    func image3Tapped(sender: UITapGestureRecognizer) {
        character3Icon.isHighlighted = !character3Icon.isHighlighted
        updateButton()
    }
    
    func image4Tapped(sender: UITapGestureRecognizer) {
        character4Icon.isHighlighted = !character4Icon.isHighlighted
        updateButton()
    }
    
    private func updateButton() {
        continueButton.isEnabled = character1Icon.isHighlighted || character2Icon.isHighlighted || character3Icon.isHighlighted || character4Icon.isHighlighted
    }
    
    @IBAction func next() {
        var selectedCharacters: [Character] = []
        
        if character1Icon.isHighlighted {
            let character = Character()
            character.type = .character1
            selectedCharacters.append(character)
        }
        
        if character2Icon.isHighlighted {
            let character = Character()
            character.type = .character2
            selectedCharacters.append(character)
        }
        
        if character3Icon.isHighlighted {
            let character = Character()
            character.type = .character3
            selectedCharacters.append(character)
        }
        
        if character4Icon.isHighlighted {
            let character = Character()
            character.type = .character4
            selectedCharacters.append(character)
        }
        
        delegate?.didSelect(characters: selectedCharacters)
    }
}
