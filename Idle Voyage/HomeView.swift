//
//  HomeView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/6/22.
//

import SwiftUI

struct HomeView: View {
    
//    if user.isEmpty {
//        let newUser = User(context: moc)
//        newUser.uid = UUID()
//        newUser.voyageStartDate = Date()
//        // Options: rocket, satellite, ufo (default is rocket)
//        newUser.shipPref = "rocket"
//        newUser.unitPref = "km"
//    newUser.leaving = "Earth"
//    newUser.approaching = "Saturn"
//       newUser.progress = 0.0
//        newUser.distanceInKm = 0
//        newUser.elapsedTime = 0
//        newUser.speedInKm = 700000
//        newUser.startDate = Date().timeIntervalSince1970
//        try? moc.save()
//    } else {
//        print("This shouldnt be happening! User should be saved already")
//        //print(user.first?.startDate)
//    }
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    // Tolerance 0.1 to give some wiggle room
    let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()

    @State var showDistanceDetail = false
    @State var showTimeDetail = false
    @State var showLeavingDetail = false
    @State var showApproachingDetail = false
    @State var showProgressDetail = false
//    @State var shipImage: String = getShipImageString(desc: "ufo")
    
    @State var progressValue: Float = 0.0
        
//    let saturnDistanceInKm: Double = 1433600000 // this is saturns from the sun!
//    let speedPerSecKm = 11666.6666667 Type '()' cannot conform to 'View'
    // WRONG SPEED TESTING SPEED
//    let speedPerSecKm = 2675000.6564657
//    let speedPerSecKm = 194.444444444
        //PROD: USE THIS SPEED FOR SECONDS
      let speedPerSecKm = 194.444444443

    
//    @State var distanceTravelled: Double = 1433600000
    
