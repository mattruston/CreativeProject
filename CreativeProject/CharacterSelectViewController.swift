//
//  CharacterSelectViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/28/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol CharacterSelectViewControllerDelegate: class {
    func didSelect()
}

class CharacterSelectViewController: UIViewController {
    
    weak var delegate: CharacterSelectViewControllerDelegate?
    
    @IBOutlet weak var character1Icon: UIImageView!
    @IBOutlet weak var character2Icon: UIImageView!
    @IBOutlet weak var character3Icon: UIImageView!
    @IBOutlet weak var character4Icon: UIImageView!
    
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

    }
    
    func image1Tapped(sender: UITapGestureRecognizer) {
        character1Icon.isHighlighted = !character1Icon.isHighlighted
    }
    
    func image2Tapped(sender: UITapGestureRecognizer) {
        character2Icon.isHighlighted = !character2Icon.isHighlighted
    }
    
    func image3Tapped(sender: UITapGestureRecognizer) {
        character3Icon.isHighlighted = !character3Icon.isHighlighted
    }
    
    func image4Tapped(sender: UITapGestureRecognizer) {
        character4Icon.isHighlighted = !character4Icon.isHighlighted
    }
    
    @IBAction func next() {
        delegate?.didSelect()
    }
}
