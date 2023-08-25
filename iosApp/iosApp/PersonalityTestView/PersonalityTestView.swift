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
        VStack{
            Image("analysis1")
                .frame(width: 172, height: 172)
            
            // Heading/H4/Bold
            Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.questionTitle)
              .font(
                Font.custom("Roboto", size: 24)
                  .weight(.bold)
              )
              .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
              .frame(width: 302, alignment: .topLeading)
            
            HStack {
                // Body/Large/Medium
                Text(iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.options.first?.title ??  "")
                  .font(
                    Font.custom("Roboto", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.32, green: 0.31, blue: 0.36))
                
                Spacer()
                
                //if iPersonalityTextViewModel.personalityTestViewModelQuestionAnswer.options.
                Image("radioUnselected")
            }
            .padding(.leading, 20)
            .padding(.trailing, 10)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
            .cornerRadius(130)
            
        }
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
