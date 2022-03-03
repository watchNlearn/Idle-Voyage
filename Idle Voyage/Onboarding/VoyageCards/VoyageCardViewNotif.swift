//
//  VoyageCardViewNotif.swift
//  Idle Voyage
//
//  Created by Caleb Lee on 3/2/22.
//

import SwiftUI
import UserNotifications

struct VoyageCardViewNotif: View {
    @State private var shouldAnimate = false
    @State private var allowNotif = false
    let timer = Timer.publish(every: 4, tolerance: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack(alignment: .center, spacing: 8) {
                VStack {
                    HStack {
                        Image(uiImage: "🪐".image()!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .frame(width: 20)
                            .padding(.leading, 2)
                            .padding(.bottom, 20)
                        VStack {
                            HStack {
                                Text("Idle Voyage")
                                    .opacity(0.7)
                                    .frame(height: 6)
                                    .padding(.trailing, 38)
                                Text(" now")
                                    .opacity(0.7)
                                    .frame(height: 6)
                                    .padding(.trailing, 2)
                            }
                            .padding(.bottom, 4)
                            
                            Text("About to pass Mars!")
                                .opacity(0.7)
                                .frame(height: 10)
                                .frame(maxWidth: .infinity)
                                .padding(.leading, 2)
                                .padding(.trailing, 20)
                        }
                        .padding(.bottom, 20)
                     

                    }
                    .padding(.top, 20)
                    
                    

                    
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .opacity(0.85)
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(14)
                .rotationEffect(.degrees(shouldAnimate ? 2:-2), anchor: .center)
                .animation(Animation.interpolatingSpring(stiffness: 200, damping: 4, initialVelocity: 10).repeatCount(1, autoreverses: false))
                .onAppear {
                        self.shouldAnimate.toggle()
                }
                .onReceive(timer) { _ in
                    self.shouldAnimate.toggle()
                }
                    
                    
            }.padding()
            
           
            Text("Get Notified")
                .font(.title)
                .fontWeight(.bold)
            Text("We get it you're busy! Allow app notifications to stay up to date on major milestones!")
                .opacity(0.7)
            Toggle(isOn: $allowNotif) {
                Text("Allow Notifications")
            }
            // THIS IS BUGGY IF USER DOESN'T ACCPET
            // MUST DELETE APP TO REALLOW
            // WORKS FINE IF USER ACCEPTS FIRST TIME SO NO PROBLEM I THINK.... fix later TODO
            // LOWKEY working as intended cus can't ask user multiple times i think
            .onChange(of: allowNotif) { _ in
                let center = UNUserNotificationCenter.current()
                if allowNotif {
                    center.requestAuthorization(options: [.alert, .badge, .sound]) {
                        success, error in
                        if success {
                            print("Success")
                            center.getNotificationSettings { settings in
                                if settings.authorizationStatus == .authorized {
                                    allowNotif = true
                                } else {
                                    allowNotif = false
                                }
                                
                            }
                            
                        } else if let error = error {
                            print(error.localizedDescription)
                        } else {
                            print("fail")
                            center.getNotificationSettings { settings in
                                if settings.authorizationStatus == .authorized {
                                    allowNotif = true
                                } else {
                                    allowNotif = false
                                }
                                
                            }
                        }
                        
                    }
                }
               
                
                
            }
            .padding()
            
                
        }
        .background(
            StarsView(starInt: 20)
        )
        .foregroundColor(.white)
        .padding()
        .frame(width: 300, height: 400)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(hex: "1b1145"),Color.init(hex: "021f4b"), Color.init(hex: "8749bc"), Color.init(hex: "021f4b"),Color.init(hex: "1b1145")]), startPoint: .topLeading, endPoint: .bottom))
        .cornerRadius(30)
    }
}

//struct VoyageCardViewNotif_Previews: PreviewProvider {
//    static var previews: some View {
//        VoyageCardViewNotif()
//    }
//}
