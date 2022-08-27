[![Rspec](https://github.com/borisano/bc-mortgage-calculator/actions/workflows/rspec.yml/badge.svg)](https://github.com/borisano/bc-mortgage-calculator/actions/workflows/rspec.yml)

# Task

### Mortgage Calculator API
Using Go or Ruby on Rails, build a BC mortgage calculator API.
CMHC insurance must be considered. Guidelines for the calculation, and restrictions, can be found here:
https://www.ratehub.ca/cmhc-insurance-british-columbia.

**Input**
- property price
- down payment
- annual interest rate
- amortization period (5 year increments between 5 and 30 years)
- payment schedule (accelerated bi-weekly, bi-weekly, monthly)
  Expected Output
- payment per payment schedule
- an error if the inputs are not valid. This includes cases where the down payment is not large enough.
  **Mortgage Payment Formula**

  $M  =  P\frac{r(1+r)^{n}}{(1+r)^{n}-1}$

M = payment per payment schedule
P = principal
r = per payment schedule interest rate, calculated by dividing the annual interest rate by the number of payments per
n = total number of payments over the amortization period

### Notes
1 Testing is required and can be done using any framework of your choice.
2 For bonus points, build a user interface that communicates with the API.
