
test_that('Check available', {
    expect_named(listavailable(), c('key', 'val', 'key', 'val'))
})
