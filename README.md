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

* Start with a rendered presentation on iSEE
* Install & tech check
* Retrieve the data & process that
* Overview on iSEE
* Hands on with the full workshop
* "what if all I need is some recipes"
* Display some of the more recent things - DE and pathways?
* Hub and Index: got more than just one?
* iSEEfier: starting things up in a breeze
* some space for working on own data?
