#' Install Coqui Conda Environment
#'
#' @param envname The name of, or path to, a conda environment.
#' @param packages character vector of packages to install.  ``TTS"`
#' is automatically added to the vector, passed to [reticulate::py_install()]
#' @param ... additional arguments to pass to  [reticulate::conda_create()].
#'
#' @return Returns the path to the Python binary associated with the
#' newly-created conda environment.
#' @export
#'
#' @examples
#' \dontrun{
#'   if (!is_coqui_installed()) {
#'     create_coqui_condaenv()
#'   }
#' }
create_coqui_condaenv = function(
    envname = "coqui",
    packages = "TTS",
    ...) {

  reticulate::conda_create(
    envname = envname,
    packages = packages,
    ...,
  )
}
