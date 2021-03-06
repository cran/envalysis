#' @title Miscellaneous Functions for Environmental Analyses
#'
#' @description
#' Small toolbox for data analyses in environmental chemistry and
#' ecotoxicology. Provides, for example, \code{\link{calibration}()} to
#' calculate calibration curves and corresponding limits of detection (LODs) and
#' limits of quantification (LOQs) according to German DIN 32645 (2008).
#' \code{\link{texture}()} makes it easy to estimate soil particle size
#' distributions from hydrometer measurements (ASTM D422-63, 2007).
#' 
#' @details
#' \tabular{ll}{
#' Version: \tab 0.5.1\cr
#' Licence: \tab GPL (>= 3)\cr
#' }
#'
#' @author
#' Zacharias Steinmetz (\email{steinmetz-z@@uni-landau.de}),
#' Julius Albert (\email{albert.j@@uni-landau.de}),
#' Kilian Kenngott (\email{kenngott@@uni-landau.de})
#' 
#' @references
#' Almeida, A. M. D., Castel-Branco, M. M., & Falcao, A. C. (2002). Linear
#' regression for calibration lines revisited: weighting schemes for
#' bioanalytical methods. \emph{Journal of Chromatography B}, \bold{774}(2),
#' 215-222. \doi{10.1016/S1570-0232(02)00244-1}.
#' 
#' ASTM D422-63 (2007). \emph{Standard Test Method for Particle-Size Analysis
#' of Soils}. Technical standard. ASTM International, West Conshohocken, PA.
#' Available from \url{http://www.astm.org/Standards/D422.htm}
#' 
#' Borcard D, Gillet F, & Legendre P. (2011). \emph{Numerical ecology with R}.
#' Springer, New York.
#'
#' @docType package
#' @name envalysis
NULL
