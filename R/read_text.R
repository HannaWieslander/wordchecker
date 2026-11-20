#' Read and process text
#'
#'Reads a text file, converts all letters to lowercase, replaces common punctuation marks with spaces, and splits the text into individual words. Empty elements are removed.
#'
#' @param file Path to the text file to be analyzed.
#'
#' @returns A character vector containing individual words.
#' @export
#'
#' @examples
#' test_file <- tempfile(fileext = ".txt")
#' writeLines("Today is a good day.", test_file)
#' read_text(test_file)
#' unlink(test_file)
read_text <- function(file) {

  # Read the text file
  my_text <- utils::read.delim(file, header = FALSE)

  # Convert the data frame to a vector
  my_vector <- unlist(my_text)

  # Convert all text to lowercase
  lowercase <- tolower(my_vector)

  # Replace punctuation with spaces
  lowercase <- gsub(";", " ", lowercase, fixed = TRUE)
  lowercase <- gsub(",", " ", lowercase, fixed = TRUE)
  lowercase <- gsub(".", " ", lowercase, fixed = TRUE)

  # Split the text into individual words
  words <- strsplit(lowercase, split = " ")

  # Convert the list to a vector
  words <- unlist(words)

  # Remove empty elements
  words <- words[words != ""]

  # Return the vector of words
  return(words)
}
