//
//  StoryViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol StoryViewControllerDelegate: class {
    func didTapNext()
}

class StoryViewController: UIViewController {
    
    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var nextButton: UIButton!
    
    fileprivate let text = "HI"//"Rumors speak of a spontaneous worldwide competition, one that occurs with little warning. The last supposed occurrence featured events no nation had been able to predict such as cookie baking and horse grooming, but that was centuries ago.\nJust today, the seers appeared once again, unseen for almost three hundred years. The Miramortem Games were announced with the date set for two months down the line. They listed off the participants, and you were included as one of many to represent your nation. No hints are given as to what the nations will be tested on come time of the event, but everyone knows that placing last will have negative consequences.\nAfter all, the last nation to supposedly have lost no longer exists."
    
    fileprivate var charactersShown = 0
    fileprivate var pauseTime = 0
    
    weak var delegate: StoryViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set font size so that there isn't too much text on smaller screens
        
        label.text = ""
        nextButton.isHidden = true
        nextButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startText()
    }
    
    fileprivate func startText() {
        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { (timer) in
            
            if self.pauseTime != 0 {
                self.pauseTime += 1
                
                if self.pauseTime > 5 {
                    self.pauseTime = 0
                }
                return
            }
            
            self.charactersShown += 1
            
            if self.charactersShown > self.text.characters.count {
                timer.invalidate()
                
                self.nextButton.isHidden = false
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.nextButton.alpha = 1.0
                })
                
                return
            }
            
            var index = self.text.index(self.text.startIndex, offsetBy: self.charactersShown - 1)
            let character = self.text.characters[index]
            if character == " " {
                index = self.text.index(after: index)
                self.charactersShown += 1
            } else if character == "," {
                self.pauseTime = 3
            } else if character == "." {
                self.pauseTime = 1
            }
            
            self.label.text = self.text.substring(to: self.text.index(after: index))
        }
    }
    
    @IBAction func next() {
        delegate?.didTapNext()
    }
}
