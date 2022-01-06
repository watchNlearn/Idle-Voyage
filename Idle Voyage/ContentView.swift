//
//  ContentView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Color.init(hex: "081448")
        .ignoresSafeArea()
        .overlay(
            InitialView()
        )
        
    }
    
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


