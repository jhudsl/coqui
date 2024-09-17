pytts = function(convert = TRUE) {
  TTS = reticulate::import("TTS", convert = convert)
  TTS
}
pytts_api = function(convert = TRUE) {
  api = reticulate::import("TTS.api",  convert = convert)
  api
}

api_TTS = function(convert = TRUE) {
  tts = pytts(convert = convert)
  TTS = tts$api$TTS
}
