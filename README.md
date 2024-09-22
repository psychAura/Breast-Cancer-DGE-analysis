
DGE analysis to identify cytotoxicity of genes -'BRCA1', 'BRCA2', 'TP53', 'ALK', 'MYCN' from 30 pairs of normal and breast tumor tissues.


Dependencies(Packages)
 library(tidyverse)
 library(ggplot)
 library(GEOquery)
 library(dplyr)
 ...

Specimen
Homo sapiens

Expression profiling by high throughput sequencing

Summary	
Breast cancer is one of the deadly tumors in women, and its incidence continues to increase. This study aimed to identify novel therapeutic molecules using RNA sequencing (RNAseq) data of breast cancer from our hospitals.
 	
Overall design	
30 pairs of normal and cancerous tissues from the same excision were collected from the Affiliated Cancer Hospital of Guangzhou Medical University, the Affiliated Cancer Hospital of Sun Yat-sen University and Guangzhou Army General Hospital. RNA sequencing was performed by Guangzhou Huayin Health medical Group. Original reads of RNA sequencing data were normalized as FPKM data.

Data Manipulation, preprocessing and visualization
-Raw Data normalized using FPKM method
-Counts Matrix spliced and joined with specific columns from metadata file using GEOquery
-Counts cleaned and visualized across different plot diagrams

Quality control
....
