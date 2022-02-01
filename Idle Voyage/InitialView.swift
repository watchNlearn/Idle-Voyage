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
    
    @State var leftOffset: CGFloat = -1000
    @State var rightOffset: CGFloat = 1000
//    @State var shouldAnimate = false

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
//            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
//                showingOnboarding = true
//            }
            ShootingStarsView()


            HomeView()
                .onAppear {
                    print("On Appear")
                    let currentUser = user.first!
                    
                    let startDate = currentUser.startDate
                    //let lastSaveDate = currentUser.lastSaveDate
                    
                    //let elapsedTimeSinceSave = Date().timeIntervalSince1970 - lastSaveDate
                    let totalElapsedTime = Date().timeIntervalSince1970 - startDate
                    
                    let elapsedDistance = speedPerSecKm * totalElapsedTime
                    
                    currentUser.elapsedTime = totalElapsedTime // Update our entire elapsed time 35 1
                    
                    currentUser.distanceInKm = elapsedDistance
                    
                    let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)

                    currentUser.distanceRemainInKm = nextSpaceObj.distanceInKm - currentUser.distanceInKm
                    
                    let progress = 1 - (currentUser.distanceRemainInKm/(currentUser.distanceInKm - nextSpaceObj.distanceInKm))
                    currentUser.progress = Float(progress)
                    try? moc.save()
                    
                }
                .overlay(
                    StarsView(starInt: 78)
                )
//            Image(uiImage: "🛸".image()!)
//                .frame(width: 80, height: 80)
//
//                .position(x: 0, y: 490)
//                .offset(x: shouldAnimate ? 1000 : -1000)
//                .offset(y: shouldAnimate ? -1000 : 1000)
//
//                .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false).delay(2),value: shouldAnimate ? 1000 : -1000)
//                .onAppear {
//                    self.shouldAnimate = true
//                }
//                .zIndex(1)
            
        }

    }
}

//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}


