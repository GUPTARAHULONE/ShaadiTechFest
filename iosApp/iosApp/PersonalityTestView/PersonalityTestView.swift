//
//  PersonalityTestView.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct PersonalityTestView: View {
    
    @ObservedObject var iPersonalityTextViewModel =  IPersonalityTestViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image("illu\(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.questionId)")
                .frame(width: 172, height: 172)
                .padding(.top, 50)
            
            // Heading/H4/Bold
            Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.questionTitle)
                .font(.system(size: 24, weight: .bold, design: .default))
//              .font(
//                Font.custom("Roboto", size: 24)
//                  .weight(.bold)
//              )
              .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
              .padding(.top, 50)
              .padding(.bottom, 20)
              .padding(.leading, 20)
              .padding(.trailing, 20)
              //.frame(width: 302, alignment: .topLeading)
            
            Button {
                iPersonalityTextViewModel.optionSelected(id: 0)
            } label: {
                HStack {
                    Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.options.first?.title ??  "")
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

            
            
            Button {
                iPersonalityTextViewModel.optionSelected(id: 1)
            } label: {
                HStack {
                    Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.options.first?.title ??  "")
                    //Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.options[1].title)
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
            
            
            Spacer()
            
            if iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.questionId == 14 {
                HStack {
                    Spacer()
                    NavigationLink(destination: PersonalityTestDoneView(iPersonalityTextViewModel: iPersonalityTextViewModel)) {
                        Image("rightNav")
                            .padding(.horizontal, 6)
                            .padding(.top, 7)
                            .padding(.bottom, 5)
                            .frame(width: 48, alignment: .center)
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
                            .cornerRadius(24)
                    }
                    .padding(.trailing, 40)
                }
            } else {
                HStack {
                    Spacer()
                    Button {
                        iPersonalityTextViewModel.getNextQuestion()
                    } label: {
                        Image("rightNav")
                            .padding(.horizontal, 6)
                            .padding(.top, 7)
                            .padding(.bottom, 5)
                            .frame(width: 48, alignment: .center)
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
                            .cornerRadius(24)
                    }
                    .padding(.trailing, 40)
                }
            }
            
            Spacer()
                .frame(height: 30)

        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
//        .onAppear{
//            iPersonalityTextViewModel = IPersonalityTestViewModel()
//        }
    }
}

struct PersonalityTestView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalityTestView(iPersonalityTextViewModel: IPersonalityTestViewModel())
    }
}
