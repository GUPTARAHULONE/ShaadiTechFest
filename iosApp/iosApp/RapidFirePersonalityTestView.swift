//
//  RapidFirePersonalityTestView.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct RapidFirePersonalityTestView: View {
    
    let iPersonalityTextViewModel: IPersonalityTestViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                   
                Text("Which word in each pair appeals to you more? ")
                    .font(Font.custom("SF Compact", size: 32))
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
                    .frame(width: 317, alignment: .topLeading)
                
                Button {
                    //iPersonalityTextViewModel.optionSelected(id: 0)
                } label: {
                    HStack {
                        Text("Option1")
                          .font(
                            Font.custom("Roboto", size: 16)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.32, green: 0.31, blue: 0.36))
                        
                        Spacer()
                        
                        if iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.selectedOption == -1 {
                            Image("radioUnselected")
                        } else {
                            Image("radioSelected")
                        }
                        
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .cornerRadius(130)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                
            }
            
            navigationButton()
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    
}


//ViewBuilder Methods
extension RapidFirePersonalityTestView {
    
    @ViewBuilder func navigationButton() -> some View {
        VStack {
            Spacer()
                .frame(height: 30)
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
                    Text("Show My ideal Matches")
                        .font(.system(size: 18, weight: .medium, design: .default))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
            }
            .cornerRadius(20, corners: [.allCorners])
            .frame(height: 50)
            .padding(.bottom, 30)
            .padding(.leading, 30)
            .padding(.trailing, 30)
        }
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: .white.opacity(0), location: 0.00),
                    Gradient.Stop(color: .white, location: 0.43),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 0.73)
            )
        )
    }
}

struct RapidFirePersonalityTestView_Previews: PreviewProvider {
    static var previews: some View {
        RapidFirePersonalityTestView(iPersonalityTextViewModel: IPersonalityTestViewModel())
    }
}
