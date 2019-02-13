library(MASS)
library(GetoptLong)

rho <- -0.6
mu1 <- 1; s1 <- 2
mu2 <- 1; s2 <- 8

data <- mvrnorm(1e6, mu = c(mu1,mu2), Sigma = matrix(c(s1^2, s1*s2*rho, s1*s2*rho, s2^2), 2) )
f <- lm(formula = data[,2] ~ data[,1])

print(qq("predicted: (a, b) = (@{mu2 - rho*s2*mu1/s1}, @{rho*s2/s1})"))
print(qq("computed: (a, b) = (@{f$coefficients[1]}, @{f$coefficients[2]})"))