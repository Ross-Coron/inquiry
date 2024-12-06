# Takes vector of document IDs, returns document data as dataframe
get_documents <- function(document_list) {
  
  # Initialize an empty dataframe for results
  results <- data.frame(evidence_id = character(), extracted_text = character(), stringsAsFactors = FALSE)
  
  # Iterate over the document list
  for (document in document_list$id) {
    
    # Construct the URL
    url <- glue("https://committees-api.parliament.uk/api/WrittenEvidence/{document}/Document/Html")
    
    # Send GET request to the URL
    response <- GET(url)
    
    # Check if the request was successful
    if (status_code(response) == 200) {
      
      # Parse the JSON content
      json_content <- content(response, as = "text", encoding = "UTF-8")
      parsed_data <- fromJSON(json_content)
      
      # Extract the 'data' field
      base64_data <- parsed_data$data
      
      # Decode the Base64 data
      decoded_data <- base64decode(base64_data)
      
      # Convert raw decoded data to text
      html_content <- rawToChar(decoded_data)
      
      # Extract raw text (if it's in HTML format)
      if (grepl("<html>", html_content, fixed = TRUE)) {
        html_parsed <- read_html(html_content)
        raw_text <- xml_text(html_parsed, trim = FALSE)
      } else {
        raw_text <- html_content
      }
      
      # Append to the data frame
      results <- rbind(results, data.frame(evidence_id = document, extracted_text = raw_text, stringsAsFactors = FALSE))
      
      # Append an error message if the request failed 
    } else {
      results <- rbind(results, data.frame(evidence_id = document, extracted_text = paste("Failed to retrieve. Status:", status_code(response)), stringsAsFactors = FALSE))
    }
  }
  
  # Return the results
  return(results)
}