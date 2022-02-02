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


var spaceObjects = [SpaceObject(name: "Earth", distanceInKm: 0, image: "🌎".image()!, desc: "You may know this place...", description: "Earth is the planet we live on, one of eight planets in our solar system and the only known place in the universe to support life.", type: .planet),
                    SpaceObject(name: "Venus", distanceInKm: 41400000, image: UIImage(named: "Venus")!, desc: "Lets turn up the heat", description: "Venus is the second planet from the Sun, and is Earth's closest neighbor in the solar system. Venus is the brightest object in the sky after the Sun and the Moon, and sometimes looks like a bright star in the morning or evening sky.", type: .planet),
                    SpaceObject(name: "Mars", distanceInKm: 78340000, image: UIImage(named: "Mars")!, desc: "... Aliens", description: "Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the 'Red Planet'.", type: .planet),
                    SpaceObject(name: "Mercury", distanceInKm: 91691000, image: UIImage(named: "Mercury")!, desc: "Not the element...", description: "Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets.", type: .planet),
                    SpaceObject(name: "Sun", distanceInKm: 150000000, image: "☀️".image()!, desc: "Bring any sunscreen?", description: "This is the Sun", type: .star),
                    SpaceObject(name: "Jupiter", distanceInKm: 628730000, image: UIImage(named: "Jupiter")!, desc: "HUGE", description: "This is Jupiter", type: .planet),
                    SpaceObject(name: "Saturn", distanceInKm: 1275000000, image: UIImage(named: "Saturn")!, desc: "Rings... lots of them", description: "This is Saturn", type: .planet),
                    SpaceObject(name: "Uranus", distanceInKm: 2723950000, image: UIImage(named: "Uranus")!, desc: "ahahaha", description: "This is Uranus",type: .planet),
                    SpaceObject(name: "Neptune", distanceInKm: 4351400000, image: UIImage(named: "Neptune")!, desc: "oo pretty", description: "This is Neptune",type: .planet),
                    SpaceObject(name: "Pluto", distanceInKm: 5890000000, image: UIImage(named: "Pluto")!, desc: "not sure either", description: "This is Pluto", type: .planet),
                    SpaceObject(name: "Moon", distanceInKm: 384400, image: "🌑".image()!, desc: "No cheese here...", description: "The Moon is Earth's only natural satellite and the fifth largest moon in the solar system.", type: .moon),
                    SpaceObject(name: "Kuiper Belt", distanceInKm: 4338338250, image: "🪨".image()!, desc: "no way home", description: "This is the Kuiper Belt", type: .other),
                    SpaceObject(name: "Andromeda Galaxy", distanceInKm: 23651826181452, image: "🌀".image()!, desc: "epilogue", description: "This is the next galaxy", type: .other)]
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
