library(mytestpkg)
library(tidyverse)
context("the basic text")


test_that("my function works", {
  expect_equal(class(myplot(3)),"list")
})


test_that("function_a", {
  expect_equal(function_a(5), 15)
})


test_that("function_b", {
  expect_equal(function_b(data.frame(type=c("gr", "s", "gr", "s"), finds=c(2, 6, 3, 9))), c(5, 5))
})
