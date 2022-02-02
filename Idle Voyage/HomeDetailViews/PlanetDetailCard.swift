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
    
    let spaceObjImage: UIImage
    let spaceObjName: String
    let spaceObjDesc: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Image(uiImage: spaceObjImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .frame(width: 100)
                .padding(.trailing, 50)
            
            Text(spaceObjName)
                .font(.title)
                .fontWeight(.bold)
            //434959.835
            Text(spaceObjDesc)
                .font(.subheadline)
                .fontWeight(.medium)
//            Text(getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).description)
//                .opacity(0.8)
//                .padding(.bottom, 10)
            
           
                
        }
        .background(
            StarsView(starInt: 5)
        )
        .foregroundColor(.white)
//        .frame(maxWidth: .infinity)
        .padding()
//        .frame(width: 300, height: 400)
        .background(LinearGradient(colors: [Color.init(hex: "000000"),Color.init(hex: "100b1f"),Color.init(hex: "000000")], startPoint: .trailing, endPoint: .topLeading)
                        .hueRotation(.degrees(animateGradient ? 287 : 370))
                        .ignoresSafeArea()
            )
        .cornerRadius(30)
        
    }
    
}
//struct PlanetDetailCard_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailCard()
//    }
//}
