//
//  HomeViewController.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 3/26/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func didTapStart()
}

class HomeViewController: UIViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func start() {
        delegate?.didTapStart()
    }
}
