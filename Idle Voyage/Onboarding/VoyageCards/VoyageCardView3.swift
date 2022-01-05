//
//  VoyageCardView3.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct VoyageCardView3: View {

    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                OnboardingWidgetView()
            }
           
            Text("Start and Forget")
                .font(.title)
                .fontWeight(.bold)
            Text("Idle Voyage keeps track of your voyage in the background! Add the widget and track your progress.")
                .opacity(0.7)
                
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")]), startPoint: .topTrailing, endPoint: .leading))
        .cornerRadius(30)
    }
}
