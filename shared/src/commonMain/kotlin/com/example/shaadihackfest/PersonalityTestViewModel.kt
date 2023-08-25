package com.example.shaadihackfest

import com.example.shaadihackfest.utils.toCommonStateFlow
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.launch

class PersonalityTestViewModel {

    private val viewModelScope = CoroutineScope(Dispatchers.Main)

    private val _state = MutableStateFlow(listOf(MatchesDetailsDataModelItem()))
    private val questionCounter = MutableStateFlow(-1)
    private val api = InfoApi()

    val getState = _state.toCommonStateFlow()
    private val _quesState = MutableStateFlow(PersonalityQuestionAnswer())
    val getQuesState = _quesState.toCommonStateFlow()

    init {
       // callApi()
    }

    private fun callApi() {
        viewModelScope.launch {
            val data = api.getApiCall2("ISFP")
            _state.value = data
        }
    }

    fun submitPersonalityTestAnswer(dataList: List<PersonalityTestAnswer>) {
        println(dataList)
    }

//    private var dummyDataList = List(15) {
//        PersonalityQuestionAnswer(
//            questionId = it + 1, // Assuming unique question IDs starting from 1
//            questionTitle = "", // Assuming unique question titles starting from 101
//            options = List(2) { // Assuming 1 to 4 options for each question
//                OptionList(
//                    id = (1..100).random(), // Assuming option IDs from 1 to 100
//                    title = "Option ${(1..10).random()}", // Assuming option titles like "Option 1", "Option 2", etc.
//                    selectedOption = (0..2).random() // Assuming selected option IDs from 0 to 2
//                )
//            }
//        )
//    }

