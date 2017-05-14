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
    
    func options() -> [String] {
        switch self {
        case .bar:
            return barOptions()
        default:
            return []
        }
        
    }
    
    func options(for option: Int) -> [String] {
        switch self {
        case .bar:
            return []//barOptions(for: option)
        default:
            return []
        }
    }
    
    func results(for option: Int) -> ActivityResults? {
        switch self {
        case .bar:
            return barResults(for: option)
        default:
            return nil
        }
        
//        switch option {
//        case 1:
//        case 2:
//        case 3:
//        case 11:
//        case 12:
//        case 13:
//        case 21:
//        case 22:
//        case 23:
//        default:
//            return nil
//        }
    }
    
    
    // MARK: - Bar info
    
    private func barOptions() -> [String] {
        return ["Drink", "Flirt", "Dance"]
    }
    
    private func barOptions(for option: Int) -> [String] {
        switch option {
        case 1:
            return []
        case 2:
            return []
        case 3:
            return []
        default:
            return []
        }
    }
    
    private func barResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.endurance = 2
            results.text = "You watch the week pass by from a comfortable seat at the local bar. Company comes and goes as you sit, but at least the beverages are consistantly delicious."
            results.image = #imageLiteral(resourceName: "drinking")
        case 2:
            results.charm = 1
            results.wits = 1
            results.text = "You decide to pass your time by taking your chance at winning the numbers of any and all you see at your favorite bar. You as well as those you throw your corny pickup lines at have a good time."
            results.image = #imageLiteral(resourceName: "flirting")
        case 3:
            results.finesse = 2
            results.text = "You find your time best spent on the dance floor of your preferred bar. You alternate between dancing solo and wtih various partners until the week comes to an end."
            results.image = #imageLiteral(resourceName: "dance")
        default:
            return nil
        }
        
        return results
    }
}


struct ActivityResults {
    var text = ""
    var image: UIImage?
    var brawn = 0
    var endurance = 0
    var agility = 0
    var finesse = 0
    var wits = 0
    var magic = 0
    var charm = 0
}
