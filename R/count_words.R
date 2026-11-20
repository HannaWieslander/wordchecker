#' Count positive and negative words
#'
#' Counts positive and negative words in a text using the given the positive and negative word lists.
#' Calculates the ratio of positive to negative words.
#' If no negative words are found, the ratio is set to NA.
#'
#' @param text_words A character vector containing words from the text.
#'
#' @returns A list containing the number of positive words, the number of negative words, and the ratio of positive to negative words.
#' @export
#'
#' @examples
#' test_words <- c("happy", "sad", "good", "happy")
#' count_words(test_words)
count_words <- function(text_words) {

  # Find positive words
  positive_matches <- match_words(text_words, positive_words)

  # Find negative words
  negative_matches <- match_words(text_words, negative_words)

  # Count positive and negative words
  positive_count <- length(positive_matches)
  negative_count <- length(negative_matches)

  # Calculate the ratio of positive to negative words
  if(negative_count > 0) {
    ratio <- positive_count/negative_count
  } else {
    ratio <- NA
  }

  #Return the results
  results <- list(
    positive = positive_count,
    negative = negative_count,
    ratio = ratio
  )

  return(results)
}
