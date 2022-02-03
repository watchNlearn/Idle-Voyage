//
//  ProgressDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/1/22.
//

import SwiftUI

struct ProgressDetail: View {
    
    let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()
    
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>

    @State var progressValue: Float = 0.0

    var body: some View {
        VStack {
            Text("Voyage Progress  " + user.first!.shipPref!)
                .font(.title)
                .fontWeight(.bold)
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0...spaceObjectsSorted.count-1, id: \.self) { index in
                            PlanetDetailCard(spaceObject: spaceObjectsSorted[index])
                                .id(spaceObjectsSorted[index].name)
                        }
                    }
                }
                .onAppear {
                    let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                    proxy.scrollTo(lastSpaceObj.name)
                }
            }
            
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .frame(width: 50)
                
                OnboardingWidgetPbar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .onReceive(timer) { _ in
                        progressValue = user.first?.progress ?? 0
                    }
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .frame(width: 50)
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
