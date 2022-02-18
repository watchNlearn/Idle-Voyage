//
//  ShootingStarView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/1/22.
//

import SwiftUI

struct ShootingStarView: View {
    
    @State var shouldAnimate = false
    let offset: CGFloat
    let yPosition: CGFloat
    let duration: Double
    let delay: Double
    let alien: Bool
    let size: Double

    
    var body: some View {
        if alien {
            Image(uiImage: "🛸".image()!)
                .resizable()
                .scaledToFit()
                .frame(width: 18, height: 18)
//                .opacity(0.7)
                .position(x: 0, y: yPosition)
                .offset(x: shouldAnimate ? offset+500 : -offset-500)
                .offset(y: shouldAnimate ? -offset-500 : offset+500)
            
                .animation(Animation.easeInOut(duration: duration).repeatCount(2).delay(Double.random(in: 30...120)),value: shouldAnimate ? offset+500 : -offset-500)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            
        } else {
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
//                .opacity(shouldAnimate ? 0.1 : 0.8)
                .opacity(0.7)
                .position(x: 0, y: yPosition)
                .offset(x: shouldAnimate ? -offset : offset)
                .offset(y: shouldAnimate ? offset : -offset)
            
                .animation(Animation.easeInOut(duration: duration).repeatForever(autoreverses: false).delay(delay),value: shouldAnimate ? -offset : offset)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            
        }
    }
}

//struct ShootingStarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShootingStarView()
//    }
//}
