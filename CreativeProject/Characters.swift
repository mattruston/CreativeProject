//
//  Characters.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

enum CharacterType {
    case character1
    case character2
    case character3
    case character4
    
    func image() -> UIImage {
        switch self {
        case .character1:
            return #imageLiteral(resourceName: "character1icon")
        case .character2:
            return #imageLiteral(resourceName: "character2icon")
        case .character3:
            return #imageLiteral(resourceName: "character3icon")
        case .character4:
            return #imageLiteral(resourceName: "character4icon")
        }
    }
}

class Character {
    var type: CharacterType = .character1
    var brawn = 5
    var endurance = 5
    var agility = 5
    var finesse = 5
    var wits = 5
    var magic = 5
    var charm = 5
    
    var image: UIImage {
        return type.image()
    }
}
