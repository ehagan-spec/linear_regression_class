#' Publish HTML Document to RPubs
#'
#' @param html_file Path to the HTML file to upload
#' @param title Title for the RPubs document
#' @param original_doc Path to original source file (Rmd/qmd), defaults to html_file
#' @param id Optional RPubs document ID for updating existing posts (NULL creates new)
#' @return The RPubs document info (including URL and ID for future updates)
publish_to_rpubs <- function(html_file, title = NULL, original_doc = NULL, id = NULL) {
  if (!requireNamespace("rsconnect", quietly = TRUE)) {
    stop("Package 'rsconnect' is required. Install with: install.packages('rsconnect')")
  }

  if (!file.exists(html_file)) {
    stop("HTML file not found: ", html_file)
  }

  if (is.null(title)) {
    title <- tools::file_path_sans_ext(basename(html_file))
  }

  if (is.null(original_doc)) {
    original_doc <- html_file
  }

  message("Publishing '", title, "' to RPubs...")

  result <- rsconnect::rpubsUpload(
    title = title,
    contentFile = html_file,
    originalDoc = original_doc,
    id = id
  )

  message("Success! Document published at: ", result$continueUrl)
  message("Document ID for future updates: ", result$id)

  invisible(result)
}

#' Publish All Lecture HTML Files to RPubs
#'
#' @param lectures_dir Directory containing lecture HTML files
#' @param ids Named list of document IDs for updating (names = filenames without extension)
#' @return List of results for each file
publish_all_lectures <- function(lectures_dir = "lectures", ids = list()) {
  html_files <- list.files(lectures_dir, pattern = "\\.html$", full.names = TRUE)

  if (length(html_files) == 0) {
    message("No HTML files found in ", lectures_dir)
    return(invisible(NULL))
  }

  results <- list()

  for (f in html_files) {
    name <- tools::file_path_sans_ext(basename(f))
    id <- ids[[name]]

    tryCatch({
      results[[name]] <- publish_to_rpubs(f, title = name, id = id)
    }, error = function(e) {
      warning("Failed to publish ", name, ": ", e$message)
      results[[name]] <<- NULL
    })
  }

  invisible(results)
}
