package com.example.shaadihackfest

data class PersonalityQuestionAnswer(
    val questionId: Int = 0,
    val questionTitle: String = "",
    val selectedOption: Int = -1,
    val options: List<OptionList> = listOf()
)

data class OptionList(
    val id: Int = 0,
    val title: String = ""
)
