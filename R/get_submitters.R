# Takes inquiry ID, returns list of evidence authors
get_submitters <- function(inquiry_id) {
  
  # Get JSON data from URL and parse
  url <- "https://committees-api.parliament.uk/api/WrittenEvidence?CommitteeBusinessId={inquiry_id}&Take=256"
  url <- glue(url)
  jsonData <- fromJSON(url)
  jsonData <- jsonData$items |> select(witnesses)
  
  # For each item, get author's name. If no author listed, write NA; if >1 author, combine
  organisations <- c()
  for (i in 1:nrow(jsonData)) {
    if (length(jsonData$witnesses[[i]]$organisations) == 0) {
      organisations = c(organisations, NA)
    } else {
      org_names = sapply(jsonData$witnesses[[i]]$organisations, function(org) org$name)
      combined_names = paste(org_names, collapse = ", ")
      organisations = c(organisations, combined_names)
    }
  }
  
  return(organisations)
}
