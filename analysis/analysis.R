library(tidyverse)
library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(ggplot2)
library(ggupset)
library(pheatmap)
library(data.table)

data <- fread("data/input_variants.txt", skip = "#", quote = "")

filtered_variants <- data %>%
  filter(IMPACT %in% c("HIGH", "MODERATE", "LOW")) %>%
  filter(BIOTYPE == "protein_coding")

gene_list <- unique(filtered_variants$Gene)

gene_list <- gene_list[gene_list != "" & gene_list != "." & !is.na(gene_list)]

go_results <- enrichGO(gene = gene_list,
                       OrgDb = org.Hs.eg.db,
                       keyType = "ENSEMBL",
                       ont = "BP",
                       pAdjustMethod = "BH",
                       pvalueCutoff = 0.05,
                       readable = TRUE)

dotplot(go_results, showCategory = 20)

go_results_simplified <- simplify(go_results, cutoff = 0.7, by = "p.adjust", select_fun = min)

dotplot(go_results_simplified, showCategory = 15)

cnetplot(go_results_simplified, showCategory = 5)

write.csv(as.data.frame(go_results_simplified), "results_enrichment.csv", row.names = FALSE)
