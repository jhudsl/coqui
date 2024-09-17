#' Text to Speech
#'
#' @param text Text to turn into Speech
#' @param model Model to use for speech with Coqui
#' @param device Either `cuda` or `cpu`.  Uses `torch.cuda.is_available` to
#' swtich, or can be explicitly set here.
#' @param path Path to output `wav` file
#' @param ... additional arguments to send to the function of
#' `tts_to_file` from the Python `TTS.api.TTS()` implementation
#'
#' @return A path to the `wav` file
#' @export
#'
#' @examples
cq_tts = function(
    text,
    model = "tts_models/en/ljspeech/fast_pitch",
    path = tempfile(fileext = ".wav"),
    device = NULL,
    ...
) {
  TTS = api_TTS()
  tts = TTS(model)
  device = set_device(device)
  tts = tts$to(device)

  text = paste(text, collapse = "\n")
  wav = tts$tts_to_file(
    text = text,
    file_path = path,
    ...)
  if (!file.exists(path)) {
    warning("File not exists, may be issue with tts run, please check.")
  }
  return(path)
}
