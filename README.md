
<!-- README.md is generated from README.Rmd. Please edit that file -->

# coqui

<!-- badges: start -->
<!-- badges: end -->

The goal of coqui is to wrap the [TTS](https://github.com/coqui-ai/TTS)
(but really [this version](https://github.com/idiap/coqui-ai-TTS))
Python module for translation of text to other languages.

# TTS Installation

You must install the `coqui-tts` Python module. You’ll likely do this
via:

``` r
install_coqui()
```

## Why not the TTS module?

The <https://github.com/coqui-ai/TTS> repo is no longer maintained. This
is where the `TTS` Python module comes from (when you run
`pip install TTS`). The fork of <https://github.com/idiap/coqui-ai-TTS>
is being actively maintained (by Idiap Research Institute), so we are
using that, and the module name is `coqui-tts`. **Note**: the name of
the module in Python is still `TTS`.

## Mac OSX

In Mac OSX, you need to install some dependencies for the Python `TTS`
version to work. We will install these via [Homebrew](https://brew.sh/).

``` bash
brew install mecab
```

``` bash
brew install espeak
brew link espeak
```

### Troubleshooting

If you get something like this

        return match.group("version")
               ^^^^^^^^^^^
    AttributeError: 'NoneType' object has no attribute 'group'

If you trace the error back, it’ll likely say something like:

``` bash
    _DEF_ESPEAK_VER = get_espeak_version()
```

Try going to the command line and run:

``` bash
espeak --version
```

And that will hopefully show you where the error is coming from.

# Package Installation

You can install the development version of `coqui` like so:

To install `TTS`, you can either run `install_coqui`, which calls
`reticulate::py_install()`, If you already have a `conda` environment
enacted, use `reticulate::py_install` or simply `install_coqui`:

``` r
library(coqui)
install_coqui()
```

Or you can run `create_coqui_condaenv()`, which calls
`reticulate::conda_create()` and creates a `conda` environment for
`coqui`, named `coqui`.

``` r
create_coqui_condaenv()
```

If you use this method, you should run
`reticulate::use_condaenv("coqui")` before enabling Python.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(coqui)

text = c(
  "Hello, my name is coqui.  I am a personal assistant to help talk to you.",
  "I hope you like how I sound!")
random_file = cq_tts(text)

text = c(
  "Hello, my name is coqui.  I am a personal assistant to help talk to you.",
  "I hope you like how I sound!")
res = cq_tts(text, path = "README_cache/example.wav")
```

<figure>
<audio
src="https://github.com/jhudsl/coqui/raw/refs/heads/main/README_cache/example.wav"
controls=""><a
href="https://github.com/jhudsl/coqui/raw/refs/heads/main/README_cache/example.wav">Example
Wav</a></audio>
<figcaption aria-hidden="true"><a
href="https://github.com/jhudsl/coqui/raw/refs/heads/main/README_cache/example.wav">Example
Wav</a></figcaption>
</figure>

``` r
system2("play", res)
```
