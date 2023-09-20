## ----setup, include=FALSE, echo=FALSE-----------------------------------------
knitr::opts_chunk$set(
  echo = TRUE,
  warning = FALSE, 
  message = FALSE,
  comment = "# >"
)

data.table::setDTthreads(2)

## ----packages-----------------------------------------------------------------
library(envalysis)
library(data.table)
library(ggplot2)

## ---- echo=F------------------------------------------------------------------
knitr::kable(phenolics$seq[c(1:4,73:74,76,78,80,83:84),], "simple",
             row.names = F)

## ---- echo=F------------------------------------------------------------------
knitr::kable(phenolics$samples[c(1:2,4,41:42),], "simple",
             row.names = F)

## ----data---------------------------------------------------------------------
data("phenolics")
str(phenolics)

## ----simple_calibration, fig.align="center"-----------------------------------
tyrosol_1 <- subset(phenolics$seq, Compound == "Tyrosol" & Batch == 1)

cal_1 <- calibration(Area ~ `Spec Conc`,
                     data = subset(tyrosol_1, Type == "Standard"))

print(cal_1)
plot(cal_1)

## ----simple_inv_predict-------------------------------------------------------
tyrosol_1$`Calc Conc` <- inv_predict(cal_1, tyrosol_1$Area, below_lod = 0)
head(tyrosol_1)

## ----data.table---------------------------------------------------------------
dt <- lapply(phenolics, as.data.table)

## ----calibration--------------------------------------------------------------
dt$seq[, `Calc Conc` := calibration(Area ~ `Spec Conc`, .SD[Type == "Standard"]) |> 
         inv_predict(Area, below_lod = 0),
       by = .(Compound, Batch)]
head(dt$seq)

## ----parameters---------------------------------------------------------------
dt$cal <- dt$seq[Type == "Standard", calibration(Area ~ `Spec Conc`) |> 
                   as.list(c("coef", "adj.r.squared", "lod", "loq")),
                 by = .(Compound, Batch)]
print(dt$cal)

## ----blank_subtr--------------------------------------------------------------
dt$seq[, `Clean Conc` := `Calc Conc` - mean(
  `Calc Conc`[Type == "Extraction blank"], na.rm = T),
  by = .(Batch, Compound)]

## ----merging------------------------------------------------------------------
dt$res <- merge(dt$seq, dt$samples, by = "Name")

dt$res[, Content := `Clean Conc` * (Extract / Weight) * Dilution]
head(dt$res)

## ----plotting, fig.align="center", fig.height=3.5-----------------------------
dt$sum <- dt$res[, .(Content = mean(Content, na.rm = T),
                     CI = CI(Content, na.rm = T)),
                 by = .(Compound, Treatment, Day)]

ggplot(dt$sum, aes(x = Day, y = Content)) +
  geom_errorbar(aes(ymin = Content - CI, ymax = Content + CI, group = Treatment),
                width = 1, position = position_dodge(1)) +
  geom_point(aes(shape = Treatment, fill = Treatment),
             position = position_dodge(1)) +
  xlab("Day of incubation") +
  ylab(expression("Phenolic content"~"["*mg~kg^-1*"]")) +
  facet_wrap(~ Compound, ncol = 2, scales = "free") +
  scale_shape_manual(values = c(21,24)) +
  scale_fill_manual(values = c("black", "white")) +
  theme_publish()

