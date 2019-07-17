
test_that('Check listavailable', {
  expect_named(listavailable(), c('prostate', 'gala'))
})

test_that('Check getmodel', {
  expect_named(getmodel('prostate'), c('fit', 'data'))
})


test_that('Check modeldesc', {  expect_is(modeldesc('prostate'),'list')     })