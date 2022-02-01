//
//  StarView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/31/22.
//

import SwiftUI

struct StarView: View {
    
    @State var shouldAnimate = false

    let index: Int
    let offset: CGSize
    let duration: Double
    let delay: Double
    var body: some View {
        Circle()
            .fill(Color.white)
            .frame(width: 2, height: 2)
            
            //.position(x: 250, y: 170)
        
            //.animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
            .offset(offset)
            .zIndex(-1)
            .opacity(shouldAnimate ? 0.1 : 0.8)

            .onAppear {
                withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true).delay(delay)) {
                    self.shouldAnimate.toggle()
                }

            }
       
    }
}

//struct StarView_Previews: PreviewProvider {
//    static var previews: some View {
//        StarView()
//    }
//}
