//
//  ActivitySelectViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol ActivitySelectViewControllerDelegate: class {
    func completedActivity()
}

class ActivitySelectViewController: UIViewController {
    
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var actionImageView: UIImageView!
    @IBOutlet private weak var optionOneButton: UIButton!
    @IBOutlet private weak var optionTwoButton: UIButton!
    @IBOutlet private weak var optionThreeButton: UIButton!
    @IBOutlet private weak var secondaryOneButton: UIButton!
    @IBOutlet private weak var secondaryTwoButton: UIButton!
    @IBOutlet private weak var firstStackView: UIStackView!
    @IBOutlet private weak var secondStackView: UIStackView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var touchOverlay: UIView!
    
    @IBOutlet private weak var centerConstraint: NSLayoutConstraint!
    @IBOutlet private weak var bottomConstraint: NSLayoutConstraint!
    
    private let location: Location
    private let currentCharacter: Character
    private var selectedAction = 0
    
    weak var delegate: ActivitySelectViewControllerDelegate?
    
    init(location: Location, character: Character) {
        self.location = location
        self.currentCharacter = character
        
        super.init(nibName: String(describing: ActivitySelectViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = location.image()
        setUpButtons()
    }
    
    private func setUpButtons() {
        let options = location.options()
        optionOneButton.setTitle(options[0], for: .normal)
        optionTwoButton.setTitle(options[1], for: .normal)
        optionThreeButton.setTitle(options[2], for: .normal)
    }
    
    @IBAction private func optionOne() {
        selectedAction += 1
        displaySecondOptions()
    }
    
    @IBAction private func optionTwo() {
        selectedAction += 2
        displaySecondOptions()
    }
    
    @IBAction private func optionThree() {
        selectedAction += 3
        displaySecondOptions()
    }
    
    @IBAction private func secondaryOne() {
        selectedAction += 10
        displayActivityText()
    }
    
    @IBAction private func secondaryTwo() {
        selectedAction += 20
        displayActivityText()
    }
    
    private func displaySecondOptions() {
        let secondOptions = location.options(for: selectedAction)
        if secondOptions.count == 0 {
            displayActivityText()
            return
        }
        
        secondaryOneButton.setTitle(secondOptions[0], for: .normal)
        secondaryTwoButton.setTitle(secondOptions[1], for: .normal)
        
        disablePrimaryButtons()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.firstStackView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: { 
                self.secondStackView.alpha = 1
            })
        }
    }
    
    private func displayActivityText() {
        guard let results = location.results(for: selectedAction) else {
            return
        }
        
        disablePrimaryButtons()
        secondaryOneButton.isEnabled = false
        secondaryTwoButton.isEnabled = false
        actionImageView.image = results.image
        resultLabel.text = results.text
        updateCharacter(for: results)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.secondStackView.alpha = 0
            self.firstStackView.alpha = 0
        }) { _ in
            self.centerConstraint.isActive = false
            self.bottomConstraint.isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            }) { _ in
                UIView.animate(withDuration: 0.3, animations: { 
                    self.actionImageView.alpha = 1
                    self.resultLabel.alpha = 1
                    self.setUpContinueOverlay()
                })
            }
        }
    }
    
    private func updateCharacter(for results: ActivityResults) {
        currentCharacter.agility += results.agility
        currentCharacter.brawn += results.brawn
        currentCharacter.charm += results.charm
        currentCharacter.endurance += results.endurance
        currentCharacter.finesse += results.finesse
        currentCharacter.magic += results.magic
        currentCharacter.wits += results.wits
    }
    
    private func disablePrimaryButtons() {
        optionOneButton.isEnabled = false
        optionTwoButton.isEnabled = false
        optionThreeButton.isEnabled = false
    }
    
    private func setUpContinueOverlay() {
        touchOverlay.isHidden = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(done))
        touchOverlay.addGestureRecognizer(tapGesture)
    }
    
    @objc private func done() {
        delegate?.completedActivity()
    }
    
}
