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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    
    @State var shipImage: String = getShipImageString(desc: "ufo")
    
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
                        Text(String(user.first!.distanceInKm.rounded(toPlaces: 1).formattedWithSeparator))
                            .font(.subheadline)
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
                        Text("km")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)
                        
                    }
                    .padding(.bottom, 5)
                    Text("Remaining")
                        .font(.headline)
                        .fontWeight(.thin)
                        .frame(alignment: .leading)
                        .padding(.trailing, 10)
                    HStack {
                        Text(String(user.first!.distanceRemainInKm.rounded(toPlaces: 1).formattedWithSeparator))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)
                            .padding(.trailing, 4)
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
                                    let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                                    let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
//                                    nextSpaceObj.distanceInKm - user.first!.distanceInKm
                                    print(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm)
                                    currentUser.distanceRemainInKm = nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm
                                }
                                try? moc.save()
                            }
                        Text("km")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)
                    }
                    .padding(.bottom, 40)
                    
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
                                    .font(.subheadline)
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
                                .background(Color.purple)
                                .frame(alignment: .center)
                                .cornerRadius(6)
                            Text(getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm).desc)
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.bottom, 40)
                                .padding(.trailing, 10)
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
                    }
                }
                // MARK: SHIP IMAGE
                VStack {
                    Image(uiImage: getShipImageString(desc: user.first!.shipPref!).image()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                        .onTapGesture {
//                            self.shipImage = getShipImageString(desc: "ufo")
//                            try? moc.save()
                        }
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            
            // MARK: PERCENT PROGRESS
            let num = Double(user.first!.progress) * 100
            Text(String(num.rounded(toPlaces: 3)) + "%")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
            //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            // Bottom planets + p bar
            
            
            // MARK: PROGRESS BAR
            HStack {
                Image(uiImage: "🌎".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                OnboardingWidgetPbar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 30)
                    .onReceive(timer) { _ in
                        let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                        
                        let progress = 1 - (currentUser.distanceRemainInKm/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
                        progressValue = Float(progress)
                        currentUser.progress = progressValue
                        try? moc.save()
                    }
                Image(uiImage: "🪐".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
            }
            
            
        }
        .foregroundColor(.white)
        .padding(10)
        .frame(maxWidth: 360)
        .frame(maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"), Color.init(hex: "000000"), Color.init(hex: "212354"), Color.init(hex: "3E66F9"), Color.init(hex: "3E54E8")]), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: UnitPoint(x: 0.1, y: 0.9)))
//        .background(getRandomGradient())
//        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(30)
        // Maybe we need to do
        // Used when app comes back into foreground from background (we need to update values, counters stop in background!)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    // your code
            print("Here appearing")
            let currentUser = user.first!
            
            // Get start date in seconds
            let startDate = currentUser.startDate
            // Calulate elapsed time of journey thus far in seconds
            let elapsedTime = Date().timeIntervalSince1970 - startDate // time since start time
            // Update elapsed time
            currentUser.elapsedTime = elapsedTime
            
            let elapsedTimeSinceSave = Date().timeIntervalSince1970 - currentUser.lastSaveDate // time since last save date

//            print(elapsedTime)
            // Update TOTAL DISTANCE TRAVELED
            let elapsedTotalDistance = elapsedTime * speedPerSecKm // Total distance traveled
//            print(elapsedTime)
            currentUser.distanceInKm += elapsedTotalDistance
            
            // Need to update this many KM on remaining
            let totalDistanceRemaining = currentUser.distanceRemainInKm
            let elapsedDistance = elapsedTimeSinceSave * speedPerSecKm
            var elapsedRemain = totalDistanceRemaining - elapsedDistance
            let nextSpaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
            let lastSpaceObj = getLastSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)

            // lets say elapsed remain is negative! User passed planet while app in background
            while (elapsedRemain < 0) {
                // Some sort of get next function
//                let spaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
                // get the next space obj - abs val of remain
                // repeat loop if neg
                elapsedRemain = (nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm) - abs(elapsedRemain)
            }
            print("Elapsed remain: \(elapsedRemain)")
            currentUser.distanceRemainInKm = elapsedRemain
//            let spaceObj = getNextSpaceObject(spaceObjects: spaceObjectsSorted, distance: user.first!.distanceInKm)
            let progress = 1 - (currentUser.distanceRemainInKm/(nextSpaceObj.distanceInKm - lastSpaceObj.distanceInKm))
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

private func getRandomGradient() -> LinearGradient {
    let gradients = [
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "013026"), Color.init(hex: "133769"), Color.init(hex: "210535"), Color.init(hex: "000000")]), startPoint: .bottomLeading, endPoint: .topTrailing),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "101b39"), Color.init(hex: "430d4b"), Color.init(hex: "333136"), Color.init(hex: "6f6d72"), Color.init(hex: "001736")]), startPoint: .topTrailing, endPoint: .leading),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "011307"), Color.init(hex: "001736"), Color.init(hex: "f8bc04")]), startPoint: .topLeading, endPoint: .bottom),
        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "000000"), Color.init(hex: "000000"), Color.init(hex: "212354"), Color.init(hex: "3E66F9"), Color.init(hex: "3E54E8")]), startPoint: UnitPoint(x: 0.5, y: 0.3), endPoint: UnitPoint(x: 0.1, y: 0.9))]
    return gradients.randomElement()!
}

//        // Options: rocket, satellite, ufo (default is rocket)
private func getShipImageString(desc: String) -> String {
    switch desc {
    case "rocket":
        return "🚀"
    case "satellite":
        return "🛰️"
    case "ufo":
        return "🛸"
    default:
        return "🚀"
    }
    //    let ships = ["🚀","🛰️","🛸"]
    //    return ships.randomElement() ?? "🚀"
}

private func getCurrentDateFormat(atTime: Date) -> String {
    let date = atTime
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yy HH:mm:ss"
    let time = dateFormatter.string(from: date)
    return time
}

func getNextSpaceObject(spaceObjects: [SpaceObject], distance: Double) -> SpaceObject {
    let totalDistance = distance
    var nextSpaceObj = SpaceObject(name: "Error", distanceInKm: 0, image: Image(""), desc: "Error", description: "Error", type: .other)
    for i in spaceObjects {
        if (i.distanceInKm > totalDistance) {
            nextSpaceObj = i
            break
        }
    }
//    SpaceObject(name: "Moon", distanceInKm: 384400, image: Image(uiImage: "🌑".image()!), desc: "i smell cheese", description: "This is the Moon", type: .moon)\
//    print("RETURNING NEXT: \(nextSpaceObj.name)")
//    print("-------------")
//    print("RETURNING DISTANCE: \(totalDistance)")
//    print("-------------")

    

    return nextSpaceObj
}
func getLastSpaceObject(spaceObjects: [SpaceObject], distance: Double) -> SpaceObject {
    let totalDistance = distance
    var lastSpaceObj = SpaceObject(name: "Error", distanceInKm: 0, image: Image(""), desc: "Error", description: "Error", type: .other)
    for i in spaceObjects {
        if (i.distanceInKm < totalDistance) {
            lastSpaceObj = i
        }
    }
//    SpaceObject(name: "Moon", distanceInKm: 384400, image: Image(uiImage: "🌑".image()!), desc: "i smell cheese", description: "This is the Moon", type: .moon)
//    print("RETURNING Last: \(lastSpaceObj.name)")

    return lastSpaceObj
}
