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
    @Published var selectedOption: Bool = false
    
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
    
    func optionSelected(id: Int) {
        personalityTestViewModel?.optionSelected(answerId: String(id))
    }
    
    func getNextQuestion() {
        personalityTestViewModel?.getQuestionAnswer()
    }
    
    
}
