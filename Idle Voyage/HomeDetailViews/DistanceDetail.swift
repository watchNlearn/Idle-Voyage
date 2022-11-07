//
//  DistanceDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/21/22.
//

import SwiftUI

struct DistanceDetail: View {
    // Get our environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>    
    
    let background = getRandomGradient()
    
    @State private var animateGradient = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Voyage Distance  " + user.first!.shipPref!)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                VStack (alignment: .leading) {
                    Text("Travelled from 🌎")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .padding(.trailing, 10)
                        .padding(.bottom, 2)

                    HStack {
                        Text(String(user.first!.distanceInKm.rounded(toPlaces: 0).formattedWithSeparator) + " km")
                            .font(Font.subheadline.monospacedDigit())

                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 1)
                    HStack {
                        Text(String((user.first!.distanceInKm*0.62137).rounded(toPlaces: 0).formattedWithSeparator) + " mi")
                            .font(Font.subheadline.monospacedDigit())
                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 1)

                    HStack {
                        Text(String((user.first!.distanceInKm/149597870.700).rounded(toPlaces: 4).formattedWithSeparator) + " au")
                            .font(Font.subheadline.monospacedDigit())
                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 5)
                }
                VStack(alignment: .leading) {
                    Text("Remaining to " + getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .padding(.trailing, 10)
                        .padding(.bottom, 2)
                    HStack {
                        Text(String(user.first!.distanceRemainInKm.rounded(toPlaces: 0).formattedWithSeparator) + " km")
                            .font(Font.subheadline.monospacedDigit())
                            .frame(alignment: .leading)
                            .padding(.trailing, 4)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 2)

                    HStack {
                        Text(String((user.first!.distanceRemainInKm*0.62137).rounded(toPlaces: 0).formattedWithSeparator) + " mi")
                            .font(Font.subheadline.monospacedDigit())

                            .frame(alignment: .leading)
                            .padding(.trailing, 4)
                            .cornerRadius(6)
                            .opacity(0.8)
                        
                    }
                    .padding(.bottom, 2)
                    HStack {
                        Text(String((user.first!.distanceRemainInKm/149597870.700).rounded(toPlaces: 4).formattedWithSeparator) + " au")
                            .font(Font.subheadline.monospacedDigit())
                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 20)
                }
            }
            Group {
                Text("Current Speed")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("NASA Parker Solar Probe   🛰️")
                    .font(.subheadline)
                Text("700,000 km/h")
                    .font(.subheadline)
                    .opacity(0.8)
                Text("430,000 mi/h")
                    .font(.subheadline)
                    .opacity(0.8)
                    .padding(.trailing, 10)
                Text("0.064% c")
                    .font(.subheadline)
                    .opacity(0.8)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.init(hex: "100b1f"))
        .cornerRadius(30)
    }
}
