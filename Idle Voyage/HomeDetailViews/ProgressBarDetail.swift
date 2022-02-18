//
//  ProgressBarDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/2/22.
//

import SwiftUI

struct ProgressBarDetail: View {
    
   // let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()
    
    let timer: Timer.TimerPublisher

    
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>

    @State var progressValue: Float = 0.0
    
    let spaceObject: SpaceObject
    
    
    var body: some View {
        HStack {
//            let num = Double(progressValue) * 100
//            Text(String(num.rounded(toPlaces: 3)) + "%")
//                .font(.headline)
//                .fontWeight(.semibold)
//                .foregroundColor(Color.white)
////                    .padding(.leading, 10)
//            Spacer()
            Image(uiImage: spaceObjectsSorted.first!.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 25)
                .frame(width: 25)
            
            MainProgressBar(value: $progressValue).frame(maxWidth: .infinity)
                .frame(height: 10)
//                .frame(width: 150)
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
