library(glue)
library(httr)
library(xml2)
library(jsonlite)
library(base64enc)
library(dplyr)

# Main function. Input inquiry ID, get dataframe and CSV file of written evidence
written_submissions <- function(inquiry_id, clean = TRUE) {
  
  # Check input
  source("check_input.R")
  check <- check_input(inquiry_id)
  
  message("Input OK. Retrieving data...")
  
  # Get IDs of evidence documents submitted to inquiry
  source("get_document_ids.R")
  document_ids <- get_document_ids(inquiry_id)
  
  message("Got document IDs. Getting authors...")
  
  # Get names of evidence authors
  source("get_submitters.R")
  submitters <- get_submitters(inquiry_id)
  
  message("Got authors. Getting evidence text...")
  
  # Get evidence text
  source("get_documents.R")
  evidence_text <- get_documents(document_ids)
  
  # If clean == TRUE (optional argument), remove header text from evidence
  if (clean == TRUE) {
    message("Got evidence text. Cleaning text...")
    source("clean_evidence.R")
    evidence_text <- clean_evidence(evidence_text)
  }
  
  message("Exporting data to dataframe and CSV file (`written_evidence.csv`)...")
  
  # Combine ids, authors, and evidence text into dataframe
  output <- data.frame(
    id = evidence_text$evidence_id,
    submitter = submitters,
    text = evidence_text$extracted_text
  )
  
  # Export data to CSV
  write.csv(output, "written_evidence.csv", row.names = FALSE)
  
  message("Process complete!")
}
