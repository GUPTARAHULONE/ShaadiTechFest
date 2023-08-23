package com.example.shaadihackfest

class Greeting {
    private val platform: Platform = getPlatform()

    fun greet(): String {
        return "Hellowdwd, ${platform.name}!"
    }
}