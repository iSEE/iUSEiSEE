<img src="vignettes/iSEE.png" align="right" alt="" width="240" />

# iUSEiSEE

The `iSEE` package is a flexible, powerful and extendible application to explore any dataset stored in SummarizedExperiment objects, including single cell and spatially resolved data. 

`iSEE` enables a multitude of panels to gain in-depth insight in your data; it does so combining interactivity and reproducibility, and providing an ideal companion to CELLxGENE for deeper dives into data.


## How to install

```
library("remotes")
remotes::install_github("imbeimainz/iUSEiSEE", 
                        dependencies = TRUE, 
                        build_vignettes = TRUE)
```

## How to run this workshop

- Open the `iUSEiSEE.Rproj` project file
- Navigate to the `vignettes` folder
- Make sure the datasets are included in the `datasets` subfolder (if using Seurat or AnnData)
- Open the individual Rmarkdown files and execute their content live!

## Schedule

* Short presentation, `iSEE`: Harry met Sally for interactive and reproducible data exploration
* Installation of the dependencies & tech check
* Retrieval of the data + Inspecting the processing steps so far
* Overview on iSEE: panel by panel, learning Data + Visual + Selection parameters
* Hands on with the full workshop
* Going through the iSEE cookbook: "What if all I need is some recipes?"
* Latest developments in the iSEE universe: iSEE for DE and pathways
* Got more than just one dataset? iSEEhub and iSEEindex
* iSEEfier: starting things up in a breeze
* Got some own data? Some space for additional questions and setting up iSEE on that
