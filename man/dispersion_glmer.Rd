\name{dispersion_glmer}
\alias{dispersion_glmer}

\title{
Measures dispersion in a glmer-model
}
\description{
Computes the estimated scale in a binomial (and Poisson) mixed model
}
\usage{
dispersion_glmer(modelglmer)
}

\arguments{
  \item{modelglmer}{
a model that has been fitted by glmer
}
}
\value{
the scale parameter, according to recommendations by D. Bates, 
if the scale paramter is between 0.75 and 1.4, there may not be an overdispersion
problem.

Such one number diagnostics should not be used as the only decision criterion. 
It can indicate overdispersion, but if it does not, it does not mean that the 
model fits the data well. Thorough residual analyses or posterior predictive model
checking is still needed!
}
\references{
This function has been posted on the R-helplist. It seems to have been written or 
motivated by D. Bates. 
Here is the URL, where we downloaded the function:
https://stat.ethz.ch/pipermail/r-sig-mixed-models/2011q1/015392.html
}
\author{
she or he is unfortunately unknown to us
}

\examples{
\dontrun{
data(swallowfarms)
dat <- swallowfarms
dat$colsize.z <- scale(dat$colsize)   # scaled values for better model convergence
dat$dung.z    <- scale(dat$dung)
dat$die <- dat$clutch - dat$fledge
mod <- glmer(cbind(fledge,die) ~ colsize.z + cow + dung.z + (1|farm) , data=dat, family="binomial")
dispersion_glmer(mod)
}
}

\keyword{misc}
\keyword{model checking}
