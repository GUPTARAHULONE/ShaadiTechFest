package com.example.shaadihackfest

import io.ktor.client.HttpClient
import io.ktor.client.request.get
import io.ktor.client.statement.bodyAsText

class InfoApi {

    private val client = HttpClient()

    suspend fun getApiCall(): String {
        val response = client.get("https://ktor.io/docs/")
        println(response)
        return response.bodyAsText()
    }
}
