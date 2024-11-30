# Clean redundant line from start of evidence text based on REGEX pattern
clean_evidence <- function(evidence_text){
  
  # Define REGEX expression
  regex_string <- "^.*?\\(.*?\\d+\\)"
  
  if (!any(grepl(regex_string, evidence_text$extracted_text))) {
    warning("Evidence text NOT cleaned (regex pattern not found).")
    return(evidence_text)
  }
  
  # Check evidence text for REGEX expression
  matches <- gregexpr(regex_string, evidence_text$extracted_text)
  
  extracted <- regmatches(evidence_text$extracted_text, matches)
  
  # Save removed text to .txt file
  removed_text <- c(as.character(Sys.time()), paste("REGEX pattern:", regex_string))
  
  for (match in extracted) {
    if (length(match) == 0) {
      removed_text <- c(removed_text, "<NO TEXT REMOVED>")
    }
    removed_text <- c(removed_text, match)
  }
  writeLines(removed_text, "removed_text.txt")
  message("Evidence cleaned. Removed text saved as removed_text.txt")
  
  # Remove identified REGEX text from data frame
  evidence_text$extracted_text <- gsub(regex_string, "", evidence_text$extracted_text)
  
  return (evidence_text)
}
