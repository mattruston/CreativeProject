//
//  EventViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol EventViewControllerDelegate: class {
    func completedEvent(with success: SuccessType)
}

class EventViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    private let character: Character
    private let event: Event
    private var success: SuccessType = .failure
    
    weak var delegate: EventViewControllerDelegate?
    
    init(event: Event, character: Character) {
        self.event = event
        self.character = character
        
        super.init(nibName: String(describing: EventViewController.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let results = event.results(for: character)
        textLabel.text = results.text
        imageView.image = results.image
        success = results.success
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) { 
            self.imageView.alpha = 1
            self.textLabel.alpha = 1
        }
    }
    
    @IBAction private func done() {
        delegate?.completedEvent(with: success)
    }
    
}
