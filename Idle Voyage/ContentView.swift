//
//  ContentView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var animateGradient = false

    
    var body: some View {
//        Color.init(hex: "081448")
//        .ignoresSafeArea()
//        .overlay(
//            InitialView()
//        )
        InitialView()
        .background(LinearGradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")], startPoint: .topTrailing, endPoint: .bottomLeading)
                        .hueRotation(.degrees(animateGradient ? 120 : 0))
                        .ignoresSafeArea()
                        .onAppear {
            withAnimation(.easeInOut(duration: 10.0).repeatForever(autoreverses: true)) {
                                animateGradient.toggle()
                            }
                    })
        
    }
    
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


