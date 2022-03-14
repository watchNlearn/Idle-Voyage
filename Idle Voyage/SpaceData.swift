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
    case galaxy
    case other
}

struct SpaceShip {
    let rocket = "🚀"
    let ufo = "🛸"
    let voyager = "🛰️"
}

var spaceObjects = [SpaceObject(name: "Earth", distanceInKm: 0, image: "🌎".image()!, desc: "You may know this place...", description: "Our home planet is the third planet from the Sun, and the only place we know of so far that’s inhabited by living things. While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal.", type: .planet),
                    SpaceObject(name: "Venus", distanceInKm: 41400000, image: UIImage(named: "Venus")!, desc: "Hot Shot", description: "The second planet from the sun, Venus is Earth's twin in size. Radar images beneath its atmosphere reveal that its surface has various mountains and volcanoes. But beyond that, the two planets couldn't be more different. Because of its thick, toxic atmosphere that's made of sulfuric acid clouds, Venus is an extreme example of the greenhouse effect. It's scorching-hot, even though Mercury is closer to the sun and is the hottest planet in the solar system.", type: .planet),
                    // Mars Moons
                    SpaceObject(name: "Deimos", distanceInKm: 77795600, image: "🌑".image()!, desc: "Breaking free", description: "Deimos is the smaller of Mars' two moons and whirls around Mars every 30 hours. Deimos is a small lumpy and heavily cratered object with most of its craters ranging only in 2.5km in diameter. Unlike Phobos, Deimos will eventually break from Mars' gravitational pull and fly off into space.", type: .moon),
                    SpaceObject(name: "Phobos", distanceInKm: 78316540, image: "🌑".image()!, desc: "Martian Moon", description: "The Martian moon Phobos orbits only a few thousand miles above the Red Planet's surface. Its proximity to its planet is one of the reasons astronomers were unable to see the satellite until the late 19th century. In fact, the moon is getting closer to Mars and over the centuries will eventually either break up or be pulled into the Martian surface.", type: .moon),
                    
                    SpaceObject(name: "Mars", distanceInKm: 78340000, image: UIImage(named: "Mars")!, desc: "... Aliens", description: "The fourth planet from the sun is Mars, and it's a cold, desert-like place covered in dust. This dust is made of iron oxides, giving the planet its iconic red hue. Mars shares similarities with Earth: It is rocky, has mountains, valleys and canyons, and storm systems ranging from localized tornado-like dust devils to planet-engulfing dust storms. In English, Mars carries the name of the Roman god of war and is often referred to as the 'Red Planet'.", type: .planet),
                    
                    // Mercury
                    SpaceObject(name: "Mercury", distanceInKm: 91691000, image: UIImage(named: "Mercury")!, desc: "Not the element!", description: "Zipping around the sun in only 88 days, Mercury is the closest planet to the sun, and it's also the smallest, only a little bit larger than Earth's moon. Because its so close to the sun (about two-fifths the distance between Earth and the sun), Mercury experiences dramatic changes in its day and night temperatures: Mercury temperatures can reach a scorching 840 F (450 C) in the day, which is hot enough to melt lead. Meanwhile, on the night side, temperatures drop to minus 290 F (minus 180 C).", type: .planet),
                    // The Sun
                    SpaceObject(name: "Sun", distanceInKm: 150000000, image: "☀️".image()!, desc: "A Perfect Tan", description: "Our Sun is a 4.5 billion-year-old star – a hot glowing ball of hydrogen and helium at the center of our solar system. The Sun is about 93 million miles (150 million kilometers) from Earth, and without its energy, life as we know it could not exist here on our home planet. The Sun is the largest object in our solar system. The Sun’s volume would need 1.3 million Earths to fill it. Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it.", type: .star),
                    
                    // Belt Objects
                    SpaceObject(name: "Eros", distanceInKm: 315000000, image: "🪨".image()!, desc: "🥇 NEA!", description: "Eros is famous as the first asteroid to be orbited by a spacecraft, and the first asteroid to have a spacecraft land on it. But Eros was important to astronomers as far back as 1898 when it became the first near-Earth asteroid (NEA) to be discovered. Shaped like an elongated peanut, evidence suggests that Eros could contain over 20 billion tonnes of aluminum and other rare Earth metals such as gold and platinum.", type: .asteroid),
                    
                    SpaceObject(name: "Vesta", distanceInKm: 412146000, image: "🪨".image()!, desc: "9.0%", description: "Vesta is the second most massive body in the main asteroid belt, accounting for almost nine percent of the total mass of all asteroids. Only dwarf planet Ceres is more massive in that region of rocky debris between Mars and Jupiter. It is also the brightest asteroid in the sky being occasionally visible from Earth with the naked eye. NASA’s Dawn spacecraft circled Vesta from July 16, 2011 until Sept. 5, 2012, when it departed and began its journey to dwarf planet Ceres.", type: .asteroid),
                    
                    SpaceObject(name: "Ceres", distanceInKm: 413000000, image: "🌑".image()!, desc: "Thats no moon...", description: "Dwarf planet Ceres is the largest object in the asteroid belt between Mars and Jupiter, and it's the only dwarf planet located in the inner solar system. Covered with cryovolcanoes, Ceres's surface is a mixture of water ice and rock. It was the first member of the asteroid belt to be discovered when Giuseppe Piazzi spotted it in 1801. And when NASA's Dawn arrived in 2015, Ceres became the first dwarf planet to receive a visit from a spacecraft.", type: .other),
                    // Jupiter Moons
                    SpaceObject(name: "Callisto", distanceInKm: 626847000, image: "🌖".image()!, desc: "Secret Ocean", description: "Callisto is Jupiter’s second largest moon and the third largest moon in our solar system (about the same size as Mercury). Data from NASA’s Galileo spacecraft in the 1990s revealed Callisto may have a secret: a salty ocean beneath its surface. That finding put the once seemingly dead moon on the list of worlds that could possibly harbor life.", type: .moon),
                    
                    SpaceObject(name: "Europa", distanceInKm: 628059000, image: "🌑".image()!, desc: "Ice Bath", description: "Europa is the sixth-largest moon in the Solar System and perhaps the most promising place to look for present-day environments suitable for life. Europa is thought to have an ocean of salty water below its frozen outer shell of ice.", type: .moon),
                    
                    SpaceObject(name: "Io", distanceInKm: 628280000, image: "🌕".image()!, desc: "Active 🌋", description: "Jupiter's moon Io is the most volcanically active world in the Solar System, with hundreds of volcanoes, some erupting lava fountains dozens of miles (or kilometers) high. Io is caught in a tug-of-war between Jupiter's massive gravity and the smaller but precisely timed pulls from two neighboring moons that orbit farther from Jupiter—Europa and Ganymede.", type: .moon),
                    
                    SpaceObject(name: "Ganymede", distanceInKm: 628560000, image: "🌑".image()!, desc: "Magnets...", description: "Jupiter’s icy moon Ganymede is the largest moon in our solar system, even bigger than the planet Mercury, and the dwarf planet Pluto. There’s strong evidence that Ganymede has an underground saltwater ocean that may hold more water than all the water on Earth's surface. Ganymede is the only moon known to have its own magnetic field – something typically found on planets like Earth. The magnetic field causes auroras, or bright ribbons of glowing gas, that circle the moon’s poles.", type: .moon),
                    
                    
                    SpaceObject(name: "Jupiter", distanceInKm: 628730000, image: UIImage(named: "Jupiter")!, desc: "H U G E", description: "The fifth planet from the sun, Jupiter is a giant gas world that is the most massive planet in our solar system — more than twice as massive as all the other planets combined, according to NASA. Its swirling clouds are colorful due to different types of trace gases. A major feature is the Great Red Spot, a giant storm that has raged for the last 150 years.", type: .planet),
                    
                    
                    
                   
                    // Saturn Moons
                    SpaceObject(name: "Phoebe", distanceInKm: 1262048000, image: "🌑".image()!, desc: "'Closely' related", description: "Phoebe is one of Saturn's most intriguing moons, orbiting at a distance of 8,049,668 miles (12,952,000 kilometers) from the planet, almost four times the distance from Saturn than its nearest neighbor, the moon Iapetus. Phoebe and Iapetus are the only major moons in the Saturnian system that do not orbit closely to the plane of Saturn's equator. It is estimated that Phoebe is about 50% rock, as opposed to the 35% or so that typifies Saturn's inner moons. For these reasons, scientists are coming to think that Phoebe is in fact a captured centaur, one of a number of icy planetoids from the Kuiper belt that orbit the Sun between Jupiter and Neptune.", type: .moon),
                    SpaceObject(name: "Iapetus", distanceInKm: 1271540000, image: "🌒".image()!, desc: "3/4 Ice!", description: "Iapetus is an oddly-coloured and shaped moon of Saturn. Made from approximately 3/4th ice and rock, the moon was discovered in 1671 by the astronomer Giovanni Domenico Cassini. Iapetus’ orbit is inclined to the plane of Saturn and is also quite far away. This makes it the only large moon from which an observer could see the rings.", type: .moon),
                    SpaceObject(name: "Titan", distanceInKm: 1273800000, image: "🌕".image()!, desc: "One of a kind", description: "Saturn’s largest moon Titan is an extraordinary and exceptional world. Among our solar system’s more than 150 known moons, Titan is the only one with a substantial atmosphere. And of all the places in the solar system, Titan is the only place besides Earth known to have liquids in the form of rivers, lakes and seas on its surface. Titan is larger than the planet Mercury and is the second largest moon in our solar system.", type: .moon),
                    SpaceObject(name: "Rhea", distanceInKm: 1274473000, image: "🌑".image()!, desc: "Cold Harsh World", description: "Rhea, major regular moon of Saturn and the planet’s second largest, after Titan. It was discovered in 1672 by the Italian-born French astronomer Gian Domenico Cassini and named for a Titan of Greek mythology. Much like Iaeptus, the moon is mainly made up of ice and has a freezing surface.", type: .moon),
                    
                    SpaceObject(name: "Saturn", distanceInKm: 1275000000, image: UIImage(named: "Saturn")!, desc: "Rings... lots of them", description: "The sixth planet from the sun and second-largest planet in our solar system, Saturn is known most for its thousands rings. Made up of ice and rock, scientists are not yet sure how they formed. The gaseous planet is mostly hydrogen and helium and has numerous moons. Saturn lacks a definite surface, though it may have a solid core, and is the only planet of the Solar System that is less dense than water - about 30% less!", type: .planet),
                    
                    
                    // Uranus Moons 2723010000
                    SpaceObject(name: "Titania", distanceInKm: 2723514160, image: "🌑".image()!, desc: "Space Canyon", description: "Titania is the largest moon of Uranus. It is marked by a few large impact basins, but is generally covered with small craters and very rough rocks. There also exists a 1,600 kilometer (1,000 mile) long trench on the moon's surface. There are many faults on Titania indicating there has been internal forces molding its surface.", type: .moon),
                    SpaceObject(name: "Ariel", distanceInKm: 2723758760, image: "🌔".image()!, desc: "Under the sea", description: "Ariel is a relatively small satellite and is the brightest moon of Uranus. The surface is pock-marked with craters, but the most outstanding features are long rift valleys stretching across the entire surface. Canyons much like the ones on Mars appear in the pictures. The canyon floors appear as though they have been smoothed by a fluid. The fluid could not have been water because water acts like steel at these temperatures. The flow marks might have been made by ammonia, methane or even carbon monoxide.", type: .moon),
                    SpaceObject(name: "Miranda", distanceInKm: 2723820000, image: "🌑".image()!, desc: "Don't fall!", description: "Miranda is a small satellite with a diameter of 470 kilometers (290 miles). Its surface is unlike anything in the solar system with features that are jumbled together in a haphazard fashion. Miranda consists of huge fault canyons as deep as 20 kilometers (12 miles), terraced layers and a mixture of old and young surfaces. The younger regions might have been produced by incomplete differentiation of the moon, a process in which upwelling of lighter material surfaced in limited areas.", type: .moon),
                    SpaceObject(name: "Oberon", distanceInKm: 2723367400, image: "🌑".image()!, desc: "A dark mystery...", description: "Oberon is a moon of Uranus that is characterized by an old, heavily cratered, and icy surface. Though little is known about the moon, the surface shows little evidence of internal activity other than some unknown dark material that apparently covers the floors of many craters.", type: .moon),
                    
                    SpaceObject(name: "Uranus", distanceInKm: 2723950000, image: UIImage(named: "Uranus")!, desc: "Sideways", description: "The seventh planet from the sun and third-largest diameter in our solar system, Uranus is an oddball. It has clouds made of hydrogen sulfide, the same chemical that makes rotten eggs smell so foul. It rotates from east to west like Venus. But unlike Venus or any other planet, its equator is nearly at right angles to its orbit — it basically orbits on its side.",type: .planet),
                    
                    // Neptune Moons
                    SpaceObject(name: "Sao", distanceInKm: 4328980000, image: "🌑".image()!, desc: "Fun Sized", description: "Sao is one of three tiny moons (ranging in size from 18 to 24 miles—or 30 to 40 km) of Neptune discovered in 2002 using innovative ground-based telescope techniques. The moons are so distant and so small they are about 100 million times fainter than can be seen with the unaided eye. The moons were missed by the Voyager 2 spacecraft in 1989 because they are so faint and distant from Neptune.", type: .moon),
                    
                    SpaceObject(name: "Triton", distanceInKm: 4338780000, image: "🌗".image()!, desc: "Retro!", description: "Triton is the largest natural satellite of the planet Neptune, and was the first Neptunian moon to be discovered, on October 10, 1846, by English astronomer William Lassell. It is the only large moon in the Solar System with a retrograde orbit, an orbit in the direction opposite to its planet's rotation.", type: .moon),
                    
                    SpaceObject(name: "Proteus", distanceInKm: 4351282400, image: "🪨".image()!, desc: "Odd box", description: "Proteus is one of the largest of Neptune's known moons, although it is not as big as Triton. The moon has an odd box-like shape and if it had just a little more mass it would be able to transform into a sphere. Proteus orbits Neptune about every 27 hours.", type: .moon),
                    
                    
                    SpaceObject(name: "Neptune", distanceInKm: 4351400000, image: UIImage(named: "Neptune")!, desc: "Invisible...", description: "The eighth planet from the sun, Neptune is about the size of Uranus and is known for supersonic strong winds. Neptune is far out and cold being more than 30 times as far from the sun as Earth. Neptune was the first planet predicted to exist by using math, before it was visually detected and is the only planet in our solar system not visible to the naked eye.",type: .planet),
                    
                    // Pluto Moons
                    
                    
                    SpaceObject(name: "Pluto", distanceInKm: 5890000000, image: UIImage(named: "Pluto")!, desc: "Not sure either", description: "Once the ninth planet from the sun, Pluto is unlike other planets in many respects. It is smaller than Earth's moon; its orbit is highly elliptical, falling inside Neptune's orbit at some points and far beyond it at others; and Pluto's orbit doesn't fall on the same plane as all the other planets —  instead, it orbits 17.1 degrees above or below. Now a dwarf planet, Pluto resides in the Kuiper Belt.", type: .other),
                    
                    SpaceObject(name: "Eris", distanceInKm: 12000000000, image: "🌑".image()!, desc: "Unvisited!", description: "Eris is the most distant dwarf planet, located beyond the orbit of Neptune. A cold icy world, it was discovered in 2005 and was originally classified as a planet. It is the second-largest dwarf planet discovered and it led to both it and Pluto’s demotion from planets to dwarf planets. It is also the largest object that has not yet been visited by a spacecraft. This far away it takes light over 9 hours to reach here!", type: .other),
                    
                    SpaceObject(name: "Interstellar Space", distanceInKm: 18000000000, image: "✨".image()!, desc: "True Voyager", description: "Scientists define the beginning of interstellar space as the place where the Sun's constant flow of material and magnetic field stop affecting its surroundings. This place is called the heliopause. It marks the end of a region created by our Sun that is called the heliosphere. On Aug. 25, 2012, Voyager 1 flew beyond the heliopause and entered interstellar space, making it the first human-made object to explore this new territory.", type: .other),
                    
                    
                    SpaceObject(name: "Luna", distanceInKm: 384400, image: "🌑".image()!, desc: "A nightly thing", description: "Earth's Moon is the only place beyond Earth where humans have set foot. The brightest and largest object in our night sky, the Moon makes Earth a more livable planet by moderating our home planet's wobble on its axis, leading to a relatively stable climate. It also causes tides, creating a rhythm that has guided humans for thousands of years.", type: .moon),
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    SpaceObject(name: "Kuiper Belt", distanceInKm: 4334000000, image: "🪨".image()!, desc: "Far from home", description: "Beyond the gas giant Neptune lies a region of space filled with icy bodies. Known as the Kuiper Belt, this chilly expanse holds trillions of objects — remnants of the solar system's early history. Like the asteroid belt, it has also been shaped by a giant planet, although it's more of a thick disk (like a donut) than a thin belt.", type: .other),
                    SpaceObject(name: "Andromeda Galaxy", distanceInKm: 23651826181452, image: "🌀".image()!, desc: "Epilogue", description: "The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy approximately 2.5 million light-years (770 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way. The galaxy's name stems from the area of Earth's sky in which it appears, the constellation of Andromeda, which itself is named after the Ethiopian (or Phoenician) princess who was the wife of Perseus in Greek mythology.", type: .galaxy)]
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

func getBorderColor(so: SpaceObject) -> Color {
    switch so.type {
    case .moon:
        return Color.blue
    case .asteroid:
        return Color.gray
    case .planet:
        return Color.green
    case .other:
        return Color.white
    case .star:
        return Color.orange
    case .galaxy:
        return Color.purple
    }
    
}
