//
//  ContentView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animateGradient = false
    let background = getRandomGradient()

    
    var body: some View {
//        Color.init(hex: "081448")
//        .ignoresSafeArea()
//        .overlay(
//            InitialView()
//        )
        InitialView()
            .background(LinearGradient(colors: background.colors, startPoint: background.start, endPoint: background.end)
                            .hueRotation(.degrees(animateGradient ? background.rotation : 370))
                            .ignoresSafeArea()
                            .onAppear {
                withAnimation(.easeInOut(duration: background.duration).repeatForever(autoreverses: true)) {
                                    animateGradient.toggle()
                                }
                        })
        
        // top left to bottom right middle stripe galaxy
//            .background(LinearGradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")], startPoint: .topTrailing, endPoint: .leading)
//                            .hueRotation(.degrees(animateGradient ? 160 : 0))
//                            .ignoresSafeArea()
//                            .onAppear {
//                withAnimation(.easeInOut(duration: 20.0).repeatForever(autoreverses: true)) {
//                                    animateGradient.toggle()
//                                }
//                        })
        
        //middle left to top right stripe galaxy look
//            .background(LinearGradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "f8bc04"), Color.init(hex: "101b39"),Color.init(hex: "101b39")], startPoint: .bottomTrailing, endPoint: .topLeading)
//                            .hueRotation(.degrees(animateGradient ? 329 : 0))
//                            .ignoresSafeArea()
//                            .onAppear {
//                withAnimation(.easeInOut(duration: 12.0).repeatForever(autoreverses: true)) {
//                                    animateGradient.toggle()
//                                }
//                        })
        
        
        
        // bottom left planetish
//        .background(LinearGradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")], startPoint: .topTrailing, endPoint: .bottomLeading)
//                        .hueRotation(.degrees(animateGradient ? 120 : 0))
//                        .ignoresSafeArea()
//                        .onAppear {
//            withAnimation(.easeInOut(duration: 10.0).repeatForever(autoreverses: true)) {
//                                animateGradient.toggle()
//                            }
//                    })
        
    }
    
}

struct BackgroundObject {
    var colors: [Color]
    var start: UnitPoint
    var end: UnitPoint
    var rotation: Double
    var duration: Double
}


func getRandomGradient() -> BackgroundObject {
    let backgrounds = [
        // bottom left planetish
        BackgroundObject(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")], start: .topTrailing, end: .bottomLeading, rotation: 120, duration: 20),
        //middle left to top right stripe galaxy look
        BackgroundObject(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "f8bc04"), Color.init(hex: "101b39"),Color.init(hex: "101b39")], start: .bottomTrailing, end: .topLeading, rotation: 329, duration: 26),
        // top left to bottom right middle stripe galaxy
        BackgroundObject(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")], start: .topTrailing, end: .leading, rotation: 160, duration: 23),
        BackgroundObject(colors: [Color.init(hex: "1b1145"),Color.init(hex: "021f4b"), Color.init(hex: "4c3b71"), Color.init(hex: "8749bc"), Color.init(hex: "4c3b71"), Color.init(hex: "021f4b"),Color.init(hex: "1b1145")], start: .leading, end: .bottomTrailing, rotation: 59, duration: 40),
        // Black
        BackgroundObject(colors: [Color.init(hex: "000000"),Color.init(hex: "100b1f"),Color.init(hex: "000000")], start: .bottom, end: .leading, rotation: 219, duration: 17),
 
        BackgroundObject(colors: [Color.init(hex: "000000"),Color.init(hex: "100b1f"),Color.init(hex: "000000")], start: .trailing, end: .topLeading, rotation: 287, duration: 32)
    ]
    
    return backgrounds.randomElement()!
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


