//
//  PersonalityTestDoneView.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct PersonalityTestDoneView: View {
    
    @ObservedObject var iPersonalityTextViewModel =  IPersonalityTestViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer()
                .frame(height: 60)
            
            Text("Congratulations! You've successfully completed the compatibility quiz 🎉")
              .font(Font.custom("SF Compact", size: 32))
              .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
              .frame(width: 317, alignment: .topLeading)
            
            Spacer()
                .frame(height: 60)
            
            // Heading/H6/Medium
            Text("Your Personality ⭐")
              .font(
                Font.custom("Roboto", size: 18)
                  .weight(.medium)
              )
              .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
              .frame(width: 300, alignment: .topLeading)
              .padding(.bottom, 5)
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 186, height: 46)
                    .background(
                        LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(red: 0.96, green: 0.7, blue: 0), location: 0.00),
                                Gradient.Stop(color: Color(red: 1, green: 0.8, blue: 0.18), location: 1.00),
                            ],
                            startPoint: UnitPoint(x: 0, y: 0.5),
                            endPoint: UnitPoint(x: 1, y: 0.5)
                        )
                    )
                    .cornerRadius(90)
                    .shadow(color: .black.opacity(0.06), radius: 2, x: 0, y: 3)
                    .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 2)
                    .shadow(color: .black.opacity(0.08), radius: 6, x: 0, y: 6)
                
                HStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 7, height: 7)
                        
                    Text(iPersonalityTextViewModel.personalityTypes)
                        .font(.system(size: 20, weight: .medium, design: .default))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                    
                    Circle()
                        .fill(Color.white)
                        .frame(width: 7, height: 7)
                }
            }
            .padding(.bottom, 5)
            
            Text(iPersonalityTextViewModel.personalityTypesDesc)
              .font(
                Font.custom("SF Pro Text", size: 14)
                  .italic()
              )
              .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
              .frame(width: 300, alignment: .topLeading)
            
            Spacer()
            
            NavigationLink(destination: MyMatches(iPersonalityTextViewModel: iPersonalityTextViewModel)) {
                ZStack {
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.38, green: 0.81, blue: 0.83), location: 0.00),
                            Gradient.Stop(color: Color(red: 0, green: 0.74, blue: 0.84), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: -0.14, y: -0.29),
                        endPoint: UnitPoint(x: -0.14, y: 1)
                    )
                    // Button/Large Button/Bold
                    Text("Show Compatible Matches")
                        .font(.system(size: 18, weight: .medium, design: .default))
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                }
            }
            .cornerRadius(20, corners: [.allCorners])
            .frame(height: 50)
            .padding(.bottom, 20)
            

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .padding(.leading, 35)
        .padding(.trailing, 35)
        .onAppear{
            iPersonalityTextViewModel.getPersonalityType()
        }
    }
}

struct PersonalityTestDoneView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTestDoneView(iPersonalityTextViewModel: IPersonalityTestViewModel())
    }
}
