//
//  OnboardingWidgetView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//


import SwiftUI

struct OnboardingWidgetView: View {
    // My dummy progress bar value
    @State var progressValue: Float = 0.67
    let distanceInKm = 1433600000 // this is saturns from the sun!
    var body: some View {
        VStack {
            // stats + emoji
            HStack(alignment: .center) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                            .padding(.trailing, 5)
                        Text(distanceInKm.abbreviateNumber() + " km")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.bottom, 5)
                            .padding(.trailing, 5)
                        Text("Time")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                            .padding(.trailing, 5)
                        Text(getTimeString(interval: 4424283))
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.bottom, 5)
                            .padding(.trailing, 5)
                        Text("Approach")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                            .padding(.trailing, 5)
                        Text("Saturn")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.bottom, 5)
                            .padding(.trailing, 5)
                    }
                    VStack(alignment: .trailing) {
                        Image(uiImage: "🚀".image()!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .frame(width: 50)
//                            .frame(maxWidth: .infinity)
                      
                       
                    }
                }
                
                   
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            // Bottom planets + p bar
            HStack {
                Image(uiImage: "🌎".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
//                    .frame(maxWidth: .infinity)
                OnboardingWidgetPbar(value: $progressValue).frame(maxWidth: .infinity)
                Image(uiImage: "🪐".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
//                    .frame(maxWidth: .infinity)
            }
            
            
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 200, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "081448"), Color.init(hex: "001736"), Color.init(hex: "011307")]), startPoint: .bottomTrailing, endPoint: .topLeading))
        .cornerRadius(40)
       
        
        
    }
}

struct OnboardingWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingWidgetView()
    }
}
func getTimeString(interval: Int) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.day, .hour, .minute]
    formatter.unitsStyle = .abbreviated

    let formattedString = formatter.string(from: TimeInterval(interval))!
    return formattedString
}

