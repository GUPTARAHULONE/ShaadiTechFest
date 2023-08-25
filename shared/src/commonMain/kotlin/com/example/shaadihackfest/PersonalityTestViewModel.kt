package com.example.shaadihackfest

import com.example.shaadihackfest.utils.toCommonStateFlow
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch

class PersonalityTestViewModel {

    private val viewModelScope = CoroutineScope(Dispatchers.Main)
    private val _state = MutableStateFlow(InfoState("Loading.."))
    private val questionCounter = MutableStateFlow(-1)
    private val api = InfoApi()

    val getState = _state.toCommonStateFlow()
    private val _quesState = MutableStateFlow(PersonalityQuestionAnswer())
    val getQuesState = _state.toCommonStateFlow()

    init {
        callApi()
    }

    private fun callApi() {
        viewModelScope.launch {
            val data = api.getApiCall()
            _state.update {
                it.copy(
                    data = data
                )
            }
        }
    }

    fun submitPersonalityTestAnswer(dataList: List<PersonalityTestAnswer>) {
        println(dataList)
    }

    private var dummyDataList = List(15) {
        PersonalityQuestionAnswer(
            questionId = it + 1, // Assuming unique question IDs starting from 1
            questionTitle = it + 101, // Assuming unique question titles starting from 101
            options = List((1..4).random()) { // Assuming 1 to 4 options for each question
                OptionList(
                    id = (1..100).random(), // Assuming option IDs from 1 to 100
                    title = "Option ${(1..10).random()}", // Assuming option titles like "Option 1", "Option 2", etc.
                    selectedOption = (0..2).random() // Assuming selected option IDs from 0 to 2
                )
            }
        )
    }
    val updatedDummyDataList = dummyDataList.toMutableList()
    private val answerList = mutableListOf<PersonalityTestAnswer>()

    fun getQuestionAnswer(): PersonalityQuestionAnswer {
        questionCounter.value = questionCounter.value + 1
        _quesState.value = dummyDataList[questionCounter.value]
        return dummyDataList[questionCounter.value]
    }

    fun optionSelected(answerId: Int) {
//       val item =  updatedDummyDataList[questionCounter.value ]
//        val updatedOption = item.copy()
//        updatedDummyDataList[questionCounter.value ] = updatedDummyDataList[questionCounter.value ].copy(
//            options = Op
//        )
        answerList.add(PersonalityTestAnswer(questionCounter.value, answerId))
    }

//    private fun getScore(): String {
//        val answerString =""
//
//        if(answerList[])
//
//    }
}
