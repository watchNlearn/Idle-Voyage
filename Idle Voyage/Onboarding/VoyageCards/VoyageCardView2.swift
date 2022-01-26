//
//  VoyageCardView2.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct VoyageCardView2: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
           
            Text("Just how fast?")
                .font(.title)
                .fontWeight(.bold)
            Text("Space is big... really big, so to speed things up we'll be traveling as the fastest object ever made!")
                .opacity(0.7)
            Image(uiImage: "🛰️".image()!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
            //434959.835
            Text("NASA Parker Solar Probe")
                .font(.subheadline)
                .fontWeight(.medium)
            Text("700,000 km/h")
                .font(.subheadline)
                .fontWeight(.light)
            Text("430,000 mi/h")
                .font(.subheadline)
                .fontWeight(.light)
            Text("0.064% c")
                .font(.subheadline)
                .fontWeight(.light)
                
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(30)
        
    }
}

//
//struct VoyageCardView2_Previews: PreviewProvider {
//    static var previews: some View {
//        VoyageCardView2()
//    }
//}
