#' Install Coqui
#'
#' @param packages character vector of packages to install. `"coqui-tts"`
#' is automatically added to the vector, passed to [reticulate::py_install()]
#' @param pip Boolean; use pip for package installation?
#' Passed to [reticulate::py_install()]
#' @param ... additional arguments to pass to  [reticulate::py_install()].
#'
#' @return Nothing (`invisible(NULL)`).  Command is called for side effects
#' @export
#'
#' @examples
#' \dontrun{
#'   if (!is_coqui_installed()) {
#'     install_coqui()
#'   }
#' }
install_coqui = function(
    packages = NULL,
    pip = TRUE,
    ...) {
  packages = unique(c(packages, "coqui-tts"))
  reticulate::py_install(
    packages = packages,
    pip = pip,
    ...
  )
}

#' @export
#' @rdname install_coqui
is_coqui_installed = function() {
  reticulate::py_module_available("coqui-tts")
}


