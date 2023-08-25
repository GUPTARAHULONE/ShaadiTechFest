//
//  IPersonalityTestViewModel.swift
//  iosApp
//
//  Created by Dhanajit Kapali on 25/08/23.
//  Copyright © 2023 orgName. All rights reserved.
//

import Foundation
import shared

class IPersonalityTestViewModel: ObservableObject {
    private let personalityTestViewModel: PersonalityTestViewModel?
    
    @Published var personalityTestViewModelQuestionAnswer = PersonalityQuestionAnswer(questionId: -1, questionTitle: "", selectedOption: -1, options: [])
    @Published var matchesData = [MatchesDetailsDataModelItem]()
    @Published var selectedOption: Bool = false
    @Published var personalityTypes: String = ""
    @Published var personalityTypesDesc: String = ""
    
    init() {
        personalityTestViewModel = PersonalityTestViewModel()
        onStartOberving()
        personalityTestViewModel?.getQuestionAnswer()
    }
    
    func onStartOberving(){
        personalityTestViewModel?.getQuesState.subscribe(
            onCollect: { state in
                if let state = state {
                    //print(state)
                    self.personalityTestViewModelQuestionAnswer = state
                    if state.selectedOption == -1 {
                        self.selectedOption = false
                    } else {
                        self.selectedOption = true
                    }
                }
            }
        )
    }
    
    func onStartObervingMatchesData(){
        personalityTestViewModel?.getMatchesDataState.subscribe(
            onCollect: { state in
                if let state = state {
                    //print(state)
                    if let matchesList = state as? [MatchesDetailsDataModelItem] {
                        self.matchesData = matchesList
                    }
                }
            }
        )
    }
    
    func optionSelected(id: Int) {
        personalityTestViewModel?.optionSelected(answerId: String(id))
    }
    
    func getNextQuestion() {
        personalityTestViewModel?.getQuestionAnswer()
    }
    
    func getPersonalityType(){
        let data = personalityTestViewModel?.getPersonalityType()
        
        if let data = data {
            personalityTypes = data[0]
            personalityTypesDesc = data[1]
        }
    }
    
    
}
