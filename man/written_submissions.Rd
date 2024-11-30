\name{written_submissions}

\alias{written_submissions}

\title{Written Submissions}

\description{inquiRy's main function. Gets written evidence from a UK Parliament \href{https://committees.parliament.uk/work/1813/industrial-strategy-inquiry/}{Select Committee inquiry}. Provide a unique inquiry ID, get a CSV containing written evidence and corresponding authors.}

\usage{written_submissions(n, clean = TRUE)}

\value{Returns a dataframe with 3 columns: document ID, author, and raw text. Also saves data as a CSV and optionally, removed text in a .txt file.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry ID}
\item{clean}{TRUE / FALSE (defaults to TRUE). Clean header text from evidence?}
}

\details{UK Parliament \href{URL}{Select Committees} hold inquiries into issues and Government action. Inquiries accept written evidence and hold oral evidence sessions. 

inquiRy's \code{\link{written_submissions}} function takes an inquiry's unique ID and returns a dataframe with written evidence (unique ID, author, and raw text). The function additionally exports data as a CSV file and - optionally - a .txt file with text removed by a cleaning step. 

\code{written_submissions} is inquiRy's main function and calls \code{check_input}, \code{\link{get_document_ids}}, \code{\link{get_submitters}}, \code{\link{get_documents}}, and - optionally - \code{\link{clean_evidence}}.
}

\examples{
  written_submissions(1813, clean = TRUE)
  written_submissions(1813, clean = FALSE)
  written_evidence <- written_submissions(1813)
}
