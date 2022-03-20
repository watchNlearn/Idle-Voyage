//
//  TimeDetail.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/25/22.
//

import SwiftUI

struct TimeDetail: View {
    // Get out environment and users
    @Environment(\.managedObjectContext) var moc
    // We may not even have to create a fetch request
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>
    
    let background = getRandomGradient()
    
    @State private var animateGradient = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Group {
                Text("Voyage Time  " + user.first!.shipPref!)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .padding(.top, 20)
                VStack (alignment: .leading) {
                    Text("Since Launch ⏱️")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .padding(.trailing, 10)
                    HStack {
                        Text(getTimeStringNanoSec(interval: Int(user.first!.elapsedTime)))
                            .frame(alignment: .leading)
                            .padding(.trailing, 8)
                            .cornerRadius(6)
                            .opacity(0.8)
                    }
                    .padding(.bottom, 5)
                }
                VStack(alignment: .leading) {
                    Text("Launch Date 📅")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(alignment: .leading)
                        .padding(.trailing, 10)
                    HStack {
                        Text(getCurrentDateFormat(atTime: user.first!.voyageStartDate!))
//                            .font(.subheadline)
//                            .fontWeight(.thin)
                            .frame(alignment: .leading)
                            .padding(.trailing, 4)
                            .cornerRadius(6)
                            .opacity(0.8)
                        
                    }
                    
                    .padding(.bottom, 20)
                    
                }
                
            }
        }
//        .background(
//            StarsView(starInt: 34)
//        )
        .frame(maxWidth: .infinity)
        .foregroundColor(.white)
        .padding()
        .background(Color.init(hex: "100b1f"))
        .cornerRadius(30)
        
    }
}

//struct TimeDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeDetail()
//    }
//}
private func getCurrentDateFormat(atTime: Date) -> String {
    let date = atTime
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMMM d, yyyy HH:mm:ss a"
    let time = dateFormatter.string(from: date)
    return time
}
private func getTimeStringNanoSec(interval: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute, .second]
    formatter.unitsStyle = .full

    let formattedString = formatter.string(from: TimeInterval(interval))!
    return formattedString
}
