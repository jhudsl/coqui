% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cq_tts_speakers.R
\name{cq_model_info}
\alias{cq_model_info}
\alias{cq_model_is_multi_speaker}
\alias{cq_model_speakers}
\alias{cq_model_is_multi_lingual}
\title{Get Properties of a Model}
\usage{
cq_model_info(model = "tts_models/en/ljspeech/fast_pitch")

cq_model_is_multi_speaker(model = "tts_models/en/ljspeech/fast_pitch")

cq_model_speakers(model = "tts_models/en/ljspeech/fast_pitch")

cq_model_is_multi_lingual(model = "tts_models/en/ljspeech/fast_pitch")
}
\arguments{
\item{model}{name of the model, see \link{cq_list_models}}
}
\value{
Indicators/flags from the \code{TTS} API
}
\description{
Get Properties of a Model
}
\examples{
cq_model_info()
cq_model_speakers()
}
