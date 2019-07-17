
test_that('Check available', {
    expect_named(listavailable(), c('prostate', 'gala'))
})
