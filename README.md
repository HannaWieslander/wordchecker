
# wordchecker

wordchecker is an R package that identifies positive and negative words in a text using predefined word lists. It counts the words in each category and calculates the ratio of positive to negative words.

## Functions

- `read_text()` reads a text file and converts it into individual lowercase words.
- `match_words()` identifies words matching a given word list, including words with different suffixes using `*`.
- `count_words()` counts positive and negative words and calculates their ratio.

## Example

```r
library(wordchecker)

# Read and preprocess a text file
words <- read_text("Example_negative.txt")

# Find positive and negative words
match_words(words, positive_words)
match_words(words, negative_words)

# Count words and calculate the ratio
count_words(words)
```

The example text file is included in the package under `inst/testdata/`. After installation, its path can be found using:

```r
system.file("testdata", "Example_negative.txt", package = "wordchecker")
```

## Author

Hanna Wieslander
