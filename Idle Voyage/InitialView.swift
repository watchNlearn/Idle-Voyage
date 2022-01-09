//
//  InitialView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct InitialView: View {
//    @Environment(\.scenePhase) var scenePhase
    // We should on initial view load up and calculate differences
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    
    //should grab from userdefaults eventually
    @State var showingOnboarding = true
    // testing speed
//    let speedPerSecKm = 2675000.6564657
    //PROD: USE THIS SPEED FOR SECONDS
    let speedPerSecKm = 194.444444443
    var body: some View {
        // If user hasn't done onboarding
        if showingOnboarding {
            OnboardingView(valueFromInitialView: $showingOnboarding)
                .transition(.backslide)
                
        }
        // Otherwise show home
        else {
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                showingOnboarding = true
            }
            
            
            HomeView()
                .onAppear {
                    print("On Appear")
                    let currentUser = user.first!
                    let lastSaveDate = currentUser.lastSaveDate
                    let elapsedTime = Date().timeIntervalSince1970 - lastSaveDate
                    let elapsedDistance = speedPerSecKm * elapsedTime
                    let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                    
                    currentUser.elapsedTime += elapsedTime
                    
                    currentUser.distanceInKm += elapsedDistance
                    
                    
                    currentUser.distanceRemainInKm = nextSpaceObj.distanceInKm - currentUser.distanceInKm
                    
                    let progress = 1 - (currentUser.distanceRemainInKm/(currentUser.distanceInKm - nextSpaceObj.distanceInKm))
                    currentUser.progress = Float(progress)
                    try? moc.save()
                    
                }
            
        }

    }
}

//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}



