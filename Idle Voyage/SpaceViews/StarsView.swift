//
//  StarsView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/31/22.
//

import SwiftUI

struct StarsView: View {
    
    @State var shouldAnimate = false
    
    let starInt: Int
    
    var body: some View {
        GeometryReader { proxy in
            ForEach(0...starInt, id: \.self) { index in
                
                let rand = Int.random(in: 1...38)
                if rand == 1 && starInt >= 70 {
                    PlanetView(index: index, offset: getRandXY(size: proxy.size))

                }
                else {
                    StarView(index: index, offset: getRandXY(size: proxy.size), duration: getRandomDur(), delay: getRandomDelay())
                }
                
                
            }
            
        }.ignoresSafeArea()
        
    }
}

private func getRandXY(size: CGSize) -> CGSize {
//    print(size.width)
//    print(size.height)
    let width: CGFloat = CGFloat.random(in: 0.0...size.width)
    let height: CGFloat = CGFloat.random(in: 0.0...size.height)
    return CGSize(width: width, height: height)
}

private func getRandomDur() -> Double {
    return Double.random(in: 3...10)
}
private func getRandomDelay() -> Double {
    return Double.random(in: 0...5)
}

//struct StarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarsView()
//    }
//}
