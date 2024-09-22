
#install package GEOquery
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("GEOquery")

#script to manipulate gene expression data using dplyr
#setwd("C:/Users/Kausara/Desktop/GE")

#load libraries
library(dplyr)
library(tidyverse)
library(GEOquery)

##read the data
dat <- read.csv(file = "C:/Users/Kausara/Desktop/GE/data/GSE183947_fpkm.csv")

# get metadata
gse <- getGEO(GEO = 'GSE183947', GSEMatrix = TRUE)

metadata <- pData(phenoData(gse[[1]]))
head(metadata)

#select columns of interest and modify to look clean
metadata.modified <- metadata %>%
  select(1,10,11,17) %>%
  rename(tissue = characteristics_ch1) %>%
  rename(metastasis= characteristics_ch1.1) %>%
  mutate(tissue = gsub("tissue: ", "", tissue)) %>%
  mutate(metastasis = gsub("metastasis: ", "", metastasis)) 

head(dat)

#resaping data

dat.new <- dat %>%
  rename(gene = X) %>%
  gather(key = 'samples', value = 'FPKM', -gene)

#join dataframes = dat.long to metadata.modified

 dat.new <- dat.new %>%
  left_join(., metadata.modified, by = c('samples' = 'description')) 

#explore data
 dat.new %>%
   filter(gene == 'BRCA1' | gene == 'BRCA2')%>%
   group_by(gene, tissue) %>%
   summarize(mean_FPKM = mean(FPKM),
             mmedian_FPKM = median(FPKM))%>%
   arrange(mean_FPKM)
