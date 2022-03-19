//
//  LeavingDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/25/22.
//

import SwiftUI

struct LeavingDetail: View {
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack {
                HStack{
                    Spacer()
                    Image(uiImage: user.first!.shipPref!.image()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                        .padding(.trailing, 50)
                }
                HStack {
                    Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                        .padding(.leading, 20)

                    Spacer()
                }
                
            }
            
            Text("Leaving " + getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                .font(.title)
                .fontWeight(.bold)
            //434959.835
            Text(getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).desc)
                .font(.subheadline)
                .fontWeight(.medium)
            Text(getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).description)
                .opacity(0.8)
                .padding(.bottom, 10)

            
            
                
        }
        .background(
            StarsView(starInt: 47)
        )
        .foregroundColor(.white)
//        .frame(maxWidth: .infinity)
        .padding()
//        .frame(width: 300, height: 400)
        .background(Color.init(hex: "100b1f"))
        .cornerRadius(30)
        
    }
    
}

//struct LeavingDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LeavingDetail()
//    }
//}
