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
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var nextButton: UIButton!
    
    private let text: String
    private let end: Bool
    
    private var charactersShown = 0
    private var pauseTime = 0
    private var started = false
    
    
    weak var delegate: StoryViewControllerDelegate?
    
    init(text: String, end: Bool = false) {
        self.text = text
        self.end = end
        
        super.init(nibName: String(describing: StoryViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set font size so that there isn't too much text on smaller screens
        
        label.text = ""
        nextButton.isHidden = true
        nextButton.alpha = 0
        
        if end {
            nextButton.setTitle("DONE", for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startText()
    }
    
    private func startText() {
        if started {
            return
        }
        
        started = true
        
        Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { (timer) in
            
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
