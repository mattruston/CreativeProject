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
        case .library:
            return libraryOptions()
        case .gym:
            return gymOptions()
        case .park:
            return parkOptions()
        case .cafe:
            return cafeOptions()
        case .beach:
            return beachOptions()
        case .concert:
            return concertOptions()
        case .cinema:
            return cinemaOptions()
        case .stadium:
            return stadiumOptions()
        }
        
    }
    
    func options(for option: Int) -> [String] {
        switch self {
        case .park:
            return parkOptions(for: option)
        case .cafe:
            return cafeOptions(for: option)
        case .beach:
            return beachOptions(for: option)
        case .cinema:
            return cinemaOptions(for: option)
        case .stadium:
            return stadiumOptions(for: option)
        default:
            return []
        }
    }
    
    func results(for option: Int) -> ActivityResults? {
        switch self {
        case .bar:
            return barResults(for: option)
        case .library:
            return libraryResults(for: option)
        case .gym:
            return gymResults(for: option)
        case .park:
            return parkResults(for: option)
        case .cafe:
            return cafeResults(for: option)
        case .beach:
            return beachResults(for: option)
        case .concert:
            return concertResults(for: option)
        case .cinema:
            return cinemaResults(for: option)
        case .stadium:
            return stadiumResults(for: option)
        }
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
            results.text = "You watch the week pass by from a comfortable seat at the local bar. Company comes and goes as you sit, but at least the beverages are consistently delicious."
            results.image = #imageLiteral(resourceName: "drinking")
        case 2:
            results.charm = 1
            results.wits = 1
            results.text = "You decide to pass your time by taking your chance at winning the numbers of any and all you see at your favorite bar. You as well as those you throw your corny pickup lines at have a good time."
            results.image = #imageLiteral(resourceName: "flirting")
        case 3:
            results.finesse = 2
            results.text = "You find your time best spent on the dance floor of your preferred bar. You alternate between dancing solo and with various partners until the week comes to an end."
            results.image = #imageLiteral(resourceName: "dance")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Library info
    
    private func libraryOptions() -> [String] {
        return ["Put Books Away", "Read", "Study Magic"]
    }
    
    private func libraryOptions(for option: Int) -> [String] {
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
    
    private func libraryResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.brawn = 1
            results.agility = 1
            results.text = "For the entirety of the week, you commit yourself to volunteering at the library. You put book after book on the many shelves, getting faster with each return you replace."
            results.image = #imageLiteral(resourceName: "workinglibrary")
        case 2:
            results.wits = 2
            results.text = "You lock yourself within the comfortable walls of the library for a week, diving into book after book, exploring all the genres you can think of. You find yourself feeling a little more knowledgeable when all is said and done."
            results.image = #imageLiteral(resourceName: "read")
        case 3:
            results.magic = 2
            results.text = "You find yourself drawn to the many research novels about the arcane. You study spell after spell, potion after potion, committing as much of it as you can to memory."
            results.image = #imageLiteral(resourceName: "magicstudy")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Gym info
    
    private func gymOptions() -> [String] {
        return ["Strength Training", "Endurance Training", "Agility Training"]
    }
    
    private func gymOptions(for option: Int) -> [String] {
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
    
    private func gymResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.brawn = 2
            results.text = "The weights draw your eye the moment you arrive at the gym. You throw yourself at them with unparalleled enthusiasm, pushing your limits a little bit each day you go."
            results.image = #imageLiteral(resourceName: "strengthtraining")
        case 2:
            results.endurance = 2
            results.text = "While treadmills may not be the most exciting way to spend your time, you find yourself jogging along quite comfortably all week. With each run, you go a little further."
            results.image = #imageLiteral(resourceName: "endurancetraining")
        case 3:
            results.agility = 1
            results.finesse = 1
            results.text = "You do various exercises throughout the gym to improve your reaction time and processing ability. By the end of the week, you’re feeling like you could catch almost anything thrown suddenly at you."
            results.image = #imageLiteral(resourceName: "agilitytraining")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Park info
    
    private func parkOptions() -> [String] {
        return ["Play with Dogs", "Cloud Watch", "Rearrange Benches..."]
    }
    
    private func parkOptions(for option: Int) -> [String] {
        switch option {
        case 3:
            return ["...with Force", "...with Magic"]
        default:
            return []
        }
    }
    
    private func parkResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.agility = 1
            results.endurance = 1
            results.text = "You decide to make the most of the week by going to the park and playing with not only your own dog but with the dogs of others as well. You run around with them, throw things for them, and just generally have a grand time."
            results.image = #imageLiteral(resourceName: "dogplaying")
        case 2:
            results.wits = 2
            results.text = "Since you don’t want to stress yourself out too much, you take a week to simply relax and watch the clouds. You observe their paths across the sky and make note of the various shapes they take."
            results.image = #imageLiteral(resourceName: "cloudwatching")
        case 13:
            results.brawn = 2
            results.text = "While passing through the park, you feel the benches need some rearrangement, so you do just that using your muscles. You move every single bench you see with trained strength."
            results.image = #imageLiteral(resourceName: "benches")
        case 23:
            results.magic = 2
            results.text = "While passing through the park, you feel the benches need some rearrangement, so you do just that using your magic. You cast a single spell to move all of the benches where you want them to be."
            results.image = #imageLiteral(resourceName: "benches")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Cafe info
    
    private func cafeOptions() -> [String] {
        return ["Write", "People...", "Work..."]
    }
    
    private func cafeOptions(for option: Int) -> [String] {
        switch option {
        case 2:
            return ["...Watch", "...Control"]
        case 3:
            return ["...as Barista", "...Storage"]
        default:
            return []
        }
    }
    
    private func cafeResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.wits = 2
            results.text = "Like many before you, you spend your time attempting to throw together something worth either publishing or producing into a film. You feel like you’ve made progress by week’s end."
            results.image = #imageLiteral(resourceName: "writing")
        case 12:
            results.charm = 2
            results.text = "You figure you might as well have some fun during the week and decide to spend your time by watching people as they go about their business. You pay close attention to how they stand, what they order, how they wait, learning a little bit about people as you do so."
            results.image = #imageLiteral(resourceName: "people")
        case 13:
            results.finesse = 2
            results.text = "Since you won’t always have the competition to look forward to, you choose to work during the week. You find yourself best suited behind the bar making the various coffees and mochas that people order. With each drink, you feel a little more competent."
            results.image = #imageLiteral(resourceName: "cafework")
        case 22:
            results.magic = 2
            results.text = "You figure you might as well have some fun during the week and decide to spend your time by manipulating the people around you. You cast simple spells to impact their interactions with others. While not the most morally correct choice, you enjoy yourself anyway."
            results.image = #imageLiteral(resourceName: "people")
        case 23:
            results.brawn = 2
            results.text = "Since you won’t always have the competition to look forward to, you choose to work during the week. You find yourself best suited working in the back stacking boxes. With nothing but your own company, you find it easy to focus on the task at hand."
            results.image = #imageLiteral(resourceName: "cafestorage")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Beach info
    
    private func beachOptions() -> [String] {
        return ["Swim...", "Build Sandcastle", "Bench People"]
    }
    
    private func beachOptions(for option: Int) -> [String] {
        switch option {
        case 1:
            return ["...fast", "...far"]
        default:
            return []
        }
    }
    
    private func beachResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 2:
            results.wits = 1
            results.finesse = 1
            results.text = "Enjoying the feel of sand, you pass the week building sand castle after sand castle. Each becomes more grand and magnificent than the last as you master the techniques."
            results.image = #imageLiteral(resourceName: "sandcastle")
        case 3:
            results.brawn = 2
            results.text = "You find the lack of weights at the beach annoying and decide to use the people around you as workout equipment. People begin lining up as volunteers for you to use, enjoying the experience of being benched."
            results.image = #imageLiteral(resourceName: "benching")
        case 11:
            results.agility = 2
            results.text = "The ocean calls to you and you give in, enjoying the waters, and seeing how far you can swim in a certain amount of time. With each lap you make, you finish faster than the one before."
            results.image = #imageLiteral(resourceName: "shortswim")
        case 21:
            results.endurance = 2
            results.text = "The ocean calls to you and you give in, enjoying the waters, and seeing how long you can swim. You push yourself to your limits, swimming out until you feel you can’t go any longer, and then slowly making your way back."
            results.image = #imageLiteral(resourceName: "longswim")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Concert info
    
    private func concertOptions() -> [String] {
        return ["Perform", "Attend", "Work"]
    }
    
    private func concertOptions(for option: Int) -> [String] {
        switch option {
        default:
            return []
        }
    }
    
    private func concertResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.wits = 1
            results.charm = 1
            results.text = "For a week you find yourself partaking in every performance at the concert hall, either working backstage or as a background person on the stage itself. You manage to draw attention either way."
            results.image = #imageLiteral(resourceName: "concertperformance")
        case 2:
            results.endurance = 1
            results.finesse = 1
            results.text = "You pass your time attending every performance you can, finding great pleasure in being part of the crowd. You dance and sing along with those around you for hours until you run out of energy."
            results.image = #imageLiteral(resourceName: "concertcrowd")
        case 3:
            results.brawn = 1
            results.wits = 1
            results.text = "In order to both enjoy the shows and make a little money, you work for the various events happening at the concert hall as security. You get quite the workout keeping the crowds in check."
            results.image = #imageLiteral(resourceName: "concertwork")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Cinema info
    
    private func cinemaOptions() -> [String] {
        return ["Watch Movies", "Play Arcade Games", "Sneak in..."]
    }
    
    private func cinemaOptions(for option: Int) -> [String] {
        switch option {
        case 3:
            return ["...through stealth", "...through camouflage"]
        default:
            return []
        }
    }
    
    private func cinemaResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 1:
            results.wits = 1
            results.charm = 1
            results.text = "The movie theatre finds you to be quite the regular for the week, watching movie after movie. You enjoy the experience and find yourself talking to quite a few of your fellow moviegoers between showings."
            results.image = #imageLiteral(resourceName: "moviewatching")
        case 2:
            results.finesse = 2
            results.text = "Due to a distinct lack of video games at your home, you spend the week at the arcade center. Dozens of dozens of quarters are spent on every single game, and you feel more skilled."
            results.image = #imageLiteral(resourceName: "arcadegames")
        case 13:
            results.agility = 2
            results.text = "You want to watch movies but don’t quite have the money to pay for a significant number of tickets, so you sneak into the theaters using stealth. You slip past security at every opportunity. Every close call helps you improve for your next attempt."
            results.image = #imageLiteral(resourceName: "sneaking")
        case 23:
            results.magic = 2
            results.text = "You want to watch movies but don’t quite have the money to pay for a significant number of tickets, so you sneak into the theaters using camouflage. You use magic in order to disguise yourself as nothing more than the scenery, easily slipping past any who might stop you."
            results.image = #imageLiteral(resourceName: "sneaking")
        default:
            return nil
        }
        
        return results
    }
    
    // MARK: - Stadium info
    
    private func stadiumOptions() -> [String] {
        return ["Cheer...", "Train with Team", "Run Hurdles"]
    }
    
    private func stadiumOptions(for option: Int) -> [String] {
        switch option {
        case 1:
            return ["...with Pom-Poms", "...with Magic"]
        default:
            return []
        }
    }
    
    private func stadiumResults(for option: Int) -> ActivityResults? {
        var results = ActivityResults()
        
        switch option {
        case 2:
            results.endurance = 2
            results.text = "Having many good friends on the team, you pass your time training with them as they prepare for various sporting events. They push you hard, knowing that you’re representing the country in the upcoming competition."
            results.image = #imageLiteral(resourceName: "teamtraining")
        case 3:
            results.agility = 2
            results.text = "When no one else is using the location, you set up some hurdles and use them to exercise. You focus on your task, tuning out everything else, and work yourself to exhaustion."
            results.image = #imageLiteral(resourceName: "hurdles")
        case 11:
            results.charm = 2
            results.text = "You venture to the local stadium, attending various sports events. During this time, you choose to cheer on the home team through means of pom-poms. You swing them about with great vigor, and the team approaches you after the game to thank you for your effort."
            results.image = #imageLiteral(resourceName: "cheer")
        case 21:
            results.magic = 2
            results.text = "You venture to the local stadium, attending various sports events. During this time, you choose to cheer on the home team through means of sparklers. You conjure up various small fireworks in the team colors, effectively distracting the away team by doing so."
            results.image = #imageLiteral(resourceName: "cheer")
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
