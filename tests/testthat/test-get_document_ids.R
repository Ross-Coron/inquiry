source("../../R/get_document_ids.R")

test_that("`get_document_ids` raises error if inquiry doesn't exist", {
  expect_error(get_document_ids("foo"))
})

test_that("`get_document_ids` handles correct input", {
  expect_no_error(get_document_ids(1006))
  expect_type(get_document_ids(1813), "list")
})

test_that("`get_document_ids` returns list of evidence for valid inquiry", {
  expect_type(get_document_ids(1813), "list")
})
 