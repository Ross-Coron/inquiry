\name{clean_evidence}

\alias{clean_evidence}

\title{Clean Evidence}

\description{Removes redundant line from start of written evidence submitted to UK Parliament Select Committee inquiries. Removed text saved as .txt file.}

\usage{clean_evidence(evidence_text)}

\arguments{
  \item{evidence_text}{Dataframe containing document IDs and raw text.}
}

\details{Optionally called by inquiry's main function, \code{\link{written_submissions}}. 

Attempts to remove redundant first line from written evidence (e.g."ISG0194 - Evidence on Industrial strategy Written evidence from UCL (ISG0194))" using REGEX pattern: \code{^.*?\\(.*?\\d+\\)}. 

If pattern is not recognised, NA is written to dataframe. Removed text saved to a .txt file.}

\value{Returns dataframe with redundant lines removed.}

\examples{
clean_evidence(evidence_text)
evidence_text <- clean_evidence(evidence_text)
}
