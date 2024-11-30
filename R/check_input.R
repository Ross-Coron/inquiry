# Check inquiry ID is valid, raising error if not
check_input <- function(inquiry_id, clean = TRUE) {
  
  if (!is.numeric(inquiry_id)){
    stop("Incorrect input! For help, try `?written_submissions`")
  }
  
  if (!is.logical(clean)){
    stop("Incorrect input! For help, try `?written_submissions`")
  }
  
  else {
    return (TRUE)
  }
}