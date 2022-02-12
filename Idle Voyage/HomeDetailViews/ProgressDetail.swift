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
                .padding(.bottom, 20)
                .padding(.top, 20)


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
            .padding(.bottom, 10)
            Text("Progress to " + getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 2)
            let num = Double(user.first!.progress) * 100
            Text(String(num.rounded(toPlaces: 4)) + "%")
                .font(Font.subheadline.monospacedDigit())
                .fontWeight(.medium)
                .foregroundColor(Color.white)
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                    .frame(width: 25)
                MainProgressBar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 10)
                    .onReceive(timer) { _ in
                        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        let progress = 1 - (user.first!.distanceRemainInKm/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
                        progressValue = Float(progress)
                    }
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
                    .frame(width: 25)
            }
            .padding(.bottom, 8)
            Text("Progress from Earth")
                .font(.headline)
                .fontWeight(.bold)
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 12) {
                        ForEach(1...spaceObjectsSorted.count-1, id: \.self) { index in
                            ProgressBarDetail(spaceObject: spaceObjectsSorted[index])
                                .id(spaceObjectsSorted[index].name)
                        }
                    }
                }
                .onAppear {
                    let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                    proxy.scrollTo(nextSpaceObj.name)
                }
            }
            
            
            
        }
        .background(StarsView(starInt: 25))
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
