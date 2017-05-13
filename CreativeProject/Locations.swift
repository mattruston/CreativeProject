//
//  Locations.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

enum Location {
    case bar
    case library
    case gym
    case park
    case cafe
    case beach
    case concert
    case cinema
    case stadium
    
    func image() -> UIImage {
        switch self {
        case .bar:
            return #imageLiteral(resourceName: "barlocation")
        case .library:
            return #imageLiteral(resourceName: "librarylocation")
        case .gym:
            return #imageLiteral(resourceName: "gymlocation")
        case .park:
            return #imageLiteral(resourceName: "parklocation")
        case .cafe:
            return #imageLiteral(resourceName: "cafelocation")
        case .beach:
            return #imageLiteral(resourceName: "beachlocation")
        case .concert:
            return #imageLiteral(resourceName: "concertlocation")
        case .cinema:
            return #imageLiteral(resourceName: "cinemalocation")
        case .stadium:
            return #imageLiteral(resourceName: "stadiumlocation")
        }
    }
}
