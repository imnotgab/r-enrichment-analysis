# Variant Gene Ontology (GO) Enrichment Analysis

This repository contains an R script designed to perform Gene Ontology (GO) enrichment analysis on a dataset of annotated genetic variants. The analysis focuses specifically on Biological Processes (BP) to identify functional pathways potentially impacted by the observed mutations.

## Workflow Overview
1. **Data Loading & Filtering:** * Reads raw variant annotation data.
   * Filters variants based on their functional impact (`HIGH`, `MODERATE`, `LOW`) and strictly retains those located in `protein_coding` regions.
2. **Gene Extraction:** * Extracts a clean list of unique ENSEMBL gene identifiers associated with the filtered variants.
3. **GO Enrichment Analysis:** * Utilizes `clusterProfiler` and the `org.Hs.eg.db` human annotation database to find significantly enriched biological processes (p-value cutoff = 0.05, adjusted via Benjamini-Hochberg).
   * Simplifies the initial GO terms to reduce redundancy (similarity cutoff = 0.7).
4. **Visualization & Export:** * Generates standard and simplified dotplots to show the top enriched categories.
   * Creates a concept network plot (`cnetplot`) mapping the relationships between genes and enriched GO terms.
   * Exports the simplified enrichment results to a CSV file (`results_enrichment.csv`).

## Technologies Used
* **Language:** R
* **Core Libraries:** `tidyverse`, `clusterProfiler`, `org.Hs.eg.db`, `enrichplot`, `data.table`

## Usage
Ensure that the input data file is placed in the `data/` directory (e.g., `data/input_variants.txt`) before running the script. The script will automatically filter the variants, generate the enrichment plots in your R environment, and save the final data table to your working directory.
