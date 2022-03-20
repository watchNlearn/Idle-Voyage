//
//  DistanceDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/21/22.
//

import SwiftUI

struct DistanceDetail: View {
    // Get out environment and users
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
//                            .fontWeight(.thin)
                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 1)

                    HStack {
                        Text(String((user.first!.distanceInKm/149597870.700).rounded(toPlaces: 4).formattedWithSeparator) + " au")
                            .font(Font.subheadline.monospacedDigit())
//                            .fontWeight(.thin)
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
//                            .font(.subheadline)
//                            .fontWeight(.thin)
                            .font(Font.subheadline.monospacedDigit())

                            .frame(alignment: .leading)
                            .padding(.trailing, 4)
                            .cornerRadius(6)
                            .opacity(0.8)
                        
                    }
                    .padding(.bottom, 2)

                    HStack {
                        Text(String((user.first!.distanceRemainInKm*0.62137).rounded(toPlaces: 0).formattedWithSeparator) + " mi")
//                            .font(.subheadline)
//                            .fontWeight(.thin)
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
//                            .fontWeight(.thin)
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
//                Text("Space is big... really big, so to speed things up we'll be traveling as the fastest object ever made!")
//                    .opacity(0.8)
//                Image(uiImage: "🛰️".image()!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(height: 50)
//                    .frame(maxWidth: .infinity)
                //434959.835
                Text("NASA Parker Solar Probe   🛰️")
                    .font(.subheadline)
                //                    .fontWeight(.medium)
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
//        .background(
//            StarsView(starInt: 43)
//        )
        .foregroundColor(.white)
        .padding()
        .background(Color.init(hex: "100b1f"))
        //        .frame(width: .infinity, height: .infinity)
//        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom))
//        .background(LinearGradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "f8bc04"), Color.init(hex: "101b39"),Color.init(hex: "101b39")], startPoint: .bottomTrailing, endPoint: .topLeading)
//                        .hueRotation(.degrees(animateGradient ? 329 : 0))
//                        .ignoresSafeArea()
//                        .onAppear {
//            withAnimation(.easeInOut(duration: 12.0).repeatForever(autoreverses: true)) {
//                                animateGradient.toggle()
//                            }
//                    })
        .cornerRadius(30)
        
    }


    
}

//struct DistanceDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DistanceDetail()
//    }
//}
    
    
////        let currentUser = user.first!
//    Group {
//        // MARK: DISTANCE
//        VStack(alignment: .leading) {
//            Text("Distance")
//                .font(.title)
//                .fontWeight(.bold)
//                .frame(alignment: .leading)
//                .padding(.trailing, 5)
//                .foregroundColor(.white)
//            Text("Travelled")
//                .font(.headline)
//                .fontWeight(.thin)
//                .frame(alignment: .leading)
//                .padding(.trailing, 10)
//            HStack {
//                Text(String(user.first!.distanceInKm.rounded(toPlaces: 1).formattedWithSeparator))
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 8)
//                    .padding(.trailing, 8)
//                    .background(Color.orange)
//                    .cornerRadius(6)
//
//                Text("km")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//
//            }
//            .padding(.bottom, 5)
//            HStack {
//                Text(String(user.first!.distanceInKm.rounded(toPlaces: 1).formattedWithSeparator))
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 8)
//                    .padding(.trailing, 8)
//                    .background(Color.orange)
//                    .cornerRadius(6)
//
//                Text("mi")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//
//            }
//            .padding(.bottom, 5)
//
//            Text("Remaining")
//                .font(.headline)
//                .fontWeight(.thin)
//                .frame(alignment: .leading)
//                .padding(.trailing, 10)
//            HStack {
//                Text(String(user.first!.distanceRemainInKm.rounded(toPlaces: 1).formattedWithSeparator))
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//                    .padding(.trailing, 4)
//                    .background(Color.orange)
//                    .cornerRadius(6)
//
//                Text("km")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//
//
//            }
//            .padding(.bottom, 5)
//            HStack {
//                Text(String(user.first!.distanceRemainInKm.rounded(toPlaces: 1).formattedWithSeparator))
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//                    .padding(.trailing, 4)
//                    .background(Color.orange)
//                    .cornerRadius(6)
//
//                Text("mi")
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .frame(alignment: .leading)
//                    .padding(.leading, 4)
//
//
//            }
//            .padding(.bottom, 5)
//
//
//        }
//
//
//
//    }
//}
