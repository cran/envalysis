## ----setup, include=FALSE, echo=FALSE-----------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE, 
  message = FALSE,
  comment = "# >"
)

## ----packages-----------------------------------------------------------------
library(envalysis)
library(ggplot2)

## ----default_theme, fig.align="center"----------------------------------------
data("mtcars")

p <- ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg, color = factor(gear))) +
  labs(
    title = "Fuel economy declines as weight increases",
    subtitle = "(1973-74)",
    caption = "Data from the 1974 Motor Trend US magazine.",
    x = "Weight (1000 lbs)",
    y = "Fuel economy (mpg)",
    colour = "Gears"
  ) +
  facet_wrap( ~ am, labeller = labeller(am = c("0" = "Automatic",
                                               "1" = "Manual")))
p

## ----theme_publish, fig.align="center"----------------------------------------
p + theme_publish()

## ----theme_arguments, fig.align="center"--------------------------------------
p + theme_publish(base_size = 16, base_family = "Times", base_linewidth = 0.7)

