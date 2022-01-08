//
//  InitialView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct InitialView: View {
    // We should on initial view load up and calculate differences
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    
    //should grab from userdefaults eventually
    @State var showingOnboarding = true
    // Speed
    let speedPerSecKm = 11675.6564657

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
                    let currentUser = user.first!
                    
                    // Get start date in seconds
                    let startDate = currentUser.startDate
                    // Calulate elapsed time of journey thus far in seconds
                    let elapsedTime = Date().timeIntervalSince1970 - startDate
                    let elapsedTimeSinceSave = Date().timeIntervalSince1970 - currentUser.lastSaveDate

                    // Update elapsed time
                    currentUser.elapsedTime = elapsedTime
//                    print(elapsedTime)
                    // Update TOTAL DISTANCE TRAVELED
                    let elapsedTotalDistance = elapsedTime * speedPerSecKm
//                    print(elapsedTime)
                    currentUser.distanceInKm = elapsedTotalDistance
                    
                    // Need to update this many KM on remaining
                    let totalDistanceRemaining = currentUser.distanceRemainInKm
                    let elapsedDistance = elapsedTimeSinceSave * speedPerSecKm
                    var elapsedRemain = totalDistanceRemaining - elapsedDistance
                    let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)

                    // lets say elapsed remain is negative! User passed planet while app in background
                    while (elapsedRemain < 0) {
                        // Some sort of get next function
//                        let spaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        // get the next space obj - abs val of remain
                        // repeat loop if neg
                        elapsedRemain = nextSpaceObj.distanceInKm - abs(elapsedRemain)
                    }
                    currentUser.distanceRemainInKm = elapsedRemain
//                    let spaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                    let progress = 1 - (currentUser.distanceRemainInKm/nextSpaceObj.distanceInKm)
                    currentUser.progress = Float(progress)
                    try? moc.save()
                }
            
        }

    }
}
func updateUser() {
    
}

//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}



