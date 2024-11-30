\name{get_submitters}

\alias{get_submitters}

\title{Get Submitters}

\description{Gets list of authors that submitted written evidence to a UK Parliament Select Committee inquiry. Called by inquiRy's main function, `get_evidence`.}

\usage{get_submitters(n)}

\value{Returns list of written evidence authors.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry's unique ID}
}

\examples{
  get_submitters(1813)
  submitters <- get_submitters(5802)
}