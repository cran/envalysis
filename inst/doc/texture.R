## ----setup, include=FALSE, echo=FALSE-----------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE, 
  message = FALSE,
  comment = "# >"
)

## ----texture, fig.align="center"----------------------------------------------
library(envalysis)

data(clayloam)
print(clayloam)

tex <- texture(reading ~ blank + time + temperature, data = clayloam)

print(tex)
plot(tex)

## ----soiltexture_package------------------------------------------------------
library(soiltexture)

## ----soiltexture_convert------------------------------------------------------
germansoil <- as_tridata(tex, which = "din")
ussoil <- as_tridata(tex, which = "usda")

## ----soiltexture_classify-----------------------------------------------------
TT.points.in.classes(germansoil, class.sys = "DE.BK94.TT")
TT.points.in.classes(ussoil, class.sys = "USDA.TT")

## ----soiltexture_plot, echo = -1, fig.align="center"--------------------------
par(cex = 0.75, cex.lab = 0.5, cex.axis = 0.5, cex.main = 1)
TT.plot(class.sys = "DE.BK94.TT", tri.data = germansoil)

