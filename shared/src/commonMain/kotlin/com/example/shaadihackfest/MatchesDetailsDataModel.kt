package com.example.shaadihackfest

import kotlinx.serialization.Serializable

@Serializable
data class MatchesDetailsDataModel(
    val list: List<MatchesDetailsDataModelItem> = listOf()
)

@Serializable
data class MatchesDetailsDataModelItem(
    val id: Int = 0,
    val name: String = "",
    val age: Int = 20,
    val image_url: String = "",
    val occupation: String = "",
    val personality_type: String = "",
    val job: String = "",
    val mother_tongue: String = "",
    val city: String = "",
    val state: String = "",
    val personality: String = ""
)
