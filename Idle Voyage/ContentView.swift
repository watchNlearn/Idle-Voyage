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


