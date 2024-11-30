library(glue)
library(httr)
library(xml2)
library(jsonlite)
library(base64enc)
library(dplyr)

# Main function
written_submissions <- function(inquiry_id, clean = TRUE) {
  
  # Check input
  source("check_input.R")
  check <- check_input(inquiry_id)
  print("Input OK. Retrieving data...")
  
  # Get IDs of evidence documents submitted to inquiry
  source("get_document_ids.R")
  document_ids <- get_document_ids(inquiry_id)
  
  # Get names of evidence authors
  source("get_submitters.R")
  submitters <- get_submitters(inquiry_id)
  
  # Get evidence text
  source("get_documents.R")
  evidence_text <- get_documents(document_ids)
  
  # If clean == TRUE (optional argument), remove header text from evidence
  if (clean == TRUE) {
    print("Cleaning data...")
    source("clean_evidence.R")
    evidence_text <- clean_evidence(evidence_text)
  }
  
  # Combine ids, authors, and evidence text into R data frame
  output <- data.frame(
    id = evidence_text$evidence_id,
    submitter = submitters,
    text = evidence_text$extracted_text
  )
  
  # Export data to CSV
  write.csv(output, "written_evidence.csv", row.names = FALSE)
  
  print("Process complete! See `written_evidence.csv`")
}
