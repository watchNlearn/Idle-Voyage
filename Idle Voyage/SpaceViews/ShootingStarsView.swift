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
                ShootingStarView(offset: randomOffset(), yPosition: yPositionRandom(), duration: getRandomDur(), delay: getRandomDelay(), alien: getRandomBool(), size: getRandomSize())
                
            }
            
        }
    }
}
private func yPositionRandom() -> CGFloat {
    return CGFloat.random(in: 40...900)
}
private func randomOffset() -> CGFloat {
    return CGFloat.random(in: 100...800)
}

private func getRandomDur() -> Double {
    return Double.random(in: 100...400)
}
private func getRandomDelay() -> Double {
    return Double.random(in: 0...38)
}
private func getRandomBool() -> Bool {
    let val = Int.random(in: 0...325)
    if val == 4 {
        return true
    }
    return false
}
private func getRandomSize() -> Double {
    return Double.random(in: 1...2.8)
}

//struct ShootingStarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShootingStarsView()
//    }
//}
