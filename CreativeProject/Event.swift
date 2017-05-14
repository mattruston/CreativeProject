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
    case lightBulbChanging
    case potionMaking
    case demonSummoning
    case extremeYoyoing
    case cardThrowing
    case buildingFire
    case uprootingTree
    case perfectDate
    case ikeaFurnitureBuilding
    case presentWrapping
    case escapingCornMaze
    case catchingFly
    case flowerArranging
    case dogWalking
    
    
    func title() -> String {
        switch self {
        case .weddingCakeMaking:
            return "Wedding Cake Making"
        case .lightBulbChanging:
            return "Lightbulb Changing"
        case .potionMaking:
            return "Potion Making"
        case .demonSummoning:
            return "Demon Summoning"
        case .extremeYoyoing:
            return "Extreme Yoyo-ing"
        case .cardThrowing:
            return "Card Throwing"
        case .buildingFire:
            return "Building a Fire"
        case .uprootingTree:
            return "Uprooting a Tree"
        case .perfectDate:
            return "The Perfect Date"
        case .ikeaFurnitureBuilding:
            return "Ikea Furniture Building"
        case .presentWrapping:
            return "Present Wrapping"
        case .escapingCornMaze:
            return "Escaping a Corn Maze"
        case .catchingFly:
            return "Catching a Fly"
        case .flowerArranging:
            return "Flower Arranging"
        case .dogWalking:
            return "Dog Walking"
        }
    }
    
    func results(for character: Character) -> EventResults {
        switch self {
        case .weddingCakeMaking:
            return weddingCakeResults(for: character)
        case .lightBulbChanging:
            return lightBulbResults(for: character)
        case .potionMaking:
            return potionMakingResults(for: character)
        case .demonSummoning:
            return demonSummoningResults(for: character)
        case .extremeYoyoing:
            return extremeYoyoResults(for: character)
        case .cardThrowing:
            return cardThrowingResults(for: character)
        case .buildingFire:
            return buildingFireResults(for: character)
        case .uprootingTree:
            return uprootTreeResults(for: character)
        case .perfectDate:
            return perfectDateResults(for: character)
        case .ikeaFurnitureBuilding:
            return ikeaFurnitureResults(for: character)
        case .presentWrapping:
            return presentWrappingResults(for: character)
        case .escapingCornMaze:
            return escapeMazeResults(for: character)
        case .catchingFly:
            return catchFlyResults(for: character)
        case .flowerArranging:
            return flowerArrangingResults(for: character)
        case .dogWalking:
            return dogWalkingResults(for: character)
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
            results.text = "You know absolutely nothing about making cakes, especially not the grandiose wedding cakes they’re desiring. You try to throw together something resembling a cake, but the seers see through your attempt."
            return results
        }
        
        switch bestType {
        case .finesse:
            switch success {
            case .success:
                results.text = "Despite your lack of knowledge relating to how to make cakes and what exactly they should look like, you create a cake that is, at the very least, a cake. Technically, you succeed, but the seers find others more enjoyable."
            case .moderateSuccess:
                results.text = "You do your very best with the what you have, spending a lot of time attempting to create as beautiful of a cake as possible. The seers are impressed with your effort, but find the dessert somewhat lacking in both taste and appearance."
            case .overwhelmingSuccess:
                results.text = "You may not know what cake the seers are craving, but you have mastered the art of decoration thanks to your steady hands. You create a dessert of unparalleled beauty, impressing the seers with appearance alone."
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = "Considering that it is very difficult to bull-shit your way through a cooking challenge, the fact that you succeed at all is praiseworthy. The cake is lackluster in both taste and appearance, but it is a cake, which, ultimately, was the goal."
            case .moderateSuccess:
                results.text = "You attempt to glean from the seers what type of cake they are craving, but your inquiries are largely shut down. You make your best guess based on what people usually like and manage to create a pretty and edible cake, but not quite what was desired in either sense."
            case .overwhelmingSuccess:
                results.text = "Before you begin cooking, you make some small talk with the judges, all harmless, but, with that, you manage to figure out what exactly they’re craving. Your cake could be a little prettier, but the taste is exactly what was desired."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Light Bulb Changing
    
    private func lightBulbResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "lightbulb")
        
        let agility = eventSuccess(for: character.agility)
        var bestType = Trait.agility
        var bestScore = agility
        
        let wits = eventSuccess(for: character.wits)
        if wits > bestScore {
            bestType = .wits
            bestScore = wits
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You’re unable to reach any of the bulbs before other competitors and fall behind with every second that passes. You position yourself near changed bulbs, hoping they’ll be attributed to you, but the seers know you failed."
            return results
        }
        
        switch bestType {
        case .agility:
            switch success {
            case .success:
                results.text = "You attempt to rush about the field and get as many lightbulbs as possible, but often end up switching the dead bulb for another dead one. You still succeed, since at least one bulb was changed, but the seers remain unimpressed."
            case .moderateSuccess:
                results.text = "You rush around the field, changing every lightbulb that you can get your hands on, but you’re not as fast as you could be. Ultimately, you still get through a lot of them, and the seers approve of that."
            case .overwhelmingSuccess:
                results.text = "You’re not entirely sure what the seers want as the result of this event, but you change as many lightbulbs as you possibly can, actually getting around to the bulbs of your competitors as well. The seers seem to nod approvingly."
            case .failure:
                break
            }
        case .wits:
            switch success {
            case .success:
                results.text = "You focus so much on getting the lightbulb to be perfect that you completely forget that it’s a competition. When time is called, you only managed to change a single bulb, which means you technically succeeded."
            case .moderateSuccess:
                results.text = "Instead of rushing about, you focus on doing what you can, getting as many lightbulbs to as close to perfect as possible. You don’t quite reach that goal of perfection with your efforts, but still receive the approval of the seers."
            case .overwhelmingSuccess:
                results.text = "Quality is more important than quantity. You may not get to as many light bulbs as some of your fellow competitors, but the ones you get around to are absolutely perfect. You catch one of the seers smiling."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Potion Making
    
    private func potionMakingResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "potion")
        
        let magic = eventSuccess(for: character.magic)
        var bestType = Trait.magic
        var bestScore = magic
        
        let wits = eventSuccess(for: character.wits)
        if wits > bestScore {
            bestType = .wits
            bestScore = wits
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "Despite the resources at hand, your combination of ingredients, chosen almost at random, doesn’t result in anything. It smells rather funky, and the seers are unable to get it to do anything."
            return results
        }
        
        switch bestType {
        case .magic:
            switch success {
            case .success:
                results.text = "You recall all of your study over the years. Well, you try to anyway. Using the fragments of what you remember, you create some concoction. You’re not entirely sure what it does, but you’re sure it does something."
            case .moderateSuccess:
                results.text = "While you consider yourself an expert on all things magical, you falter when put to the test. The potion you manage to pull together lacks the oomf you promised when describing it to the seers, but, at least, the recipe is original."
            case .overwhelmingSuccess:
                results.text = "Having spent a lot of time in your life both studying and doing magic, creating a potion is a piece of cake for you. You don’t use any of the provided references and easily conjure up an entirely original concoction."
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = "You use the references provided to create a textbook potion. While it performs as anticipated, it lacks creativity and originality.  Still, your potion does exactly as expected, so the seers can’t fault you too much."
            case .moderateSuccess:
                results.text = "With the knowledge gained from the various provided resources, you concoct what you think will be a rather effective love potion. When the seers test it, it explodes, doing a significant amount of damage."
            case .overwhelmingSuccess:
                results.text = "You have some knowledge of magic, but, better than that, you know how to take advantage of resources. You spend most of your time studying the provided books, seeing how ingredients mix. In the end, you pull together an original concoction never seen before."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Demon Summoning
    
    private func demonSummoningResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "demonsumming")
        
        let magic = eventSuccess(for: character.magic)
        var bestType = Trait.magic
        var bestScore = magic
        
        let charm = eventSuccess(for: character.charm)
        if charm > bestScore {
            bestType = .charm
            bestScore = charm
        }
        
        let brawn = eventSuccess(for: character.brawn)
        if brawn > bestScore {
            bestType = .brawn
            bestScore = brawn
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You attempted to draw a summoning circle and speak an incantation. That didn’t work. You tried to persuade a demon to enter the realm with promises of rewards. Nope. As a final attempt, you challenged any and all demons to a fight. None are stupid enough to appear to your challenge."
            return results
        }
        
        switch bestType {
        case .magic:
            switch success {
            case .success:
                results.text = "After painstakingly drawing a summoning circle on the ground and speaking the words to the best of your ability, a small demon emerges from the otherworld. It’s not very obedient, but you did drag it out."
            case .moderateSuccess:
                results.text = "You create a sizable summoning circle and speak an almost correct incantation. A demon steps out, rather average in size, and decides to acknowledge your power as a sorcerer."
            case .overwhelmingSuccess:
                results.text = "You set up the perfect summoning circle and recite a flawless incantation. From the netherworld emerges one of the largest demons you’ve ever seen. It also listens to you, which is nice, so it doesn’t kill you."
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = "You speak at length, for nearly the entirety of the allotted time, before a demon finally appears. It’s tiny and gives you a lot of attitude, but the seers acknowledge your success."
            case .moderateSuccess:
                results.text = "You decide to skip out on all the actual magic involved in summoning and simply speak to all listening demons. It takes a while, but eventually a medium sized demon gives into your offerings and appears."
            case .overwhelmingSuccess:
                results.text = "You’re not overly familiar with magic, but you assume demons can’t be too different from people. You speak aloud words of praise and offering, managing to entice a demon out with your honeyed phrases."
            case .failure:
                break
            }
        case .brawn:
            switch success {
            case .success:
                results.text = "You attempt to draw out a demon with challenges of the physical variety. After changing the duel several times, a demon finally appears. It is barely a foot tall and still manages to defeat you in the chosen duel."
            case .moderateSuccess:
                results.text = "You challenge all demons within hearing range to a wrestling match. Many avoid the offer, but one gives in, appearing before you. You fail to defeat the demon, so he doesn’t listen to you."
            case .overwhelmingSuccess:
                results.text = "You bellow to the heavens above and ground below, challenging any and all to wrestle you. A demon appears, accepting your challenge. You defeat it, easily, and it accepts your position as master."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Extreme Yoyo-ing
    
    private func extremeYoyoResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "yoyo")
        
        let agility = eventSuccess(for: character.agility)
        var bestType = Trait.agility
        var bestScore = agility
        
        let finesse = eventSuccess(for: character.finesse)
        if finesse > bestScore {
            bestType = .finesse
            bestScore = finesse
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You assured yourself that this event would go fine on the basis that you’ve used a yoyo before, but you can’t get it to do anything. Every time you unspool it, it simply remains unspooled, not coming back like it is supposed to."
            return results
        }
        
        switch bestType {
        case .finesse:
            switch success {
            case .success:
                results.text = "Having never used a yoyo in your life, you spend the majority of your allotted time simply trying to get it to behave in the way that it’s intended to. Eventually, you manage to pull off a few simple tricks for the seers, though with a few mistakes."
            case .moderateSuccess:
                results.text = "After a brief period of fiddling with the provided yoyo, you spend time running through all the tricks you know. You mess up on a few of them, but you manage to pull off some of the most complicated tricks with ease."
            case .overwhelmingSuccess:
                results.text = "While you haven’t use yoyos a great amount, you figure it out with ease. It only takes you a few moments of fiddling with it before you’re performing some of the most complex tricks known, without any mistakes even."
            case .failure:
                break
            }
        case .agility:
            switch success {
            case .success:
                results.text = "Turns out you only know a single yoyo trick, so you end up doing it dozens of times within the allotted timespan. While the seers eventually get bored of your one trick, they do recognize the fact that you did do at least one."
            case .moderateSuccess:
                results.text = "You perform every single trick you can think of but quickly realize you don’t know as many as you thought. You quickly end up repeating tricks, sometimes messing up in your repeated attempts."
            case .overwhelmingSuccess:
                results.text = "You don’t know any of the really fancy yoyo tricks, so you spend the whole time running through every single basic trick that you know. The judges are impressed with the sheer amount of tricks that you perform"
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Card Throwing
    
    private func cardThrowingResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "cards")
        
        let finesse = eventSuccess(for: character.finesse)
        var bestType = Trait.finesse
        var bestScore = finesse
        
        let magic = eventSuccess(for: character.magic)
        if magic > bestScore {
            bestType = .magic
            bestScore = magic
        }
        
        let brawn = eventSuccess(for: character.brawn)
        if brawn > bestScore {
            bestType = .brawn
            bestScore = brawn
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You assumed you had this down, having done it for fun in the past, but every card you throw simply ends up smacking you in the face. The many targets remain untouched by the cards which leave your hand."
            return results
        }
        
        switch bestType {
        case .finesse:
            switch success {
            case .success:
                results.text = "You grab a deck of cards, confident that it is all you need to hit the targets. You throw them with skill, but your accuracy needs work as you miss most of your shots. Eventually, you actually hit your mark, but it’s just as the time comes to an end."
            case .moderateSuccess:
                results.text = "Realizing you probably don’t have as much skill in the area as you think you do, you take several decks worth of cards. You throw them skillfully, but, as you expected, you miss quite a few of them. Eventually, you hit most of the targets."
            case .overwhelmingSuccess:
                results.text = "You grab as many cards as there are targets, claiming loudly you won’t need a single more. Then, with precision, you hit every single one of the targets until you’re out of cards, and the task has been accomplished."
            case .failure:
                break
            }
        case .magic:
            switch success {
            case .success:
                results.text = "You enchant every single card that you can and send them flying towards the targets. Unfortunately, you lack the fine control to actually hit most of them, managing to only get one of the targets in the end."
            case .moderateSuccess:
                results.text = "With your magic, you take control of dozens of cards, guiding their paths to the targets. You lack the power to guide them all successfully, but you do hit a lot of the targets in the end."
            case .overwhelmingSuccess:
                results.text = "Thanks to your skills with enchantment, you easily control the cards as they fly towards the targets. You add a little flair as they go eventually hitting the targets as needed."
            case .failure:
                break
            }
        case .brawn:
            switch success {
            case .success:
                results.text = "Despite your lack of experience in the area, you do your very best to accomplish the needed task. With your arms full of cards, you launch them towards the targets. Through sheer luck, you end up hitting one of the many."
            case .moderateSuccess:
                results.text = "You grab as many cards as you can handle, filling your arms to the very brim. You do your very best to throw them at the targets, and you hit a lot of them. Despite your best efforts, you fail to hit all that was required."
            case .overwhelmingSuccess:
                results.text = "With your unparalleled strength, you grab all of the provided cards in yours arms and throw them at the targets. Due to the sheer amount that you threw, you manage to hit every single target."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Building a Fire
    
    private func buildingFireResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "firebuilding")
        
        let wits = eventSuccess(for: character.wits + character.endurance)
        var bestType = Trait.wits
        var bestScore = wits
        
        let magic = eventSuccess(for: character.magic)
        if magic > bestScore {
            bestType = .magic
            bestScore = magic
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You’ve never made a fire before, and, despite all that you try, that statement remains true. The best you achieve is a couple of sparks that lead to nothing."
            return results
        }
        
        switch bestType {
        case .wits:
            switch success {
            case .success:
                results.text = "After gathering a decent amount of kindling, you spend significant time trying to get the fire going. After a few failed attempts, you eventually get a small flame going."
            case .moderateSuccess:
                results.text = "You spend a significant amount of time gathering a large pile of wood and stacking them in what you vaguely remember being the best way. Once you get the fire going, it blossoms into the air, but you didn’t do it quite right, leading it to being a bit on the small side."
            case .overwhelmingSuccess:
                results.text = "With knowledge of thermodynamics on your side, you get ready to create a blazing inferno. With the wood stacked in the best manner possible, the fire rages high into the sky."
            case .failure:
                break
            }
        case .magic:
            switch success {
            case .success:
                results.text = "You end up chanting spell after a spell, running through all the ones you know. Eventually, you find the right one and manage to get a small fire going."
            case .moderateSuccess:
                results.text = "While you know just the spell to use to get the fire started, you’re not sure what the best way is to stack the wood. You end up getting a flame going, but it doesn’t grow very large nor last as long as it could."
            case .overwhelmingSuccess:
                results.text = "With a few waves of your hand, you pull together a large amount of wood. A few more gestures lead to a blazing inferno of unequaled size and energy."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Uprooting a Tree
    
    private func uprootTreeResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "treetipping")
        
        let brawn = eventSuccess(for: character.brawn)
        var bestType = Trait.brawn
        var bestScore = brawn
        
        let endurance = eventSuccess(for: character.endurance)
        if endurance > bestScore {
            bestType = .endurance
            bestScore = endurance
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You pull and pull on the trees to no avail. You eventually give up on that and try to dig it up with the shovels. Ultimately, though, you simply run out of time to accomplish the task."
            return results
        }
        
        switch bestType {
        case .brawn:
            switch success {
            case .success:
                results.text = "You wander about the forest, trying your hand at pulling many a tree out of the ground. In the end, you find a tiny tree just beginning to sprout. With surprisingly significant effort, you manage to pull it from the ground."
            case .moderateSuccess:
                results.text = "While you attempt to pull out the largest tree, you fail to do so. After several more tries, you eventually give up and decide to move to a smaller one. The nearly full-size tree pulls up much easier than the other ones you tried, and you actually succeed."
            case .overwhelmingSuccess:
                results.text = "You locate the largest of the trees in the forest and get a good grip on it. With a swift yank, you pull it from the ground and toss it to the judges."
            case .failure:
                break
            }
        case .endurance:
            switch success {
            case .success:
                results.text = "With the assistance of shovels, you attempt to uproot many a tree from the forest. Admittedly, none of them give way. Just as time is nearing its end, you find a small, freshly sprouted tree. This one comes free from the ground rather easily."
            case .moderateSuccess:
                results.text = "Feeling you don’t have time to dig up the largest of the trees in the area, you go for the next best thing. You dig up the area around a more reasonably sized full-grown tree. In the end, you are able to uproot the plant without too much extra effort."
            case .overwhelmingSuccess:
                results.text = "After wandering the provided forest for a while, you end up at the largest tree in the area. You begin digging up the area around it, placing sticks as you do so. Eventually, you are able to push the tree up from the ground with ease."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - The Perfect Date
    
    private func perfectDateResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "date")
        
        let charm = eventSuccess(for: character.charm)
        var bestType = Trait.charm
        var bestScore = charm
        
        let wits = eventSuccess(for: character.wits)
        if wits > bestScore {
            bestType = .wits
            bestScore = wits
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You don’t have much to say nor did you really put much effort into your appearance. You end up shooting down every attempt at small talk made by your partner, which simply serves to frustrate them."
            return results
        }
        
        switch bestType {
        case .charm:
            switch success {
            case .success:
                results.text = "Despite the significant effort you put into your appearance, you fail to set-up an interesting date for your partner. They find themselves a little bored, but your good looks earn a decent score anyway."
            case .moderateSuccess:
                results.text = "With plenty of effort put into both your looks and coming up with a half decent idea for a date, you go forth with your partner. They find the date itself to be rather fun and you, yourself, to be more than a little easy on the eyes."
            case .overwhelmingSuccess:
                results.text = "Prior to the date, you put significant effort into making sure you look as good as you possibly can. You also make intricate plans for the event, making a great impression when it actually comes around to the date."
            case .failure:
                break
            }
        case .wits:
            switch success {
            case .success:
                results.text = "You spend some time thinking of various things you can talk about, but you find yourself struggling when it comes to actually delivery of them. Still, your partner found you to be pleasant enough."
            case .moderateSuccess:
                results.text = "While you could have planned a bit more for the date, you prove yourself to be an entertaining conversationalist nonetheless, keeping your partner engaged and having fun the whole time."
            case .overwhelmingSuccess:
                results.text = "You make exciting plans for the date and make sure you have plenty of talking points. Your assigned partner finds you to be incredibly funny and entertaining, not to mention more than a little interested in a second try."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Ikea Furniture Building
    
    private func ikeaFurnitureResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "ikeafurniture")
        
        let brawn = eventSuccess(for: character.brawn + character.endurance)
        var bestType = Trait.brawn
        var bestScore = brawn
        
        let finesse = eventSuccess(for: character.finesse + character.wits)
        if finesse > bestScore {
            bestType = .finesse
            bestScore = finesse
        }
        
        let magic = eventSuccess(for: character.magic)
        if magic > bestScore {
            bestType = .magic
            bestScore = magic
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "The lack of description on the instructions combined with the sheer number of parts leaves you baffled. Try as you might to assemble the pieces into the end product, every attempt falls apart."
            return results
        }
        
        switch bestType {
        case .brawn:
            switch success {
            case .success:
                results.text = "You attempt to force the parts together in the order that you feel is best, breaking a few of them in the process. In the end, you manage to pull together something that looks like the intended end result, which counts."
            case .moderateSuccess:
                results.text = "Since you don’t care for the instructions, you attempt to put the furniture together with brute force. You get lucky and manage to not break every single piece and somehow even manage to get it all together."
            case .overwhelmingSuccess:
                results.text = "Foregoing the instructions, you use your strength to throw the furniture together. Sometimes, you force the wrong pieces together, but you easily remedy the mistakes."
            case .failure:
                break
            }
        case .finesse:
            switch success {
            case .success:
                results.text = "With the instructions in hand, you try to follow them to the best of your ability. You end up misinterpreting quite a few things and having to start over, but you manage to finish with but minutes left."
            case .moderateSuccess:
                results.text = "You keep a close eye on the instructions as you fiddle with the many pieces of the puzzle that is the furniture. You make a few misinterpretations but, ultimately, get it done in a rather timely manner."
            case .overwhelmingSuccess:
                results.text = "Following the instructions with ease, you assemble the many smaller pieces of the furniture. Once you complete that, putting together the final product proves to be incredibly easy."
            case .failure:
                break
            }
        case .magic:
            switch success {
            case .success:
                results.text = "You attempt to pull together all the various parts through means of magic, but you end up creating a huge mess. Eventually, you  have to do a lot of the work by hand and barely finish in time."
            case .moderateSuccess:
                results.text = "Using your powers in the mystical arts and the instructions, you manipulate the pieces. After a few mistakes in constructing things in the correct order, you eventually pull it all together as intended."
            case .overwhelmingSuccess:
                results.text = "Keeping your eyes glued to the instructions, you control the many pieces of the puzzle like furniture. Thanks to your magnificent control of them, you put it together with ease."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Present Wrapping
    
    private func presentWrappingResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "giftwrapping")
        
        let agility = eventSuccess(for: character.agility)
        var bestType = Trait.agility
        var bestScore = agility
        
        let endurance = eventSuccess(for: character.endurance)
        if endurance > bestScore {
            bestType = .endurance
            bestScore = endurance
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "In spite of your best efforts, you fail to wrap the oddly shaped gift. You wasted several rolls of wrapping paper in your endeavor, which doesn’t serve to help your position with the judges."
            return results
        }
        
        switch bestType {
        case .agility:
            switch success {
            case .success:
                results.text = "In the effort to get as many presents wrapped as possible, you end up ripping the paper over a dozen times. When you actually get a present wrapped without tearing the paper and ruining it, the time comes to an end. "
            case .moderateSuccess:
                results.text = "You try to wrap as many presents as you possibly can, but you have a hard time getting the wrapping paper to actually do what you want, causing you to slow down multiple times. In the end, you get quite a few done, though they aren’t the best looking."
            case .overwhelmingSuccess:
                results.text = "With ease, you wrap every shape and size of gift placed before you, completing an unprecedented amount. Admittedly, the wrapping jobs aren’t the most beautiful, but they are, indeed, wrapped."
            case .failure:
                break
            }
        case .endurance:
            switch success {
            case .success:
                results.text = "You take great care to wrap the present as well as you possibly can. You struggle with getting the paper to do what you want, and, once you get that situated, the ribbon proves rather disagreeable. Ultimately, you only manage to wrap the first present."
            case .moderateSuccess:
                results.text = "With a lot of caution, you wrap as many presents as you can. Seeing as you struggle several times with both the paper and the ribbons, you don’t get as many done as you would like, but, at least, the ones you complete look nice."
            case .overwhelmingSuccess:
                results.text = "You take your time with the many presents, making sure the wrapping is as perfect as possible, not to mention the immaculate ribbons. In the end, you don’t get as many done as some other, but none of them look as good as the ones you did."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Escaping a Corn Maze
    
    private func escapeMazeResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "maze")
        
        let agility = eventSuccess(for: character.agility)
        var bestType = Trait.agility
        var bestScore = agility
        
        let endurance = eventSuccess(for: character.endurance)
        if endurance > bestScore {
            bestType = .endurance
            bestScore = endurance
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You spend hours wandering about aimlessly, feeling utterly lost. You’re almost positive that you have been walking in circles for at least a good hour. In the end, you don’t make it to the finish line to be judged by the seers."
            return results
        }
        
        switch bestType {
        case .endurance:
            switch success {
            case .success:
                results.text = "You take your time figuring out how to escape the maze, following along one of the walls. Unfortunately, you get turned around a few times as you go. In the end, you barely make it out in time to succeed."
            case .moderateSuccess:
                results.text = "With one hand to the wall, you proceed through the maze. Despite this strategy, you make a few wrong turns and end up having to backtrack several times. Ultimately, though, you take most of the correct turns to get out shortly after the forerunners."
            case .overwhelmingSuccess:
                results.text = "Deciding to be patient, you make your way through the maze, always keeping one hand to the wall. With such a strategy, you make it out of the maze rather quickly."
            case .failure:
                break
            }
        case .agility:
            switch success {
            case .success:
                results.text = "You figure the best way to get out is to exhaust all the possibilities. Running endlessly around the maze, you realize it might not be the fastest way to do things. After what seems like forever, you somehow make it to the exit, barely beating the clock."
            case .moderateSuccess:
                results.text = "You don’t put in much forethought before you run into the depths of the maze. Immediately, you feel rather lost, but, somehow, you get lucky and end up finding the exit towards the front of the pack."
            case .overwhelmingSuccess:
                results.text = "Without any sort of hesitation, you rush headlong into the maze. You quickly figure out which directions lead to dead-ends and which ones loop back around. With that information on hand, you’re able to make it out in record time."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Catching a Fly
    
    private func catchFlyResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "catchingflies")
        
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
            results.text = "You chase the fly around the stadium, even going so far as to jump into the stands. Nonetheless, your efforts remain fruitless. Every time you get close, the little creature escapes your grasp. When it comes time for judging, you have nothing to present."
            return results
        }
        
        switch bestType {
        case .finesse:
            switch success {
            case .success:
                results.text = "Despite your best efforts, you end up chasing a single fly as it flits around the arena. As it heads for the stands, you follow it, stepping over many people to reach it. You get your hands on it in the end, but you leave a trail of bruised bodies in your wake."
            case .moderateSuccess:
                results.text = "Considering the massive amount of flies around the arena, it doesn’t take you too long to capture one. You then decide to capture a few more, but that’s all you manage to accomplish, having only a few to show."
            case .overwhelmingSuccess:
                results.text = "It takes you but a mere moment to chase down a fly and catch it. Since you have significant time left, you decide to get your hands on a few more. Once it comes time for the judging, you have a pile of flies to show for it."
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = "Not desiring to run around the arena to get a hold of the creatures, you try and convince one of the hundreds in the swarm to come to you instead. It looks like you won’t succeed, but, just as time is running out, one gives into your flirtations and lands in your hand."
            case .moderateSuccess:
                results.text = "With the swarms of flies moving around the arena, you yell compliments and flirtations towards them. Quite a few of them divert from the pack to come to you, falling for your seductions."
            case .overwhelmingSuccess:
                results.text = "You walk into the swarm of flies and begin talking to them. You compliment their multi-faceted eyes and glorious wings, including comments on how nicely their bodies reflect the light of the arena. Within moments, you have hundreds of flies under your control."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Flower Arranging
    
    private func flowerArrangingResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "flowers")
        
        let brawn = eventSuccess(for: character.brawn)
        var bestType = Trait.brawn
        var bestScore = brawn
        
        let charm = eventSuccess(for: character.charm)
        if charm > bestScore {
            bestType = .charm
            bestScore = charm
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You waste the entirety of your allotted time trying to figure out the best possible arrangement using your rather lacking knowledge of the subject. You fail to pull together anything presentable and have only a single flower to show for your efforts, which doesn’t fulfill the requirements of the event."
            return results
        }
        
        switch bestType {
        case .brawn:
            switch success {
            case .success:
                results.text = "You grab a bundle of flowers at last minute, having wasted the entirety of the time contemplating possible arrangements. The judges find the presented result unimpressive, lacking any sort of order and not making up for it with anything, but you technically fulfilled the requirements."
            case .moderateSuccess:
                results.text = "Not entirely sure how to approach the problem, you simply grab as many flowers as you can possibly hold and present them to the judges as a bouquet. While the arrangement isn’t amazing in terms of color, the sheer amount of flowers it impressive."
            case .overwhelmingSuccess:
                results.text = "You’re not very knowledgeable about flowers nor can you read the Seers to tell what kind they prefer, but you have plenty of strength. You scoop up hundreds of flowers into your arms, more than reasonably possible, and present them to the judges."
            case .failure:
                break
            }
        case .charm:
            switch success {
            case .success:
                results.text = "Without much thought, you pull together a bouquet of random flowers. They don’t really complement each other in color or smell, and your bullshitting isn’t enough to make up for that fact. But, still, you did arrange flowers, so you succeeded."
            case .moderateSuccess:
                results.text = "You pick flowers which you think best suit the judges and explain your reasoning when you present it to them. They find the explanations rather flattering and enjoyed the arrangement more than they would’ve without the ass-kissing."
            case .overwhelmingSuccess:
                results.text = "You make small talk with the judges before diving into your arrangement. You take note of the colors and smells they prefer and quickly get to work assembling a bouquet featuring those preferences."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
    
    // MARK: - Dog Walking
    
    private func dogWalkingResults(for character: Character) -> EventResults {
        var results = EventResults()
        results.image = #imageLiteral(resourceName: "dogwalking")
        
        let endurance = eventSuccess(for: character.endurance)
        var bestType = Trait.endurance
        var bestScore = endurance
        
        let magic = eventSuccess(for: character.magic)
        if magic > bestScore {
            bestType = .magic
            bestScore = magic
        }
        
        let success = SuccessType(rawValue: bestScore) ?? .failure
        results.success = success
        
        if success == .failure {
            results.text = "You attempt to wrangle the dogs assigned to you into some sort of organized pack, but, by doing so, you run out of time to actually walk them. When the seers come to judge you, they find a dozen hyper dogs tangled together. Not impressive at all."
            return results
        }
        
        switch bestType {
        case .endurance:
            switch success {
            case .success:
                results.text = "You decide to walk your assigned dogs one at a time, but you end up only walking the first dog since you take them for such a significant distance. While you didn’t take all of them, you did succeed in walking at least one."
            case .moderateSuccess:
                results.text = "Two at a time, you walk the dogs assigned to you, taking them on incredibly long walks. You get through quite a few pairs of canines but eventually you run out of time without getting to the last few."
            case .overwhelmingSuccess:
                results.text = "With all the dogs leashed, you take them on the longest walk of their lives. You return just before the deadline with a pack of exhausted canines who want nothing more than to sleep the rest of the day away."
            case .failure:
                break
            }
        case .magic:
            switch success {
            case .success:
                results.text = "You use magic to leash all the dogs together and walk them without even being there. Unfortunately, you left your attention drift, and your magic leads to all of them being tangled around a tree not too far away. Technically, you walked them, just not very far."
            case .moderateSuccess:
                results.text = "With your magic, you attempt to leash all the canines without actually getting close to them. While you do manage to get most of them together, you miss a few them. Considering it unimportant to get all of them, you walk the ones you managed to leash."
            case .overwhelmingSuccess:
                results.text = "You use magic to leash not only your assigned dogs but the excess dogs as well, walking all the ones available to you simultaneously. While some don’t end up completely exhausted, all of them are more calm and manageable than they had been before."
            case .failure:
                break
            }
        default:
            break
        }
        
        return results
    }
}



