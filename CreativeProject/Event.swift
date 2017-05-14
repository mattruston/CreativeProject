//
//  Event.swift
//  CreativeProject
//
//  Created by Matthew Ruston on 5/13/17.
//  Copyright © 2017 MillaVilkki. All rights reserved.
//

import UIKit

enum SuccessType: Int {
    case failure = 0
    case success = 1
    case moderateSuccess = 2
    case overwhelmingSuccess = 3
}

struct EventResults {
    var text = ""
    var success: SuccessType = .failure
    var image: UIImage?
}

enum Event {
    case weddingCakeMaking
    
    
    func title() -> String {
        switch self {
        case .weddingCakeMaking:
            return "Wedding Cake Making"
        }
    }
    
    func results(for character: Character) -> EventResults {
        switch self {
        case .weddingCakeMaking:
            return weddingCakeResults(for: character)
        }
    }
    
    
    // MARK: - Helper Functions
    
    private func eventSuccess(for value: Int) -> Int {
        let bounds = [11, 15, 19]
        var score = 0
        
        for x in bounds {
            if value < x {
                return score
            }
            score += 1
        }
        
        return score
    }
    
    
    // MARK: - Wedding Cake Making
    
    private func weddingCakeResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "weddingcake")
        
        let finesse = eventSuccess(for: character.finesse)
        var bestType = Trait.finesse
        var bestScore = finesse
        
        let charm = eventSuccess(for: character.charm)
        if charm > bestScore {
            bestType = .charm
            bestScore = charm
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = ""
            return results
        }
        
        switch bestType {
        case .finesse:
            switch success {
            case .success:
                results.text = ""
            case .moderateSuccess:
                results.text = ""
            case .overwhelmingSuccess:
                results.text = ""
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = ""
            case .moderateSuccess:
                results.text = ""
            case .overwhelmingSuccess:
                results.text = ""
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
}



