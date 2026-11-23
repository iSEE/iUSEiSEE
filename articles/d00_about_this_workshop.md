# About this workshop

![](iSEE.png)

## Description

The *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* Bioconductor
package (Rue-Albrecht et al. 2018) is a flexible, powerful and
extensible application to explore any dataset stored in a
*[SummarizedExperiment](https://bioconductor.org/packages/3.23/SummarizedExperiment)*
object, including single cell and spatially resolved data, but also bulk
data (such as transcriptomics and proteomics) and many types of
non-biological data.

*[iSEE](https://bioconductor.org/packages/3.23/iSEE)* enables a
multitude of panels to gain in-depth insight in your data; it does so
combining interactivity and reproducibility, and provides an ideal
companion to other tools for deeper dives into data.

This workshop provides an overview of the functionality of the
*[iSEE](https://bioconductor.org/packages/3.23/iSEE)* package. The
material is equally suitable for use in a “masterclass-style” workshop
as for self-study.

## Pre-requisites

Most of the examples in this workshop will center around bulk and
single-cell RNA sequencing data. For this reason, a certain background
knowledge about these types of data and the questions that are typically
addressed with them can be helpful to get the most out of the content.
More precisely, the following pre-requisities are useful:

- Familiarity with bulk or single-cell sequencing data (ideally
  scRNA-seq).
- Familiarity with the
  *[SummarizedExperiment](https://bioconductor.org/packages/3.23/SummarizedExperiment)*/*[SingleCellExperiment](https://bioconductor.org/packages/3.23/SingleCellExperiment)*
  class, or alternatively the
  *[Seurat](https://CRAN.R-project.org/package=Seurat)* or
  [*AnnData*](https://pypi.org/project/anndata/) frameworks - basically,
  any of the widely used ecosystem for working with/storing/processing
  single-cell data.
- Familiarity with single-cell data visualizations and representations.

## Participation

Participants will be encouraged to follow along in the live coding parts
of the workshop - this is very much intended as a hands-on learning
resource.

## *R* / *Bioconductor* packages used

- `iSEE`: <https://bioconductor.org/packages/iSEE>
- `iSEEu`: <https://bioconductor.org/packages/iSEEu>
- `iSEEde`: <https://bioconductor.org/packages/iSEEde>
- `iSEEpathways`: <https://bioconductor.org/packages/iSEEpathways>
- `iSEEhub`: <https://bioconductor.org/packages/iSEEhub>
- `iSEEindex`: <https://bioconductor.org/packages/iSEEindex>
- `iSEEfier`: <https://bioconductor.org/packages/iSEEfier>

## Outline of the workshop

The following material is available in the `vignettes` folder:

- [Preparation](https://iSEE.github.io/iUSEiSEE/articles/d01_preparation.md) -
  instructions for installing the required packages and downloading the
  example data.
- [Overview of
  iSEE](https://iSEE.github.io/iUSEiSEE/articles/d02_iSEE_overview.md) -
  a detailed overview of
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* and its
  functionality.
- [The iSEE
  cookbook](https://iSEE.github.io/iUSEiSEE/articles/d03_iSEE_quickrecipes.md) -
  a set of self-contained recipes with simple-to-advanced tasks one can
  complete within *[iSEE](https://bioconductor.org/packages/3.23/iSEE)*.
- [Bonus advanced content around
  iSEE](https://iSEE.github.io/iUSEiSEE/articles/d04_bonus_content.md) -
  some additional content, focused on some advanced or more specific
  tasks to carry out with
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)*.
- [Extending
  iSEE](https://iSEE.github.io/iUSEiSEE/articles/d05_extending_iSEE.md) -
  material focused on extending
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* by creating new
  panel classes.

## Workshop goals and objectives

### Learning goals

- Outline the features of
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)*, built upon the
  R/Shiny framework.
- Utilize interactive GUI components and layouts to efficiently extract
  information from biological data sets.
- Describe how to construct interactive apps and custom panels.
- Demonstrate how *[iSEE](https://bioconductor.org/packages/3.23/iSEE)*
  and related packages can smoothly be integrated into and enhance
  existing workflows for the datasets at hand.

### Learning objectives

- Set up a local environment for running
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* apps.
- Interact with components of the
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* user interface
  to visually inspect and discuss various datasets.
- Identify and locate configurable aspects of
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* apps.
- Practice interactive visualization over a single-cell RNA-sequencing
  workflow.
- Imagine use cases and future developments for interactive
  visualization as part of computational workflows.
- Design and create
  *[iSEE](https://bioconductor.org/packages/3.23/iSEE)* instances for
  collections of datasets.

## Additional resources

A lot of materials have been developed, from the first use of
*[iSEE](https://bioconductor.org/packages/3.23/iSEE)* to contributions
of new panel classes in separate downstream packages.

- The iSEE website: <https://isee.github.io/>
- Publication (F1000Research, 2018):
  <https://f1000research.com/articles/7-741/v1>
- Bioconductor landing page: <https://bioconductor.org/packages/iSEE/>
- Development version (bug reports etc): <https://github.com/iSEE/iSEE>
- Material from previous workshops:
  <https://isee.github.io/resources.html#workshops>
- Deployed examples: <https://isee.github.io/apps.html>,
  <https://github.com/iSEE/iSEE_instances>
- Custom panel examples: <https://github.com/iSEE/iSEE_custom>
- The bookdown book on *Extending iSEE*:
  <https://isee.github.io/iSEE-book/>

## References

Rue-Albrecht, Kevin, Federico Marini, Charlotte Soneson, and Aaron T L
Lun. 2018. “iSEE: Interactive SummarizedExperiment Explorer.”
*F1000Res.* 7: 741.
