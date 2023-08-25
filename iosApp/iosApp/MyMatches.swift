//
//  MyMatches.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI
import shared

struct MyMatches: View {
    @ObservedObject var iPersonalityTextViewModel =  IPersonalityTestViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
                .frame(height: 50)
            
            HStack {
                Text("My Matches")
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.3))
                    .padding(.leading, 30)
                
                Spacer()
                
                NavigationLink(destination: EmptyView()) {
                    Text("Home")
                        .font(
                            Font.custom("Roboto", size: 18)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                }
                .padding(.trailing, 30)
            }
            .padding(.bottom, 10)
            
            ScrollView(showsIndicators: false) {
                ForEach(iPersonalityTextViewModel.matchesData, id: \.self.id) { item in
                    profileCard(data: item)
                        .padding(.bottom, 20)
                }
                .padding(.top, 20)
            }
        }
        .onAppear {
            iPersonalityTextViewModel.onStartObervingMatchesData()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

// MARK: - ViewBuilders
extension MyMatches {
    func profileCard(data:  MatchesDetailsDataModelItem) -> some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 380)
            }
        placeholder: {
            Color.red
        }
            
            VStack(alignment: .leading, spacing:0) {
                
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(
                                stops: [
                                    Gradient.Stop(color: Color(red: 0.26, green: 0.73, blue: 0.73), location: 0.00),
                                    Gradient.Stop(color: Color(red: 0.45, green: 0.77, blue: 0.49), location: 1.00),
                                ],
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 1)
                            ))
                            .frame(width: 100, height: 30)
                            .cornerRadius(10, corners: [.bottomLeft])
                        
                        Text("Architect")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .kerning(0.4)
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
                
                
                VStack(alignment: .leading) {
                    Text(data.name)
                        .font(.system(size: 26, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("\(data.age),")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        
                        Text(data.job)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("\(data.mother_tongue),")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        
                        Text("\(data.city), \(data.state)")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 15)
                }
                .padding(.leading, 15)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0.06, green: 0.05, blue: 0.05), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.65, y: 0.99),
                        endPoint: UnitPoint(x: 0.64, y: 0.03)
                    )
                )
                .offset(y:10)
                
                Spacer()
                    .frame(height: 10)
            }
            .padding(.leading, 0)
        }
        .background(Color.red)
        .cornerRadius(20, corners: [.allCorners])
        .frame(height: 380)
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}

struct MyMatches_Previews: PreviewProvider {
    static var previews: some View {
        MyMatches(iPersonalityTextViewModel: IPersonalityTestViewModel())
    }
}


