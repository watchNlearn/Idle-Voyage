//
//  InitialView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct InitialView: View {
    @State var showingOnboarding = true
    
    var body: some View {
        // If user hasn't done onboarding
        if showingOnboarding {
            OnboardingView(valueFromInitialView: $showingOnboarding)
        }
        // Otherwise show home
        else {
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                showingOnboarding = true
            }
        }

    }
}

//struct InitialView_Previews: PreviewProvider {
//    static var previews: some View {
//        InitialView()
//    }
//}
struct AddView: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button("Dismiss") {
            isPresented = false
        }
    }
}