    private var dummyDataList = listOf(
        PersonalityQuestionAnswer(
            questionId = 0,
            questionTitle = "ARE YOU USUALLY",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "A “GOOD MIXER” WITH GROUPS OF PEOPLE, OR"
                ),
                OptionList(
                    id = 1,
                    title = "RATHER QUIET AND RESERVED?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 1,
            questionTitle = "AMONG YOUR FRIENDS ARE YOU",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "FULL OF NEWS ABOUT EVERYBODY, OR"
                ),
                OptionList(
                    id = 1,
                    title = "ONE OF THE LAST TO HEAR WHAT IS GOING ON?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 2,
            questionTitle = "DO YOU TEND TO HAVE",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "BROAD FRIENDSHIPS WITH MANY DIFFERENT PEOPLE, OR"
                ),
                OptionList(
                    id = 1,
                    title = "DEEP FRIENDSHIP WITH VERY FEW PEOPLE?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 3,
            questionTitle = "WHEN YOU ARE WITH THE GROUP OF PEOPLE, WOULD YOU USUALLY RATHER",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "JOIN IN THE TALK OF THE GROUP OR"
                ),
                OptionList(
                    id = 1,
                    title = "STAND BACK AND LISTEN FIRST?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 4,
            questionTitle = "IF YOU WERE A TEACHER, WOULD YOU RATHER TEACH",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "FACTS-BASED COURSES, OR"
                ),
                OptionList(
                    id = 1,
                    title = "COURSES INVOLVING OPINION OR THEORY?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 5,
            questionTitle = "IN DOING SOMETHING THAT MANY OTHER PEOPLE DO, WOULD YOU RATHER",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "INVENT A WAY OF YOUR OWN, OR"
                ),
                OptionList(
                    id = 1,
                    title = "DO IT IN THE ACCEPTED WAY?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 6,
            questionTitle = "DO YOU ADMIRE MORE THE PEOPLE WHO ARE",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "NORMAL-ACTING TO NEVER MAKE THEMSELVES THE CENTER OF ATTENTION, OR"
                ),
                OptionList(
                    id = 1,
                    title = "TOO ORIGINAL AND INDIVIDUAL TO CARE WHETHER THEY ARE THE CENTER OF ATTENTION OR NOT "
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 7,
            questionTitle = "DO YOU USUALLY GET ALONG BETTER WITH",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "REALISTIC PEOPLE, OR"
                ),
                OptionList(
                    id = 1,
                    title = "IMAGINATIVE PEOPLE?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 8,
            questionTitle = "DO YOU MORE OFTEN LET",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "YOUR HEART RULE YOUR HEAD. OR"
                ),
                OptionList(
                    id = 1,
                    title = "YOUR HEAD RULE YOUR HEART?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 9,
            questionTitle = "IS IT A HIGHER COMPLIMENT TO BE CALLED",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "A PERSON OF REAL FEELING, OR"
                ),
                OptionList(
                    id = 1,
                    title = "A CONSISTENTLY REASONABLE PERSON?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 10,
            questionTitle = "DO YOU USUALLY",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "VALUE EMOTION MORE THAN LOGIC, OR"
                ),
                OptionList(
                    id = 1,
                    title = "VALUE LOGIC MORE THAN FEELINGS?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 11,
            questionTitle = "WHEN YOU GO SOMEWHERE FOR THE DAY, WOULD YOU RATHER",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "PLAN WHAT YOU WILL DO AND WHEN, OR"
                ),
                OptionList(
                    id = 1,
                    title = "JUST GO!!"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 12,
            questionTitle = "WHEN IT IS SETTLED WELL IN ADVANCE THAT YOU WILL DO A CERTAIN THING AT A CERTAIN TIME,DO YOU FIND IT",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "NICE TO BE ABLE TO PLAN ACCORDINGLY, OR"
                ),
                OptionList(
                    id = 1,
                    title = "A LITTLE UNPLEASANT TO BE TIED DOWN?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 13,
            questionTitle = "WHEN YOU HAVE A SPECIAL JOB TO DO, DO YOU LIKE TO",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "ORGANIZE IT CAREFULLY BEFORE YOU START, OR"
                ),
                OptionList(
                    id = 1,
                    title = "FIND OUT WHAT IS NECESSARY AS YOU GO ALONG?"
                )
            )
        ),
        PersonalityQuestionAnswer(
            questionId = 14,
            questionTitle = "DO YOU PREFER TO",
            options = listOf(
                OptionList(
                    id = 0,
                    title = "ARRANGE PICNICS, PARTIES ETC, WELL IN ADVANCE, OR"
                ),
                OptionList(
                    id = 1,
                    title = "BE FREE TO DO WHATEVER TO LOOKS LIKE FUN WHEN THE TIME COMES?"
                )
            )
        )
    )
    val updatedDummyDataList = dummyDataList.toMutableList()
    private val answerList = mutableListOf<PersonalityTestAnswer>()

    fun getQuestionAnswer(): PersonalityQuestionAnswer {
        questionCounter.value = questionCounter.value + 1
        _quesState.value = dummyDataList[questionCounter.value]
        return dummyDataList[questionCounter.value]
    }

    fun optionSelected(answerId: String) {
//       val item =  updatedDummyDataList[questionCounter.value ]
//        val updatedOption = item.copy()
//        updatedDummyDataList[questionCounter.value ] = updatedDummyDataList[questionCounter.value ].copy(
//            options = Op
//        )
        answerList.add(PersonalityTestAnswer(questionCounter.value, answerId.toInt()))
    }

    private fun getScore(): String {
        var answerString = ""

        var e = 0
        var i = 0
        var s = 0
        var n = 0
        var t = 0
        var f = 0
        var j = 0
        var p = 0

        for (list in answerList) {
            if (list.questionId == 0) {
                if (list.questionId == 1) {
                    e += 2
                } else {
                    i + 2
                }
            } else if (list.questionId == 1) {
                if (list.questionId == 1) {
                    e += 2
                } else {
                    i += 1
                }
            } else if (list.questionId == 2) {
                if (list.questionId == 1) {
                    e += 2
                } else {
                    i += 1
                }
            } else if (list.questionId == 3) {
                if (list.questionId == 1) {
                    e += 1
                } else {
                    i += 2
                }
            } else if (list.questionId == 4) {
                if (list.questionId == 1) {
                    s += 2
                } else {
                    n += 2
                }
            } else if (list.questionId == 5) {
                if (list.questionId == 2) {
                    s += 1
                } else {
                    n += 1
                }
            } else if (list.questionId == 6) {
                if (list.questionId == 1) {
                    s += 1
                } else {
                    n += 2
                }
            } else if (list.questionId == 7) {
                if (list.questionId == 1) {
                    s += 1
                } else {
                    n += 2
                }
            } else if (list.questionId == 8) {
                if (list.questionId == 2) {
                    t += 2
                } else {
                    f += 1
                }
            } else if (list.questionId == 9) {
                if (list.questionId == 2) {
                    t += 2
                } else {
                    f += 1
                }
            } else if (list.questionId == 10) {
                if (list.questionId == 2) {
                    t += 2
                } else {
                    f += 2
                }
            } else if (list.questionId == 11) {
                if (list.questionId == 1) {
                    j += 2
                } else {
                    p += 2
                }
            } else if (list.questionId == 12) {
                if (list.questionId == 1) {
                    j += 1
                } else {
                    p += 1
                }
            } else if (list.questionId == 13) {
                if (list.questionId == 1) {
                    j += 1
                } else {
                    p += 2
                }
            } else if (list.questionId == 14) {
                if (list.questionId == 1) {
                    j += 2
                } else {
                    p += 1
                }
            }
        }

        answerString += if (e > i) {
            "E"
        } else {
            "I"
        }

        answerString += if (s > n) {
            "S"
        } else {
            "N"
        }

        answerString += if (t > f) {
            "T"
        } else {
            "F"
        }

        answerString += if (j > p) {
            "J"
        } else {
            "P"
        }

        return answerString
    }

    private fun getMappedData(data: String): List<String>? {
        val map = mutableMapOf<String, List<String>>()

        map["ESTJ"] = listOf("ESFJ", "ISFJ", "ISTJ", "INFP", "ISTP", "INTP", "ENTJ", "ENFP", "ESFP")
        map["ISTJ"] = listOf("ESTJ", "ESFJ", "ISFJ", "INFP", "ENFP", "INTJ", "ISTP", "ISTJ")
        map["ESFJ"] = listOf("ISTJ", "ISFJ", "ESTJ", "ENTP", "INTP", "ENFJ", "INFJ", "ISTP")
        map["ISFJ"] = listOf("ESTJ", "ISTJ", "ESFJ", "ENTP", "INFJ", "ENFJ", "ESTP", "ISTP", "INTP")
        map["ESFP"] = listOf(
            "ISFP",
            "ISTP",
            "INTJ",
            "ESTJ",
            "ESTP",
            "INFJ",
            "ENFJ",
            "ESFJ",
            "ISFJ",
            "ENTP",
            "ENFP",
            "INFP"
        )
        map["ISFP"] = listOf("ESFP", "ESTP", "ISTP", "INTJ", "INTP", "ENTJ", "ISTJ", "INFJ", "INFP")
        map["ESTP"] = listOf("ISFP", "ISTP", "INFJ", "ENFJ", "ISFJ", "ESFJ", "ENTP", "INFP", "ESFP")
        map["ISTP"] = listOf(
            "ESTP",
            "ISFP",
            "INFJ",
            "ENFJ",
            "INTJ",
            "INTP",
            "ESFP",
            "ESTJ",
            "ISTJ",
            "ESFJ",
            "ISFJ",
            "ENFP",
            "INFP",
            "ENTP"
        )
        map["ENTJ"] =
            listOf("ENTP", "INTP", "ESTJ", "INFP", "ENFJ", "ENFP", "ISFP", "ESFJ", "ISTP", "INTJ")
        map["INTJ"] = listOf(
            "ENFP",
            "INFP",
            "ESFP",
            "ISFP",
            "ISTP",
            "ISTJ",
            "INTP",
            "ENFJ",
            "ENTP",
            "ENTJ",
            "INFJ",
            "INTJ"
        )
        map["ENFJ"] = listOf(
            "INFJ",
            "INTJ",
            "INFP",
            "ENTJ",
            "ESTP",
            "ISTP",
            "INTP",
            "ENTP",
            "ENFJ",
            "ESFP",
            "ESFJ",
            "ISFJ",
            "ENFP"
        )
        map["INFJ"] = listOf(
            "INFP",
            "INTP",
            "ENFJ",
            "ISTP",
            "ESTP",
            "ENTP",
            "ENFP",
            "INTJ",
            "ESFJ",
            "ISFJ",
            "INFJ"
        )
        map["ENFP"] =
            listOf("INTJ", "ISTJ", "INFP", "INFJ", "ENTP", "ENFJ", "ESFP", "ENFJ", "INTP", "ENFP")
        map["INFP"] = listOf(
            "ESTJ",
            "INTJ",
            "ISTJ",
            "ENTJ",
            "ENFP",
            "INFJ",
            "INTP",
            "ENTP",
            "ENFJ",
            "ISFP",
            "ISTP",
            "INFP",
            "ESFP"
        )
        map["ENTP"] = listOf(
            "INTP",
            "ISFJ",
            "ENTJ",
            "INFJ",
            "INFP",
            "ENFP",
            "INTJ",
            "ESFJ",
            "ISTP",
            "ESTP",
            "ENTP",
            "ENFJ"
        )
        map["INTP"] = listOf(
            "INFJ",
            "INFP",
            "ENTP",
            "INTJ",
            "ISTP",
            "ESFJ",
            "ESTJ",
            "ENTJ",
            "ISFP",
            "ENFP",
            "ENFJ",
            "ISFJ"
        )

        return map[data]
    }

//    private fun callPostApi() {
//        viewModelScope.launch {
//            val data = api.getInfoApiCall()
//            _state.update {
//                it.copy(
//                    data = data
//                )
//            }
//        }
//    }
}
