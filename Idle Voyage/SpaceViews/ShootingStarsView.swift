//
//  ShootingStarsView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/31/22.
//

import SwiftUI

struct ShootingStarsView: View {
    
    @State var shouldAnimate = false

    
    var body: some View {
        Group {
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)
                
                .position(x: 0, y: 80)
                .offset(x: shouldAnimate ? -1900 : 1900)
                .offset(y: shouldAnimate ? 1900 : -1900)
            
                .animation(Animation.easeInOut(duration: 10.87).repeatForever(autoreverses: false).delay(19.64),value: shouldAnimate ? -1900 : 1900)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)
                
                .position(x: 0, y: 200)
                .offset(x: shouldAnimate ? -1000 : 1000)
                .offset(y: shouldAnimate ? 1000 : -1000)
            
                .animation(Animation.easeInOut(duration: 3.26).repeatForever(autoreverses: false).delay(7.64),value: shouldAnimate ? -1000 : 1000)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)
                .position(x: 0, y: 400)
                .offset(x: shouldAnimate ? -880 : 880)
                .offset(y: shouldAnimate ? 880 : -880)
            
                .animation(Animation.easeInOut(duration: 2.93).repeatForever(autoreverses: false).delay(4.72),value: shouldAnimate ? -880 : 880)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)

                .position(x: 0, y: 528)
                .offset(x: shouldAnimate ? -1800 : 1800)
                .offset(y: shouldAnimate ? 1800 : -1800)

                .animation(Animation.easeInOut(duration: 7.87).repeatForever(autoreverses: false).delay(4.1),value: shouldAnimate ? -1800 : 1800)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)

                .position(x: 0, y: 670)
                .offset(x: shouldAnimate ? -1200 : 1200)
                .offset(y: shouldAnimate ? 1200 : -1200)

                .animation(Animation.easeInOut(duration: 4.7).repeatForever(autoreverses: false).delay(2.28),value: shouldAnimate ? -1200 : 1200)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
            
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)

                .position(x: 0, y: 933)
                .offset(x: shouldAnimate ? -1200 : 1200)
                .offset(y: shouldAnimate ? 1200 : -1200)

                .animation(Animation.easeInOut(duration: 5.73).repeatForever(autoreverses: false).delay(11),value: shouldAnimate ? -1200 : 1200)
                .onAppear {
                    self.shouldAnimate = true
                }
                .zIndex(1)
        }
        
    }
}

//struct ShootingStarsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShootingStarsView()
//    }
//}
