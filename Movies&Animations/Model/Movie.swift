//
//  Movie.swift
//  Movies&Animations
//
//  Created by Sümeyye Kazancı on 12.07.2022.
//

import SwiftUI

struct Movie: Identifiable {
    var id = UUID().uuidString
    var title: String
    var artwork: String
    var plot: String
}

var movies: [Movie] = [
    Movie(title: "1", artwork: "minions", plot: "Upon not being able to satisfy their core duty of serving an evil master, three minions, Stuart, Kevin & Bob set out from their Antarctica base to the USA in search of a master. By sheer chance they get to visit the Villain Con where they get a chance to impress the meanest Villain of all, Scarlett Overkill."),
    Movie(title: "2", artwork: "paw", plot: "In Adventure Bay, a truck driver named Gus crashes and hangs over the town's suspension bridge when he sees baby turtle on the road. Cap'n Turbot comes across the scene and calls Ryder, who sends the PAW Patrol pups into action. Chase, the police pup, saves the truck driver and the mission ends with helping the baby turtle cross to the other side of the road."),
    Movie(title: "3", artwork: "sponge-bob", plot: "SpongeBob SquarePants takes leave from the town of Bikini Bottom in order to track down King Neptune's stolen crown.After King Neptune's crown is stolen, SpongeBob and Patrick go on a quest in 6 days to retrieve his crown. On the way SpongeBob and Patrick defeat many evildoers using their brains and bronzes."),
    Movie(title: "4", artwork: "up", plot: "78-year-old balloon salesman Carl Fredricksen is about to fulfill a lifelong dream. Tying thousands of balloons to his house, he flies away to the South American wilderness. But curmudgeonly Carl's worst nightmare comes true when he discovers a stowaway aboard: a Boy Scout named Russell."),
    Movie(title: "5", artwork: "frozen", plot: "When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister Anna teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.")
]
