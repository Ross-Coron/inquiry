source("../../R/clean_evidence.R")

test_that("`clean_evidence` creates .txt file with removed content", {
  load("evidence_text.RData")
  clean_evidence(evidence_text)
  expect_true(file.exists("removed_text.txt"))
})

test_that("`clean_evidence` raises warning when no regex pattern found", {
  load("evidence_text2.RData")
  expect_warning(clean_evidence(evidence_text))
})
