library(TCGAbiolinks)
library(SummarizedExperiment)
library(maftools)
library(dplyr)
library(DT)

maf <- chol_maf

datatable(getSampleSummary(maf),
  filter = "top",
  options = list(scrollX = TRUE, keys = TRUE, pageLength = 5),
  rownames = FALSE
)
plotmafSummary(maf = maf, rmOutlier = TRUE, addStat = "median", dashboard = TRUE)
