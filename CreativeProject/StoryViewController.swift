//
//  StoryViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet fileprivate weak var label: UILabel!
    @IBOutlet fileprivate weak var nextButton: UIButton!
    
    fileprivate let text = "There once was a child named bill bob. He was often teased as a child for having the name of a man, and for that he grew up quite quickly and with the responsibilities of an adult. By the age of five he was running his own lumber mill, and did so quite successfully."
    fileprivate var charactersShown = 0
    fileprivate var pauseTime = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}
