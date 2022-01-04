//
//  LoadingView.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/3/22.
//

import SwiftUI

struct LoadingView: View {
    @State private var shouldAnimate = false
    @State var leftOffset: CGFloat = -100
    @State var rightOffset: CGFloat = 100
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, world!")
                .fontWeight(.bold)
                .padding()
            
            RoundedRectangle (cornerRadius: 10)
                .fill(Color.init(hex: "1a2c80"))
                .frame(width: 80, height: 20)
                .offset(x: shouldAnimate ? rightOffset : leftOffset)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true),value: shouldAnimate ? rightOffset : leftOffset)
                .onAppear {
                    self.shouldAnimate = true
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
