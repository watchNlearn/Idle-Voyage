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
    // Tolerance 0.1 to give some wiggle room
    let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Group {
                Text("Just how fast?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Space is big... really big so to speed things up we'll be traveling as the fastest manmade object ever!")
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
                Text("434,959.835 mi/h")
                    .font(.subheadline)
                    .fontWeight(.light)
                Text("0.064% c")
                    .font(.subheadline)
                    .fontWeight(.light)
            }
            
            

        }
        .foregroundColor(.white)
        .padding()
//        .frame(width: .infinity, height: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom))
//        .cornerRadius(30)
        
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
