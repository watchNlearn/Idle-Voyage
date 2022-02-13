//
//  SpaceData.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/6/22.
//

import Foundation
import UIKit
import SwiftUI


struct SpaceObject {
    var name: String
    var distanceInKm: Double
    var image: UIImage
    var desc: String
    var description: String
    var type: SpaceTypes
}

enum SpaceTypes {
    case planet
    case moon
    case star
    case asteroid
    case other
}

struct SpaceShip {
    let rocket = "🚀"
    let ufo = "🛸"
    let voyager = "🛰️"
}

var spaceObjects = [SpaceObject(name: "Earth", distanceInKm: 0, image: "🌎".image()!, desc: "You may know this place...", description: "Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things. While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal.", type: .planet),
                    SpaceObject(name: "Venus", distanceInKm: 41400000, image: UIImage(named: "Venus")!, desc: "Lets turn up the heat", description: "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even though Mercury is closer to the sun and is the hottest planet in the solar system.", type: .planet),
                    SpaceObject(name: "Mars", distanceInKm: 78340000, image: UIImage(named: "Mars")!, desc: "... Aliens", description: "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. In English, Mars carries the name of the Roman god of war and is often referred to as the 'Red Planet'.", type: .planet),
                    SpaceObject(name: "Mercury", distanceInKm: 91691000, image: UIImage(named: "Mercury")!, desc: "Not the element...", description: "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Mercury temperatures can reach a scorching 840 F (450 C) in the day, which is hot enough to melt lead. Meanwhile, on the night side, temperatures drop to minus 290 F (minus 180 C).", type: .planet),
                    SpaceObject(name: "Sun", distanceInKm: 150000000, image: "☀️".image()!, desc: "Bring any sunscreen?", description: "This is the Sun", type: .star),
                    SpaceObject(name: "Jupiter", distanceInKm: 628730000, image: UIImage(named: "Jupiter")!, desc: "HUGE", description: "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. A major feature is the Great Red Spot, a giant storm that has raged for the last 150 years.", type: .planet),
                    SpaceObject(name: "Saturn", distanceInKm: 1275000000, image: UIImage(named: "Saturn")!, desc: "Rings... lots of them", description: "The sixth planet from the sun and second-largest planet in our solar system, Saturn is known most for its thousands rings. Made up of ice and rock, scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons.", type: .planet),
                    SpaceObject(name: "Uranus", distanceInKm: 2723950000, image: UIImage(named: "Uranus")!, desc: "ahahaha", description: "The seventh planet from the sun and third-largest diameter in our solar system, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side.",type: .planet),
                    SpaceObject(name: "Neptune", distanceInKm: 4351400000, image: UIImage(named: "Neptune")!, desc: "oo pretty", description: "The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds. Neptune is far out and cold being more than 30 times as far from the sun as Earth. Neptune was the first planet predicted to exist by using math, before it was visually detected and is the only planet in our solar system not visible to the naked eye.",type: .planet),
                    SpaceObject(name: "Pluto", distanceInKm: 5890000000, image: UIImage(named: "Pluto")!, desc: "not sure either", description: "Once the ninth planet from the sun, Pluto is unlike other planets in many respects. It is smaller than Earth's moon; its orbit is highly elliptical, falling inside Neptune's orbit at some points and far beyond it at others; and Pluto's orbit doesn't fall on the same plane as all the other planets —  instead, it orbits 17.1 degrees above or below. Now a dwarf planet, Pluto resides in the Kuiper Belt.", type: .planet),
                    SpaceObject(name: "Moon", distanceInKm: 384400, image: "🌑".image()!, desc: "No cheese here...", description: "Earth's Moon is the only place beyond Earth where humans have set foot. The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planet's wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years.", type: .moon),
                    SpaceObject(name: "Kuiper Belt", distanceInKm: 4338338250, image: "🪨".image()!, desc: "no way home", description: "Beyond the gas giant Neptune lies a region of space filled with icy bodies. Known as the Kuiper Belt, this chilly expanse holds trillions of objects — remnants of the solar system's early history. Like the asteroid belt, it has also been shaped by a giant planet, although it's more of a thick disk (like a donut) than a thin belt.", type: .other),
                    SpaceObject(name: "Andromeda Galaxy", distanceInKm: 23651826181452, image: "🌀".image()!, desc: "epilogue", description: "The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy approximately 2.5 million light-years (770 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way. The galaxy's name stems from the area of Earth's sky in which it appears, the constellation of Andromeda, which itself is named after the Ethiopian (or Phoenician) princess who was the wife of Perseus in Greek mythology.", type: .other)]
//23651826181452 <- might be too big for type double!
//4338338250

// Sorted by distance from decreasing to increasing
var spaceObjectsSorted = spaceObjects.sorted(by: { $0.distanceInKm < $1.distanceInKm })


//  To use

//                    var spaceObjs = spaceObjectsSorted
//                        print(spaceObjs)

func getNextSpaceObject(spaceObjects: [SpaceObject], distance: Double) -> SpaceObject {
    let totalDistance = distance
    var nextSpaceObj = SpaceObject(name: "Error", distanceInKm: 0, image: "🌑".image()!, desc: "Error", description: "Error", type: .other)
    for i in spaceObjects {
        if (i.distanceInKm > totalDistance) {
            nextSpaceObj = i
            break
        }
    }
//    SpaceObject(name: "Moon", distanceInKm: 384400, image: Image(uiImage: "🌑".image()!), desc: "i smell cheese", description: "This is the Moon", type: .moon)\
//    print("RETURNING NEXT: \(nextSpaceObj.name)")
//    print("-------------")
//    print("RETURNING DISTANCE: \(totalDistance)")
//    print("-------------")

    

    return nextSpaceObj
}
func getLastSpaceObject(spaceObjects: [SpaceObject], distance: Double) -> SpaceObject {
    let totalDistance = distance
    var lastSpaceObj = SpaceObject(name: "Error", distanceInKm: 0, image: "🌑".image()!, desc: "Error", description: "Error", type: .other)
    for i in spaceObjects {
        if (i.distanceInKm < totalDistance) {
            lastSpaceObj = i
        }
    }
//    SpaceObject(name: "Moon", distanceInKm: 384400, image: Image(uiImage: "🌑".image()!), desc: "i smell cheese", description: "This is the Moon", type: .moon)
//    print("RETURNING Last: \(lastSpaceObj.name)")

    return lastSpaceObj
}
