<img src="vignettes/iSEE.png" align="right" alt="" width="240" />

# iUSEiSEE

The `iSEE` package is a flexible, powerful and extendible application to explore any dataset stored in a `SummarizedExperiment` object.
In turn, any dataset that can be shaped into one or more numerical matrices ("rectangular" datasets) can easily be put into a `SummarizedExperiment` object.
This includes many types of bulk, single cell and spatially resolved biological data, as well as many non-biological data types. 

`iSEE` enables a multitude of panels to gain in-depth insight in your data; it does so combining interactivity and reproducibility, and provides an ideal tool for deeper dives into your data.


## How to install

```
library("remotes")
remotes::install_github("iSEE/iUSEiSEE", 
                        dependencies = TRUE, 
                        build_vignettes = TRUE)
```

## How to run this workshop

- Open the `iUSEiSEE.Rproj` project file in RStudio
- Navigate to the `vignettes` folder
- Make sure the datasets are included in the `datasets` subfolder (if using Seurat or AnnData)
- Open the individual R Markdown files and execute their content live!

## Schedule

* Short presentation of `iSEE`
* Installation of the dependencies and tech check
* Retrieval of the data and inspection of the processing steps so far
* Overview of `iSEE`: panel by panel, learning Data + Visual + Selection parameters
* Hands-on practice using the recipes from the `iSEE` cookbook
* Extension packages from the `iSEE` universe: `iSEE` for differential expression and pathways
* Got more than just one dataset? `iSEEhub` and `iSEEindex`
* `iSEEfier`: starting things up in a breeze

## Need help?

If you encounter a problem while running `iUSEiSEE`, please open an [issue](https://github.com/iSEE/iUSEiSEE/issues) and describe the problem.
Make sure to provide a reproducible example, including your session info.

## How to contribute

If you would like to contribute to `iUSEiSEE`, you can do so by sending a pull request to this repository. 
For large changes, we encourage you to first open an issue to discuss the intended contribution.

## Code of conduct

Please note that the `iSEE` project (including `iUSEiSEE`) is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). 
By contributing to this project, you agree to abide by its terms.
