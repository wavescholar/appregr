
test_that('Check available', {
    expect_named(listavailable(), c('key', 'val', 'key', 'val'))
})


test_that('Check model retrieval',{
  expect_length(getmodel('prostate'),2)
})