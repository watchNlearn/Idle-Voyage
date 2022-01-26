//
//  ApproachingDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/25/22.
//

import SwiftUI

//
//  Approaching Detail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/25/22.
//

import SwiftUI

struct ApproachingDetail: View {
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack {
                HStack{
                    Spacer()
                    Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
//                    Spacer()
                }
                HStack {
                    Image(uiImage: user.first!.shipPref!.image()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                    Spacer()
                }
                
            }
            
            Text("Approaching " + getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                .font(.title)
                .fontWeight(.bold)
            //434959.835
            Text(getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).desc)
                .font(.subheadline)
                .fontWeight(.medium)
            Text(getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).description)
                .opacity(0.7)
            
            
           
                
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .frame(width: 300, height: 400)
        .background(Color.init(hex: "100b1f"))
        .cornerRadius(30)
        
    }
    
}

//struct Approaching_Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        Approaching_Detail()
//    }
//}
