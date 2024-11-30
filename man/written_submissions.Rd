\name{written_submissions}

\alias{written_submissions}

\title{Written Submissions}

\description{inquiRy's main function. Gets written evidence from a UK Parliament \href{https://committees.parliament.uk/work/1813/industrial-strategy-inquiry/}{Select Committee inquiry}. Provide a unique inquiry ID, get a CSV containing written evidence and authors.}

\usage{written_submissions(n, clean = TRUE)}

\value{Returns dataframe with 3 columns: document ID, author, and raw text. Also saves data as a CSV and optionally, removed text in a .txt file.}

\arguments{
\item{n}{Integer corresponding to a Select Committee inquiry ID}
\item{clean}{TRUE / FALSE (defaults to TRUE). Clean header text from evidence?}
}

\details{The UK Parliament holds \href{https://www.instituteforgovernment.org.uk/explainer/select-committees}{Select Committee} inquiries into issues and Government action. Inquiries accept written evidence and hold oral evidence sessions.}

\examples{
  written_submissions(1813, clean = TRUE)
  written_submissions(1813, clean = FALSE)
  written_evidence <- written_submissions(1813)
}