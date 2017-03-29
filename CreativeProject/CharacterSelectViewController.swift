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
    
    @IBAction func next() {
        delegate?.didSelect()
    }
}
