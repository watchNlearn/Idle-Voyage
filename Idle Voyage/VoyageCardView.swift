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
    @State var shouldSwitchShip = false
    @State var shipImage: String = getShipImage()
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
                    self.shipImage = getShipImage()
                }
                .onTapGesture {
                    self.shipImage = getShipImage()
                }
                
                

            Text("Welcome to Idle Voyage!")
                .font(.title)
                .fontWeight(.bold)
            Text("Get ready to embark on your never ending journey through the stars...")
                .lineLimit(4)
                .opacity(0.7)
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F9ED32"), Color.init(hex: "EE2A7B"), Color.init(hex: "002AFF")]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(30)
        
    }
}

func getShipImage() -> String {
    let ships = ["🚀","🛸","🛰️"]
    return ships.randomElement()!
}

struct VoyageCardView_Previews: PreviewProvider {
    static var previews: some View {
        VoyageCardView()
    }
}

extension String
{
    func image(fontSize:CGFloat = 40, bgColor:UIColor = UIColor.clear, imageSize:CGSize? = nil) -> UIImage?
    {
        let font = UIFont.systemFont(ofSize: fontSize)
        let attributes = [NSAttributedString.Key.font: font]
        let imageSize = imageSize ?? self.size(withAttributes: attributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        bgColor.set()
        let rect = CGRect(origin: .zero, size: imageSize)
        UIRectFill(rect)
        self.draw(in: rect, withAttributes: [.font: font])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
