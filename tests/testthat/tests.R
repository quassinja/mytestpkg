library(mytestpkg)
context("the basic text")


test_that("my function works", {
  expect_equal(class(myplot(3)),"list")
})
