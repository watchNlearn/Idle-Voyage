//
//  Idle_VoyageApp.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

@main
struct Idle_VoyageApp: App {
    
    @StateObject private var dataController = DataController()
    
    // Upon app load we want to load up our data controller
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
