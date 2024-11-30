# inquiRy

*Work in progress. Implementing as part of [CS50's Programming with R](https://cs50.harvard.edu/r/2024/).*

## Summary

inquiRy is an R package to extract written evidence from [UK Parliament Select Committee inquiries](https://www.parliament.uk/about/how/committees/select/). 

## Guide

1. Load `main.R` into RStudio
2. Call `written_submissions(n, clean = TRUE)`
	* Replace `n` with a Select Committee inquiry's unique ID (to find this, go to an inquiry's landing page and take the four digit number from the URL e.g. [1813](committees.parliament.uk/work/1813/industrial-strategy-inquiry/).
	* If `clean` is set to true (or not specified), redundant text will be removed from the start of written evidence.
3. A CSV file is saved to `cwd`.
	*	Each row corresponds to an individual piece of written evidence submitted to the inquiry
	*	Each row has three fields: a unique ID, an author(s), and raw evidence text.
4. To view / manipulate the resulting data in RStudio, asign `written_submissions`'s return value to a variable e.g., `data <- written_submissions(1813, clean = TRUE)`.

## How it Works

inquiRy is a package written in R. inquiRy contains six functions:
1. `written_submissions` (main function (calls other functions); stored in `main.R`)
2. `check_input`
3. `get_document_ids`
4. `get_submitters`
5. `get_documents`
6. `clean_evidence`

inquiRy requires six external packages:
1. glue
2. httr
3. xml2
4. jsonlite
5. base64enc
6. dplyr

inquiRy uses Parliament's [Select Committee API](https://committees-api.parliament.uk/index.html). Functions generally retrieve data as JSON via `GET` requests.

## Select Committees?

==TODO==

## About Me

Hello, World - I'm Ross Coron!

I'm a Senior Analyst at the UK's National Audit Office. My previous policy positions include the House of Lords (UK Parliament), the Department of Health and Social Care, and Blood Cancer UK. 

Prior to hanging around Whitehall, I was a biochemist at Imperial College London, Institut Pasteur (Paris), and the University of St Andrews.

I'm interested in all-things policy, programming, pipetting. Let's connect!
-   LinkedIn -  [LINK](https://www.linkedin.com/in/ross-coron/)
-   Twitter -  [LINK](https://twitter.com/Ross_Coron)
-   GitHub -  [LINK](https://github.com/Ross-Coron)

---