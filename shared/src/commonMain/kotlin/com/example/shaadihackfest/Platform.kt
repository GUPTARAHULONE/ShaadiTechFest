package com.example.shaadihackfest

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform