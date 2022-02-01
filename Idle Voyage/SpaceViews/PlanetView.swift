//
//  PlanetView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/1/22.
//

import SwiftUI

struct PlanetView: View {
    
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>


    let index: Int
    let offset: CGSize

    var body: some View {
        Image(uiImage: spaceObjectsSorted.randomElement()!.image)
            .resizable()
            .scaledToFit()
            .frame(width: 6, height: 6)
            .offset(offset)
            .zIndex(-1)
    }
}

//struct PlanetView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetView()
//    }
//}
