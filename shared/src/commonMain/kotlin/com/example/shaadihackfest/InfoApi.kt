package com.example.shaadihackfest

import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.request.get
import io.ktor.client.request.parameter
import io.ktor.client.request.url
import io.ktor.client.statement.bodyAsText
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json

class InfoApi {

    // private val client = HttpClient()

    private val client = HttpClient {
        install(ContentNegotiation) {
            json(
                Json {
                    ignoreUnknownKeys = true
                    useAlternativeNames = false
                }
            )
        }
    }

//    val client = HttpClient {
//        install(JsonFeature) {
//            serializer = KotlinxSerializer()
//        }
//    }

    suspend fun getApiCall(): String {
        val response = client.get("https://ktor.io/docs/")
        println(response)
        return response.bodyAsText()
    }

    suspend fun getMatchesData(score: String): List<MatchesDetailsDataModelItem> {
//        val response =
//            client.get("https://topical-vital-satyr.ngrok-free.app/api/matches?type=$score")
//        println(response)
//
// //        client.get{
// //            url("https://topical-vital-satyr.ngrok-free.app/api/matches?type=")
// //
// //        }
//        return response.bodyAsText()

        val response = client.get {
            url("http://personality-matching-hackfest2023.us-east-1.staging.shaadi.internal/api/matches")

            parameter("type", score)
        }

        println("response= " + response.body())
        return response.body()
    }

    suspend fun getAllLaunches(): List<RocketLaunch> {
        return client.get("https://api.spacexdata.com/v5/launches").body()
    }

    data class RocketLaunch(
        val flightNumber: Long,
        val missionName: String,
        val details: String?,
        val launchSuccess: Boolean?
    )
}