    var body: some View {
        let currentUser = user.first!
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading){
                    Group {
                        // MARK: DISTANCE
                        Text("Distance")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                            .padding(.trailing, 5)
                            .foregroundColor(.white)
                        Text("Travelled")
                            .font(.headline)
                            .fontWeight(.thin)
                            .frame(alignment: .leading)
                            .padding(.trailing, 10)
                        HStack {
                            Text(String(user.first!.distanceInKm.rounded(toPlaces: 0).formattedWithSeparator) + "  km")
                                .font(Font.subheadline.monospacedDigit())
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.leading, 8)
                                .padding(.trailing, 8)
                                .background(Color.orange)
                                .cornerRadius(6)
                                .onReceive(timer) { _ in
                                    //                                self.distanceTravelled += speedPerSecKm
                                    currentUser.distanceInKm += speedPerSecKm
                                    try? moc.save()
                                }
//                            Text("km")
//                                .font(.subheadline)
//                                .fontWeight(.semibold)
//                                .frame(alignment: .leading)
//                                .padding(.leading, 4)
//                                .background(Color.orange)
//                                .cornerRadius(6)


                            
                        }
                        .padding(.bottom, 5)
                        Text("Remaining")
                            .font(.headline)
                            .fontWeight(.thin)
                            .frame(alignment: .leading)
                            .padding(.trailing, 10)
                        HStack {
                            Text(String(user.first!.distanceRemainInKm.rounded(toPlaces: 0).formattedWithSeparator) + "  km")
                                .font(Font.subheadline.monospacedDigit())
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.leading, 8)
                                .padding(.trailing, 8)
                                .background(Color.orange)
                                .cornerRadius(6)
                                .onReceive(timer) { _ in
                                    let distanceRemaining = user.first!.distanceRemainInKm
                                    if distanceRemaining > speedPerSecKm {
                                        currentUser.distanceRemainInKm -= speedPerSecKm
                                    }
                                    else {
                                        // the next distance until
                                        currentUser.distanceRemainInKm = 0
                                    }
                                    if distanceRemaining == 0 {
                                        // the next distance until//
                                        //let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                                        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                                        //                                    nextSpaceObj.distanceInKm - user.first!.distanceInKm
                                        //print(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm)
                                        currentUser.distanceRemainInKm = nextSpaceObj.distanceInKm - currentUser.distanceInKm
                                    }
                                    try? moc.save()
                                }
//                            Text("km")
//                                .font(.subheadline)
//                                .fontWeight(.semibold)
//                                .frame(alignment: .leading)
//                                .padding(.leading, 4)
//
                            
                        }
                        .padding(.bottom, 40)
                    }
                    .fullScreenCover(isPresented: $showDistanceDetail, content: {
                        DistanceDetail()
                            .clearModalBackground().onTapGesture {
                                showDistanceDetail.toggle()
                            }
                        // added to background in distance detail
//                            .overlay(
//                                StarsView(starInt: 17)
//                            )
                    })
                    .onTapGesture {
                        showDistanceDetail.toggle()
                    }
                    // MARK: TIME
                    Group {
                        VStack(alignment: .leading) {
                            Text("Time")
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("Duration")
                                    .font(.headline)
                                    .fontWeight(.thin)
                                    .frame(alignment: .leading)
                                    .padding(.trailing, 10)
                                Text(getTimeStringSec(interval: Int(user.first!.elapsedTime)))
                                    .font(Font.subheadline.monospacedDigit())
                                    .fontWeight(.semibold)
                                    .frame(alignment: .leading)
                                    .padding(.leading, 4)
                                    .padding(.trailing, 4)
                                    .background(Color.blue)
                                    .cornerRadius(6)
                                    .onReceive(timer) { _ in
                                        currentUser.elapsedTime += 1
                                        currentUser.lastSaveDate = Date().timeIntervalSince1970
                                        try? moc.save()
                                    }
                            }
                            .padding(.bottom, 5)
                            Text("Launch Date")
                                .font(.headline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            Text(getCurrentDateFormat(atTime: user.first!.voyageStartDate!))
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                                .frame(alignment: .leading)
                                .background(Color.blue)
                                .cornerRadius(6)
                        }
                        .padding(.bottom, 40)
                    }
                    .fullScreenCover(isPresented: $showTimeDetail, content: {
                        TimeDetail()
                            .clearModalBackground().onTapGesture {
                                showTimeDetail.toggle()
                            }
                    })
                    .onTapGesture {
                        showTimeDetail.toggle()
                    }
                    Group {
                        // MARK: LEAVING
                        VStack(alignment: .leading) {
                            Text("Leaving")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            Text(getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                                .background(Color.red)
                                .frame(alignment: .center)
                                .cornerRadius(6)
                            Text(getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).desc)
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.bottom, 40)
                                .padding(.trailing, 10)
                        }
                        .fullScreenCover(isPresented: $showLeavingDetail, content: {
                            LeavingDetail()
                                .clearModalBackground().onTapGesture {
                                    showLeavingDetail.toggle()
                                }
                        })
                        .onTapGesture {
                            showLeavingDetail.toggle()
                        }
                        // MARK: LEAVING
                        VStack(alignment: .leading) {
                            Text("Approaching")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            //            let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
//                            Text(user.first!.approaching!) <- was originally not sure if i need this anymore

                            Text(getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).name)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                                .background(Color.green)
                                .cornerRadius(6)
                            Text(getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).desc)
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.bottom, 20)
                                .padding(.trailing, 10)
                        }
                        .fullScreenCover(isPresented: $showApproachingDetail, content: {
                            ApproachingDetail()
                                .clearModalBackground().onTapGesture {
                                    showApproachingDetail.toggle()
                                }
                        })
                        .onTapGesture {
                            showApproachingDetail.toggle()
                        }
                    }
                   
                }
                // MARK: SHIP IMAGE
                VStack {
                    Image(uiImage: user.first!.shipPref!.image()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                        .onTapGesture {
                            let currentUser = user.first!
                            currentUser.shipPref = getNextShip(current: user.first!.shipPref!)
                            try? moc.save()
                        }
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            
            // MARK: PERCENT PROGRESS
            let num = Double(user.first!.progress) * 100
            if num.rounded(toPlaces: 2) == 200 {
                Text("0.0%")
                    .font(Font.headline.monospacedDigit())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            } else {
                Text(String(num.rounded(toPlaces: 2)) + "%")
                    .font(Font.headline.monospacedDigit())
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            
            //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            // Bottom planets + p bar
            
            
            // MARK: PROGRESS BAR
            HStack {
                Image(uiImage: getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .frame(width: 50)
                OnboardingWidgetPbar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 20)
                    .onAppear {
                        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        
                        let progress = 1 - (currentUser.distanceRemainInKm/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
                        progressValue = Float(progress)
                    }
                    .onReceive(timer) { _ in
                        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        
                        let progress = 1 - (currentUser.distanceRemainInKm/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
                        progressValue = Float(progress)
                        currentUser.progress = progressValue
                        try? moc.save()
                    }
                Image(uiImage: getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                    .frame(width: 50)
            }
            
            
        }
        .foregroundColor(.white)
        .padding(10)
        .frame(maxWidth: 360)
        .frame(maxHeight: .infinity)
        .background(Color.clear)
        .fullScreenCover(isPresented: $showProgressDetail, content: {
            ProgressDetail()
                .clearModalBackground().onTapGesture {
                    showProgressDetail.toggle()
                }
        })
        .onTapGesture {
            showProgressDetail.toggle()
        }
//        .background(LinearGradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")], startPoint: .topLeading, endPoint: .bottomTrailing)
//                        .hueRotation(.degrees(animateGradient ? 120 : 0))
//                        .ignoresSafeArea()
//                        .onAppear {
//            withAnimation(.easeInOut(duration: 10.0).repeatForever(autoreverses: true)) {
//                                animateGradient.toggle()
//                            }
//                    })
        //.background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"), Color.init(hex: "000000"), Color.init(hex: "212354"), Color.init(hex: "3E66F9"), Color.init(hex: "3E54E8")]), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: UnitPoint(x: 0.1, y: 0.9)))
//        .background(getRandomGradient())
//        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(30)
        // Maybe we need to do
        // Used when app comes back into foreground from background (we need to update values, counters stop in background!)
        // May not even have to do this because the last save date doesnt even matter we can just always calculate total elapsed time by
        // getting current time - start date
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification)) { _ in
                    // your code
            print("Entering background save time")
            let currentUser = user.first!
            currentUser.lastSaveDate = Date().timeIntervalSince1970
            try? moc.save()
            }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    // your code
            print("Entering foreground update")
            let currentUser = user.first!
            
            let startDate = currentUser.startDate
            //let lastSaveDate = currentUser.lastSaveDate
            
            //let elapsedTimeSinceSave = Date().timeIntervalSince1970 - lastSaveDate
            let totalElapsedTime = Date().timeIntervalSince1970 - startDate
            
            let elapsedDistance = speedPerSecKm * totalElapsedTime
            
            currentUser.elapsedTime = totalElapsedTime // Update our entire elapsed time 35 1
            
            currentUser.distanceInKm = elapsedDistance
            
            let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)

            currentUser.distanceRemainInKm = nextSpaceObj.distanceInKm - currentUser.distanceInKm
            
            let progress = 1 - (currentUser.distanceRemainInKm/(currentUser.distanceInKm - nextSpaceObj.distanceInKm))
            currentUser.progress = Float(progress)
            progressValue = Float(progress)
            try? moc.save()
        
            }
        
    }
        
        
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
//  Radial doesn't work because it isn't a LinearGradient how to return type Linear or Radial?
//RadialGradient(colors: [ Color.init(hex: "3E54E8"),Color.init(hex: "3E66F9"),Color.init(hex: "212354"), Color.init(hex: "000000"), Color.init(hex: "000000")], center: .bottomLeading, startRadius: 0, endRadius: 400),
//  Kinda made it a linear gradient below?
//LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"), Color.init(hex: "000000"), Color.init(hex: "212354"), Color.init(hex: "3E66F9"), Color.init(hex: "3E54E8")]), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: UnitPoint(x: 0.1, y: 0.9))

private func getNextShip(current: String) -> String {
    if current == "🚀" {
        return "🛰️"
    }
    else if current == "🛰️" {
        return "🛸"
    }
    return "🚀"
}



private func getRandomGradient() -> LinearGradient {
    let gradients = [
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "013026"), Color.init(hex: "133769"), Color.init(hex: "210535"), Color.init(hex: "000000")]), startPoint: .bottomLeading, endPoint: .topTrailing),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")]), startPoint: .topTrailing, endPoint: .leading),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"), Color.init(hex: "000000"), Color.init(hex: "212354"), Color.init(hex: "3E66F9"), Color.init(hex: "3E54E8")]), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: UnitPoint(x: 0.1, y: 0.9))]
    return gradients.randomElement()!
}

private func getCurrentDateFormat(atTime: Date) -> String {
    let date = atTime
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yy HH:mm:ss"
    let time = dateFormatter.string(from: date)
    return time
}


