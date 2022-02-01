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
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
    //                ForEach(0 ..< 5) { item in
    //                    VoyageCardView()
    //                }
                    VoyageCardView()
                        .overlay(
                            StarsView(starInt: 20)
                        )
                    Spacer()
                    VoyageCardView2()
                        .overlay(
                            StarsView(starInt: 20)
                        )
                    Spacer()
                    VoyageCardView3()
                        .overlay(
                            StarsView(starInt: 20)
                        )
                    Spacer()
                    VoyageCardView4(valueFromOnboardingView: $valueFromInitialView)
                        .overlay(
                            StarsView(starInt: 20)
                        )
                    
                }
                .padding()
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//    }
//}
