package com.example.shaadihackfest

import com.example.shaadihackfest.utils.toCommonMutableStateFlow
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.request.get
import io.ktor.client.statement.bodyAsText
import kotlinx.coroutines.flow.MutableStateFlow

class Greeting {
    private val platform: Platform = getPlatform()
    private val client = HttpClient()
    val counter = MutableStateFlow(0)
    val counter2 = counter.toCommonMutableStateFlow()

    fun greet(): String {
        return "Hellowdwd, ${platform.name}!"
    }

    suspend fun getApiCall(): String {
        val response = client.get("https://ktor.io/docs/")
        println(response)
        return response.bodyAsText()
    }

    suspend fun getApiCall2(score: String): String {
        val response =
            client.get("https://topical-vital-satyr.ngrok-free.app/api/matches$score")
        println(response)
        return response.toString()
    }

    suspend fun getAllLaunches(): List<InfoApi.RocketLaunch> {
        return client.get("https://api.spacexdata.com/v5/launches").body()
    }

    fun incCounter() {
        counter.value = counter.value + 1
    }

    fun getCnt(): Int {
        return counter.value
    }
}
