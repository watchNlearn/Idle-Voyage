//
//  ShootingStarsView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/31/22.
//

import SwiftUI

struct ShootingStarsView: View {
    
    @State var shouldAnimate = false
    let starInt: Int
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0...starInt, id: \.self) { index in
                ShootingStarView(offset: randomOffset(), yPosition: yPositionRandom(), duration: getRandomDur(), delay: getRandomDelay(), alien: getRandomBool())
                
            }
            
        }
    }
}
private func yPositionRandom() -> CGFloat {
    return CGFloat.random(in: 80...900)
}
private func randomOffset() -> CGFloat {
    return CGFloat.random(in: 700...1400)
}

private func getRandomDur() -> Double {
    return Double.random(in: 60...300)
}
private func getRandomDelay() -> Double {
    return Double.random(in: 0...35)
}
private func getRandomBool() -> Bool {
    let val = Int.random(in: 0...250)
    if val == 4 {
        return true
    }
    return false
}

//struct ShootingStarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShootingStarsView()
//    }
//}
