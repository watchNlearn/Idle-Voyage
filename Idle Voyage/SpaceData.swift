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


var spaceObjects = [SpaceObject(name: "Earth", distanceInKm: 0, image: "🌎".image()!, desc: "You may know this place...", description: "This is the earth", type: .planet),
                    SpaceObject(name: "Venus", distanceInKm: 41400000, image: "🌕".image()!, desc: "Hot hot...", description: "This is Venus", type: .planet),
                    SpaceObject(name: "Mars", distanceInKm: 78340000, image: "🔴".image()!, desc: "... Aliens", description: "This is Mars", type: .planet),
                    SpaceObject(name: "Mercury", distanceInKm: 91691000, image: "🌒".image()!, desc: "FIRE", description: "This is Mercury", type: .planet),
                    SpaceObject(name: "Sun", distanceInKm: 150000000, image: "☀️".image()!, desc: "Sunblock?", description: "This is the Sun", type: .star),
                    SpaceObject(name: "Jupiter", distanceInKm: 628730000, image: "🌖".image()!, desc: "HUGE", description: "This is Jupiter", type: .planet),
                    SpaceObject(name: "Saturn", distanceInKm: 1275000000, image: "🪐".image()!, desc: "Rings... lots of them", description: "This is Saturn", type: .planet),
                    SpaceObject(name: "Uranus", distanceInKm: 2723950000, image: "🌑".image()!, desc: "ahahaha", description: "This is Uranus",type: .planet),
                    SpaceObject(name: "Neptune", distanceInKm: 4351400000, image: "🔵".image()!, desc: "oo pretty", description: "This is Neptune",type: .planet),
                    SpaceObject(name: "Pluto", distanceInKm: 5890000000, image: "🟣".image()!, desc: "not sure either", description: "This is Pluto", type: .planet),
                    SpaceObject(name: "Moon", distanceInKm: 384400, image: "🌙".image()!, desc: "No cheese here", description: "This is the Moon", type: .moon),
                    SpaceObject(name: "Kuiper Belt", distanceInKm: 4338338250.0390005, image: "🪨".image()!, desc: "no way home", description: "This is the Kuiper Belt", type: .other)]

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
