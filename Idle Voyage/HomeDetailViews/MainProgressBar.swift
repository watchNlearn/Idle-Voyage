//
//  MainProgressBar.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 2/8/22.
//

import SwiftUI

struct MainProgressBar: View {
    @Binding var value: Float
    @FetchRequest(sortDescriptors: []) var user: FetchedResults<User>

    @State var shouldAnimate = false
    @State var leftOffset: CGFloat = -50
    @State var rightOffset: CGFloat = 50
    
        var body: some View {
            if value == 0.0 {
                
                Image(uiImage: user.first!.shipPref!.image()!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 20)
                    .frame(maxWidth: .infinity)
                    .offset(x: shouldAnimate ? rightOffset : leftOffset)
                    .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true),value: shouldAnimate ? rightOffset : leftOffset)
                    .onAppear {
                        self.shouldAnimate = true
                    }
            } else {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                            .opacity(0.3)
                            .foregroundColor(Color(UIColor.orange))
                        
                        Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(Color(UIColor.green))
                            .animation(.linear)
                    }.cornerRadius(45.0)
                }
            }
           
        }
}



//struct MainProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainProgressBar()
//    }
//}
