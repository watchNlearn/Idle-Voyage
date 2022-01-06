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
    var image: Image
    var type: SpaceTypes
}

enum SpaceTypes {
    case planet
    case moon
    case star
    case asteroid
    case other
}


var spaceObjects = [SpaceObject(name: "Earth", distanceInKm: 0, image: Image(""), type: .planet),
                    SpaceObject(name: "Venus", distanceInKm: 41400000, image: Image(""), type: .planet),
                    SpaceObject(name: "Mars", distanceInKm: 78340000, image: Image(""), type: .planet),
                    SpaceObject(name: "Mercury", distanceInKm: 91691000, image: Image(""), type: .planet),
                    SpaceObject(name: "Sun", distanceInKm: 150000000, image: Image(""), type: .star),
                    SpaceObject(name: "Jupiter", distanceInKm: 628730000, image: Image(""), type: .planet),
                    SpaceObject(name: "Saturn", distanceInKm: 1275000000, image: Image(""), type: .planet),
                    SpaceObject(name: "Uranus", distanceInKm: 2723950000, image: Image(""), type: .planet),
                    SpaceObject(name: "Neptune", distanceInKm: 4351400000, image: Image(""), type: .planet),
                    SpaceObject(name: "Pluto", distanceInKm: 5890000000, image: Image(""), type: .planet),
                    SpaceObject(name: "Moon", distanceInKm: 384400, image: Image(uiImage: "🌑".image()!), type: .moon),
                    SpaceObject(name: "Kuiper Belt", distanceInKm: 4338338250.0390005, image: Image(""), type: .other)]

// Sorted by distance from decreasing to increasing
var spaceObjectsSorted = spaceObjects.sorted(by: { $0.distanceInKm < $1.distanceInKm })


//  To use

//                    var spaceObjs = spaceObjectsSorted
//                        print(spaceObjs)

