//
//  OnboardingWidgetView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct OnboardingWidgetView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Just how fast?")
                .font(.title)
                .fontWeight(.bold)

           
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "002AFF"), Color.init(hex: "EE2A7B"), Color.init(hex: "1A2C80")]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(40)
        
    }
}

struct OnboardingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingWidgetView()
    }
}
