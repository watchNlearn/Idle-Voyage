//
//  ContentView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    
    // test
    var body: some View {
        Color.init(hex: "081448")
        .ignoresSafeArea()
        .overlay(
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
//                ForEach(0 ..< 5) { item in
//                    VoyageCardView()
//                }
                VoyageCardView()
                Spacer()
                VoyageCardView2()
                Spacer()
                VoyageCardView3()

            }
            .padding()
        })
        
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
