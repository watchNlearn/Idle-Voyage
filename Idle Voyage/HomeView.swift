//
//  HomeView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/6/22.
//

import SwiftUI

struct HomeView: View {
    // My dummy progress bar value
    @State var shipImage: String = getShipImageString()

    @State var progressValue: Float = 0.68
    let distanceInKm = 1433600000 // this is saturns from the sun!
    var body: some View {
        VStack {
            // stats + emoji
            HStack(alignment: .center) {
                VStack(alignment: .leading){
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
                        Text("5894824797")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)
                            .padding(.trailing, 4)
                            .background(Color.orange)
                            .cornerRadius(6)
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
                        Text("482391")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)
                            .padding(.trailing, 4)
                            .background(Color.orange)
                            .cornerRadius(6)
                        Text("km")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(alignment: .leading)
                            .padding(.leading, 4)

                    }
                    .padding(.bottom, 40)
                    
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
                                Text(getTimeStringSec(interval: 4424283))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .frame(alignment: .leading)
                                    .padding(.leading, 4)
                                    .padding(.trailing, 4)
                                    .background(Color.blue)
                                    .cornerRadius(6)
                            }
                            .padding(.bottom, 5)

                            
                            Text("Launch Date")
                                .font(.headline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            Text(" 02/14/22 12:45:01 ")
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
                        VStack(alignment: .leading) {
                            Text("Leaving")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            Text("Earth")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                                .background(Color.purple)
                                .frame(alignment: .center)
                                .cornerRadius(6)
                            
                            //                                Image(uiImage: "🌎".image()!)
                            //                                    .resizable()
                            //                                    .aspectRatio(contentMode: .fit)
                            //                                    .frame(height: 25)
                            //                                    .frame(width: 25)
                            Text("You may know this place...")
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.bottom, 40)
                                .padding(.trailing, 10)
                        }
                        VStack(alignment: .leading) {
                            Text("Approaching")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(alignment: .leading)
                                .padding(.trailing, 10)
                            
                            
                            Text("Saturn")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .frame(alignment: .leading)
                                .padding(.leading, 4)
                                .padding(.trailing, 4)
                                .background(Color.green)
                                .cornerRadius(6)


                            //                                Image(uiImage: "🪐".image()!)
                            //                                    .resizable()
                            //                                    .aspectRatio(contentMode: .fit)
                            //                                    .frame(height: 25)
                            //                                    .frame(width: 25)
                            
                            Text("Rings... Lots of them")
                                .font(.subheadline)
                                .fontWeight(.thin)
                                .frame(alignment: .leading)
                                .padding(.bottom, 20)
                                .padding(.trailing, 10)
                        }
                        
                    }
                    
                    
                    
                }
                VStack {
                    Image(uiImage: shipImage.image()!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                        .frame(width: 100)
                        .onTapGesture {
                            self.shipImage = getShipImageString()
                        }
                }
                
               
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            Text("68%")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.yellow)
                //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            // Bottom planets + p bar
            HStack {
                Image(uiImage: "🌎".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                //                    .frame(maxWidth: .infinity)
                OnboardingWidgetPbar(value: $progressValue).frame(maxWidth: .infinity)
                    .frame(height: 30)
                Image(uiImage: "🪐".image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50)
                //                    .frame(maxWidth: .infinity)
            }
            
            
        }
        .foregroundColor(.white)
        .padding(10)
        .frame(maxWidth: 360)
        .frame(maxHeight: .infinity)
        
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "013026"), Color.init(hex: "133769"), Color.init(hex: "210535"), Color.init(hex: "000000")]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(30)
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private func getShipImageString() -> String {
    let ships = ["🚀","🛸","🛰️"]
    return ships.randomElement() ?? "🚀"
}
