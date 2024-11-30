# Takes inquiry ID (`committee_business_id`), returns vector of unique document IDs
get_document_ids <- function(inquiry_id) {
  
  # Build URL
  url <- "https://committees-api.parliament.uk/api/WrittenEvidence?CommitteeBusinessId={inquiry_id}&Take=256"
  url <- glue(url)
  
  # Extract IDs from JSON data
  response <- GET(url)
  
  if (response$status_code == 400) {
    stop("Inquiry not found!")
  }
  
  json_content <- content(response, as = "text", encoding = "UTF-8")
  parsed_data <- fromJSON(json_content)
  document_ids <- parsed_data$items[9]
}
