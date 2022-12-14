#' Download .bib files
#'
#' @param to A file path to a directory for the downloaded .bib files.
#'
#' @author Kelli F. Johnson
#' @export
#'
download_bibs <- function(to = getwd()) {
  dir.create(to, recursive = TRUE, showWarnings = FALSE)
  org <- "nmfs-fish-tools"
  repo <- "journals"
  files <- find_bibs()
  url <- paste0(
    "https://raw.githubusercontent.com/", org, "/", repo,
    "/main/inst/bib/"
  )
  purrr::walk2(
    .x = paste0(url, files),
    .y = file.path(to, files),
    .f = utils::download.file
  )
}
