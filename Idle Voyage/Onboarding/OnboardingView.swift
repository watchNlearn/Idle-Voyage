//
//  OnboardingView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct OnboardingView: View {
    // Pass binding up to init view
    @Binding var valueFromInitialView : Bool

    var body: some View {
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
                Spacer()
                VoyageCardView4(valueFromOnboardingView: $valueFromInitialView)
                
            }
            .padding()
            
        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
