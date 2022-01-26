//
//  VoyageCardView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct VoyageCardView: View {
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    @State var shouldAnimate = false
    @State var shipImage: String = getShipImageString()
    @State var leftOffset: CGFloat = -200
    @State var rightOffset: CGFloat = 200
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(uiImage: shipImage.image()!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .offset(x: shouldAnimate ? rightOffset : leftOffset)
                .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: false),value: shouldAnimate ? rightOffset : leftOffset) 
                .onAppear {
                    self.shouldAnimate = true
                }
                .onReceive(timer) {_ in
                    self.shipImage = getShipImageString()
                }
                .onTapGesture {
                    self.shipImage = getShipImageString()
                }
                
                

            Text("Welcome to Idle Voyage")
                .font(.title)
                .fontWeight(.bold)
            Text("Get ready to embark on your never ending journey through the Universe!")
                .lineLimit(4)
                .opacity(0.7)
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "013026"), Color.init(hex: "133769"), Color.init(hex: "210535"), Color.init(hex: "000000")]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(30)
        
    }
}

private func getShipImageString() -> String {
    let ships = ["🚀","🛸","🛰️"]
    return ships.randomElement() ?? "🚀"
}

//struct VoyageCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        VoyageCardView()
//    }
//}

