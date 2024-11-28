\name{inquiry}

\alias{inquiry}

\title{InquiRy}

\description{Gets written evidence from \href{https://committees.parliament.uk/work/1813/industrial-strategy-inquiry/}{UK Parliament Select Committee inquiries}.}

\usage{inquiry(n, clean = TRUE)}

\value{Dataframe with 3 columns: document IDs, their authors, and raw text. Also saves data as a CSV and optionally, removed text in a .txt file.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry}
\item{clean}{TRUE / FALSE (defaults to TRUE). Clean header text from evidence?}
}

\details{The UK Parliament holds \href{https://www.instituteforgovernment.org.uk/explainer/select-committees}{Select Committee} inquiries into issues and Government action. Inquiries accept written evidence and hold oral evidence sessions.}

\examples{
  speakr(1813, clean = TRUE)
  speakr(1813, clean = FALSE)
  written_evidence <- (1813)
}