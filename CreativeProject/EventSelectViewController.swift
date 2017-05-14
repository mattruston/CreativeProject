//
//  EventSelectViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class EventSelectViewController: UIViewController {
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var eventOneButton: UIButton!
    @IBOutlet private weak var eventTwoButton: UIButton!
    @IBOutlet private weak var eventThreeButton: UIButton!
    @IBOutlet private weak var eventFourButton: UIButton!
    
    @IBOutlet private weak var brawnLabel: UILabel!
    @IBOutlet private weak var enduranceLabel: UILabel!
    @IBOutlet private weak var agilityLabel: UILabel!
    @IBOutlet private weak var finesseLabel: UILabel!
    @IBOutlet private weak var witsLabel: UILabel!
    @IBOutlet private weak var magicLabel: UILabel!
    @IBOutlet private weak var charmLabel: UILabel!
    
    private let events = [1, 2, 3, 4]
    private let currentCharacter: Character
    
    init(character: Character) {
        self.currentCharacter = character
        
        super.init(nibName: String(describing: EventSelectViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventOneButton.setTitleColor(UIColor.lightText, for: .disabled)
        eventTwoButton.setTitleColor(UIColor.lightText, for: .disabled)
        eventThreeButton.setTitleColor(UIColor.lightText, for: .disabled)
        eventFourButton.setTitleColor(UIColor.lightText, for: .disabled)
        characterImageView.image = currentCharacter.image
        displayCharacterStats()
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
