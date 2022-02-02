//
//  ProgressDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/1/22.
//

import SwiftUI

struct ProgressDetail: View {
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>

    
    var body: some View {
        VStack {
            Text("Voyage Progress  " + user.first!.shipPref!)
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0...spaceObjectsSorted.count-1, id: \.self) { index in
                        PlanetDetailCard(spaceObject: spaceObjectsSorted[index])
                    }
                }
            }
            
        }
        .background(StarsView(starInt: 20))
        .foregroundColor(.white)
        .padding()
        .background(Color.init(hex: "100b1f"))
        .cornerRadius(30)
        
    }
}

//struct ProgressDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressDetail()
//    }
//}
