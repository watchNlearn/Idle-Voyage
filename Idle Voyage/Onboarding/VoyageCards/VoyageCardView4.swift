//
//  VoyageCardView4.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct VoyageCardView4: View {
    // Binding from prev view
    @Binding var valueFromOnboardingView : Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var currentTime = getCurrentDateFormat()
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("Here we go...")
                .font(.title)
                .fontWeight(.bold)
            HStack(alignment: .center, spacing: 8) {
                Button(action: {
                    //  TODO: save to UserDefaults
                    // Button press update value
                    withAnimation {
                        valueFromOnboardingView = false
                    }
                }) {
                    HStack{
                        Text(currentTime)
                            .font(.headline)
                            .padding(.horizontal)
                            .onReceive(timer) { _ in
                                currentTime = getCurrentDateFormat()
                            }
                            .frame(maxWidth: .infinity)
                        Image(uiImage: "🚀".image()!)
                    }
                    .padding()
                }
                .foregroundColor(Color.white)
                .background(Color.green)
                .cornerRadius(10)
            }
            Text("Fasten your seatbelts! Tap the green button to start your voyage.")
                .opacity(0.7)
                

            
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(RadialGradient(colors: [ Color.init(hex: "3E54E8"),Color.init(hex: "3E66F9"),Color.init(hex: "212354"), Color.init(hex: "000000"), Color.init(hex: "000000")], center: .bottomLeading, startRadius: 0, endRadius: 400))
        
        .cornerRadius(30)
    }
}

private func getCurrentDateFormat() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yy hh:mm:ss"
    let time = dateFormatter.string(from: date)
    return "Launch Time: " + time
}



//struct VoyageCardView4_Previews: PreviewProvider {
//    static var previews: some View {
//        VoyageCardView4()
//    }
//}
