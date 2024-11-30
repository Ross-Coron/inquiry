\name{get_documents}

\alias{get_documents}

\title{Get Documents}

\description{Gets raw text from written evidence submitted to a UK Parliament Select Committee inquiry.}

\usage{get_documents(v)}

\value{Returns dataframe with 2 columns: unique document ID and corresponding raw text.}

\arguments{
\item{v}{Vector of document IDs for a given Select Committee inquiry}
}

\details{Typically called by inquiry's main function, \code{\link{written_submissions}}. For each document, extracts a unique ID value and raw text. Data can be cleaned by inquiry's \code{\link{clean_evidence}} function. Function utilises \link[https://committees-api.parliament.uk/index.html]{Parliament's Select Committee API}. Function reads JSON, decodes base-64 data, and extracts text via the base \code{\link{rawToChar}} function.}

\examples{
  get_documents(document_ids)
  get_documents(c(72758, 76311, 74791))
  evidence <- get_documents(document_ids)
}