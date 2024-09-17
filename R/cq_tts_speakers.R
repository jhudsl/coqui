
tts_model = function(model) {
  TTS = api_TTS()
  tts = TTS(model)
  tts = tts$to("cpu")
}

#' Get Properties of a Model
#'
#' @param model name of the model, see [cq_list_models]
#'
#' @return Indicators/flags from the `TTS` API
#' @export
#'
#' @rdname cq_model_info
#' @examples
#' cq_model_info()
cq_model_info = function(
    model = "tts_models/en/ljspeech/fast_pitch"
) {
  tts = tts_model(model = model)
  list(
    model_name = tts$model_name,
    speakers =  tts$speakers,
    is_multi_speaker = tts$is_multi_speaker,
    is_multi_lingual = tts$is_multi_lingual
  )
}

#' @rdname cq_model_info
#' @export
cq_model_is_multi_speaker = function(
    model = "tts_models/en/ljspeech/fast_pitch"
) {
  cq_model_info(model)$is_multi_speaker
}

#' @rdname cq_model_info
#' @export
#' @examples
#' cq_model_speakers()
cq_model_speakers = function(
    model = "tts_models/en/ljspeech/fast_pitch"
) {
  cq_model_info(model)$speakers
}

#' @rdname cq_model_info
#' @export
cq_model_is_multi_lingual = function(
    model = "tts_models/en/ljspeech/fast_pitch"
) {
  tts = tts_model(model = model)
  cq_model_info(model)$is_multi_lingual
}
