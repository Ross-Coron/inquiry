\name{get_document_ids}

\alias{get_document_ids}

\title{Get Document IDs}

\description{Gets list of IDs corresponding to written evidence submitted to a UK Parliament Select Committee inquiry. Called by inquiRy's main function, \code{\link{written_submissions}}.}

\usage{get_document_ids(n)}

\value{Returns list of unique document IDs.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry's unique ID}
}

\examples{
  get_document_ids(1813)
  document_ids <- get_document_ids(5802)
}