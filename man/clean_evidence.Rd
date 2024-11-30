\name{clean_evidence}

\alias{clean_evidence}

\title{Clean Evidence}

\description{Removes redundant line from start of written evidence submitted to UK Parliament Select Committee inquiry. Removed text saved as .txt file.}

\usage{clean_evidence(evidence_text)}

\arguments{
  \item{evidence_text}{Dataframe containing document IDs and raw text.}
}

\details{Optionally called by inquiry's main function, \code{\link{written_submissions}}. Attempts to remove redundant first line from written evidence (e.g."ISG0194 - Evidence on Industrial strategy Written evidence from UCL (ISG0194))" using REGEX pattern: \code{^.*?\\(.*?\\d+\\)}. If pattern not recognised, NA is written to dataframe. Removed text saved to a .txt file.}

\value{Returns dataframe with redundant line removed}

\examples{

clean_evidence(evidence_text)

evidence_text <- clean_evidence(evidence_text)

## Function currently defined as
function (evidence_text) 
{
    regex_string <- "^.*?\\(.*?\\d+\\)"
    if (!any(grepl(regex_string, evidence_text$extracted_text))) {
        warning("Evidence text NOT cleaned (regex pattern not found).")
        return(evidence_text)
    }
    matches <- gregexpr(regex_string, evidence_text$extracted_text)
    extracted <- regmatches(evidence_text$extracted_text, matches)
    removed_text <- c(as.character(Sys.time()), paste("REGEX pattern:", 
        regex_string))
    for (match in extracted) {
        if (length(match) == 0) {
            removed_text <- c(removed_text, "<NO TEXT REMOVED>")
        }
        removed_text <- c(removed_text, match)
    }
    writeLines(removed_text, "removed_text.txt")
    print("Evidence cleaned. Removed text saved as removed_text.txt")
    evidence_text$extracted_text <- gsub(regex_string, "", evidence_text$extracted_text)
    return(evidence_text)
  }
}
