\name{get_document_ids}

\alias{get_document_ids}

\title{Get Document IDs}

\description{Gets list of IDs corresponding to evidence submitted to a UK Parliament Select Committee inquiry. Called by inquiRy's main function, `get_evidence`.}

\usage{get_document_ids(n)}

\value{Returns list of unique document IDs.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry ID}
}

\examples{
  get_document_ids(1813)
  document_ids <- get_document_ids(5802)
}