install.packages(c("tidyverse", "pheatmap"))
library(tidyverse,pheatmap)
bioinformData <- read_csv("C:/Users/telagib/OneDrive - The University of Melbourne/Attachments/Statistics_Rstudio/Bioinformatics/GSE60450_GeneLevel_Normalized(CPM.and.TMM)_data.csv")
nrow(bioinformData)
ncol(bioinformData)

# Box plot graph
longDataBio <- bioinformData %>%
  pivot_longer(cols = starts_with("GSM"), 
               names_to = "Sample", 
               values_to = "Expression")

# Boxplot
ggplot(longDataBio, aes(x = Sample, y = Expression)) +
  geom_boxplot(fill = "lightblue") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Gene Expression Distribution Across Samples",
       x = "Sample",
       y = "Expression (CPM/TMM)")
