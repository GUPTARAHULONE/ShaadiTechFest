package com.example.shaadihackfest

data class PersonalityQuestionAnswer(
    val questionId: Int = 0,
    val questionTitle: Int = 0,
    val options: List<OptionList> = listOf()
)

data class OptionList(
    val id: Int = 0,
    val title: String = "",
    val selectedOption: Int = -1
)