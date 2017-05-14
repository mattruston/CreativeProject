//
//  EventSelectViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol EventSelectViewControllerDelegate: class {
    func didSelect(event: Event)
}

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
    
    private let events: [Event]
    private let completedEvents: [Bool]
    private let currentCharacter: Character
    
    weak var delegate: EventSelectViewControllerDelegate?
    
    init(character: Character, events: [Event], completed: [Bool]) {
        self.currentCharacter = character
        self.events = events
        self.completedEvents = completed
        
        super.init(nibName: String(describing: EventSelectViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
        characterImageView.image = currentCharacter.image
        displayCharacterStats()
    }
    
    private func setUpButtons() {
        let buttons = [eventOneButton, eventTwoButton, eventThreeButton, eventFourButton]
        
        for x in 0..<buttons.count {
            let button = buttons[x]
            let event = events[x]
            let used = completedEvents[x]
            
            button?.setTitleColor(UIColor.lightGray, for: .disabled)
            button?.isEnabled = !used
            button?.setTitle(event.title(), for: .normal)
            button?.titleLabel?.numberOfLines = 2
            button?.titleLabel?.lineBreakMode = .byWordWrapping
            button?.titleLabel?.textAlignment = .center
        }
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
    
    @IBAction private func selectedEventOne() {
        delegate?.didSelect(event: events[0])
    }
    
    @IBAction private func selectedEventTwo() {
        delegate?.didSelect(event: events[1])
    }
    
    @IBAction private func selectedEventThree() {
        delegate?.didSelect(event: events[2])
    }
    
    @IBAction private func selectedEventFour() {
        delegate?.didSelect(event: events[3])
    }
}
