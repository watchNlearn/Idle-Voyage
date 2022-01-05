//
//  VoyageCardView4.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct VoyageCardView4: View {
    // Binding from prev view
    @Binding var valueFromOnboardingView : Bool

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Here we go!")
                .font(.title)
                .fontWeight(.bold)
            HStack(alignment: .center, spacing: 8) {
                Button(action: {
                    // Button press update value
                    valueFromOnboardingView = false
                }) {
                  HStack{
                    Text("This is a button")
                    .padding(.horizontal)
                      Image(uiImage: "🚀".image()!)
                  }
                  .padding()
                }
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
            }
           
            Text("Tap the green button to liftoff")
                .opacity(0.7)
                
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "04040c"), Color.init(hex: "908390"), Color.init(hex: "496c99"), Color.init(hex: "14140c"), Color.init(hex: "141530")]), startPoint: .topTrailing, endPoint: .leading))
        .cornerRadius(30)
    }
}

//struct VoyageCardView4_Previews: PreviewProvider {
//    static var previews: some View {
//        VoyageCardView4()
//    }
//}
