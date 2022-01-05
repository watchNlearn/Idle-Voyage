//
//  OnboardingWidgetPbar.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 1/4/22.
//

import SwiftUI

struct OnboardingWidgetPbar: View {
    @Binding var value: Float
        
        var body: some View {
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


