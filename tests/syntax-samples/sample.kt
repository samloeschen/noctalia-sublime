package noctalia.sample

data class Palette<T>(val value: T?) {
    suspend fun label(prefix: String = "value"): String =
        "$prefix: ${value ?: "empty"}"
}
