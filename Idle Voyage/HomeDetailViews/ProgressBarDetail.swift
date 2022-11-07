//
//  ProgressBarDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/2/22.
//

import SwiftUI

struct ProgressBarDetail: View {
    
    let timer: Timer.TimerPublisher

    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>

    @State var progressValue: Float = 0.0
    
    let spaceObject: SpaceObject
    
    
    var body: some View {
        HStack {
            Image(uiImage: spaceObjectsSorted.first!.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
                .frame(width: 25)
            
            MainProgressBar(value: $progressValue).frame(maxWidth: .infinity)
                .frame(height: 10)
                .onAppear {
                    let progress = (user.first!.distanceInKm/spaceObject.distanceInKm)
                    progressValue = Float(progress)
                }
                .onReceive(timer) { _ in
                    let progress = (user.first!.distanceInKm/spaceObject.distanceInKm)
                    progressValue = Float(progress)
                }
            Image(uiImage: spaceObject.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
                .frame(width: 25)
        }
        
    }
}

//struct ProgressBarDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarDetail()
//    }
//}
