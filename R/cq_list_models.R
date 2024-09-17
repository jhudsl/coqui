set_device = function(device = NULL) {
  if (is.null(device)) {
    torch = reticulate::import("torch")
    is_cuda_available = torch$cuda$is_available()
    # Get device
    device = ifelse(is_cuda_available, "cuda", "cpu")
  }
}

#' List Coqui Models
#'
#' @param convert Should the output be converted to R rather than give
#' a Python object back?  Almost surely you should use `TRUE` here.
#' @return A character vector
#' @export
#'
#' @examples
#' if (is_coqui_installed()) {
#'    cq_list_models()
#' }
cq_list_models = function(
    convert = TRUE) {
  TTS = api_TTS(convert = convert)
  TTS = TTS()
  # List available 🐸TTS models
  res = TTS$list_models()
  if (convert) {
    res = reticulate::py_to_r(res)
  }
  res
}

#' @export
#' @rdname cq_list_models
cq_model_information = function() {
  TTS = api_TTS(convert = TRUE)
  path = TTS$get_models_file_path()
  path = as.character(path)
  models = jsonlite::read_json(path)
  models
}

#' @export
#' @param model name of the model, see [cq_list_models]
#' @rdname cq_list_models
cq_download_model = function(
    model = "tts_models/en/multi-dataset/tortoise-v2"
) {
  TTS = api_TTS()
  tts = TTS(model, gpu = FALSE)
  tts
}

#' @export
#' @rdname cq_list_models
cq_model_folder = function() {
  TTS = pytts()
  utils = TTS$utils$generic_utils
  as.character(
    utils$get_user_data_dir(appname = "tts")
  )
}


#' @export
#' @rdname cq_list_models
cq_model_download_folder = function(
    model = "tts_models/en/multi-dataset/tortoise-v2"
) {
  model = gsub("//", "/", model)
  model = gsub("/", "--", model)
  paste0(cq_model_folder(), "/", model)
}

#' @export
#' @rdname cq_list_models
cq_model_config_json_file = function(
    model = "tts_models/en/multi-dataset/tortoise-v2"
) {
  path = cq_model_download_folder(model = model)
  paste0(path, "/", "config.json")
}


#' @export
#' @rdname cq_list_models
cq_fix_bark_config = function() {
  json_file = cq_model_config_json_file(
    model = "tts_models/multilingual/multi-dataset/bark")
  stopifnot(file.exists(json_file))
  x = readLines(json_file)
  x = gsub("/root/[.]local", path.expand("~/.local"), x)
  writeLines(x, json_file)
}
