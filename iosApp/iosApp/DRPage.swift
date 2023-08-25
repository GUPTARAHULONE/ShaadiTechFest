//
//  DRPage.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct DRPage: View {
    
    @State var showRecommendPhotoUploadDockView = true
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Image("backgroundBlurredImage")
                    .resizable()
                
                
                newContent
                
                //PersonalityTestBottomSheet(showRecommendPhotoUploadDockView: $showRecommendPhotoUploadDockView)
            }
            .ignoresSafeArea()
        }
        //.ignoresSafeArea()
    }
    
    var newContent: some View {
        VStack(spacing: 0) {
            Spacer()
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Spacer()
                    Text("Welcome to the journey of \nfinding your compatible \nMatches! 😊")
                        .font(
                            Font.custom("SF Compact", size: 26)
                                .weight(.semibold)
                        )
                        .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
                        .padding(EdgeInsets(top: 35, leading: 0, bottom: 25, trailing: 0))
                    //.frame(width: .infinity, alignment: .topLeading)
                    
                    Spacer()
                }
                
                NavigationLink(destination: PersonalityTestView()) {
                    ZStack {
                        Text("Let's begin                                         ")
                            .font(
                                Font.custom("Roboto", size: 18)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.38, green: 0.81, blue: 0.83), location: 0.00),
                                        Gradient.Stop(color: Color(red: 0, green: 0.74, blue: 0.84), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: -0.14, y: -0.29),
                                    endPoint: UnitPoint(x: -0.14, y: 1)
                                )
                            )
                            .cornerRadius(25, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        
                        
                        Image("rightArrow")
                            .offset(x: 55)
                    }
                }
                Spacer()
                    .frame(height: 60)

            }
            .background(Color.white)
            .cornerRadius(25, corners: [.topLeft, .topRight])
            //.frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct DRPage_Previews: PreviewProvider {
    static var previews: some View {
        DRPage()
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
    
