#' Match words against a word list
#'
#'Finds words in a text that match words in a given word list.
#'Matches both exact words and words that start with the same letters when an asterisk (*) is used in the word list.
#'Returns all matching words, including words that appear more than once.
#'
#' @param text_words A character vector containing words from the text.
#' @param word_list A character vector containing positive or negative words to match.
#'
#' @returns A character vector containing all matching words from the text.
#' @export
#'
#' @examples
#' test_words <- c("nauseous", "sad", "nauseous")
#' test_list <- c("nauseous", "nause*", "sad")
#'
#' match_words(test_words, test_list)
match_words <- function(text_words, word_list) {

  # Create an empty vector to store matching words
  matches <- character(0)

  # Loop through each word in the text
  for (current_word in text_words) {

    # Start with no match for each new word
    found_match <- FALSE

    # Check for exact matches
    if (current_word %in% word_list) {
      found_match <- TRUE
    }

    # Check for matches using *
    for (list_item in word_list) {
      if (endsWith(list_item, "*")) {
        prefix <- substring(list_item, 1, nchar(list_item) - 1)

        if (startsWith(current_word, prefix)) {
          found_match <- TRUE
        }
      }
    }

    # Add the word if a match was found
    if (found_match) {
      matches <- c(matches, current_word)
    }
  }

  # Return the vector of matching words
  return(matches)
}

