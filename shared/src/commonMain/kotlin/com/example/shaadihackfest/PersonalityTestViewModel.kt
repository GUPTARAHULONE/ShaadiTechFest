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
    private val api = InfoApi()

    val getState = _state.toCommonStateFlow()

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
}
