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
    
    var body: some View {
        Group {
            Circle()
                .fill(Color.white)
                .frame(width: 3, height: 3)
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
