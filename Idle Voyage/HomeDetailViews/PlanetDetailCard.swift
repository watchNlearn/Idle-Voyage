//
//  PlanetDetailCard.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/2/22.
//

import SwiftUI

struct PlanetDetailCard: View {
    
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    @State private var animateGradient = false
    let background = getRandomGradient()
    
    let spaceObject: SpaceObject

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(uiImage: spaceObject.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .frame(width: 60)
                .padding(.leading, 30)
                .padding(.trailing, 30)
            Text(spaceObject.name)
                .font(.title)
                .fontWeight(.bold)
            //434959.835
            Text(spaceObject.desc)
                .font(.subheadline)
                .fontWeight(.medium)
            HStack {
                Text(spaceObject.distanceInKm.formattedWithSeparator)
                    .opacity(0.8)
                    .padding(.bottom, 10)
                    .foregroundColor(Color(UIColor.green))
                Text("km")
                    .opacity(0.8)
                    .padding(.bottom, 10)
            }
        }
        .background(
            StarsView(starInt: 10)
        )
        .foregroundColor(.white)
        .padding()
        .background(LinearGradient(colors: [Color.init(hex: "000000"),Color.init(hex: "100b1f"),Color.init(hex: "000000")], startPoint: .trailing, endPoint: .topLeading)
                        .hueRotation(.degrees(animateGradient ? 287 : 370))
                        .ignoresSafeArea()
            )
        .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(getBorderColor(so: spaceObject), lineWidth: 4)
            )
        .cornerRadius(30)
    }
}
//struct PlanetDetailCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailCard()
//    }
//}
