# Deploying iSEE

![](iSEE.png)

## Introduction

In this vignette, we illustrate how to deploy an instance of iSEE,
dedicated to a dataset you want to display and explore with it.\
This will assume you have some familiarity with

- the dataset you want to display with iSEE
- the iSEE app, itself
- the deployment of Shiny apps, either on a Shiny Server/Posit Connect
  instance, or on <https://www.shinyapps.io/>

## Additional requirements

On top of your dataset, you will need one of the following platforms for
deploying your instance into the web: a Shiny Server, Posit Connect, or
shinyapps.io

### Setting up a Shiny Server

A Shiny Server (<https://posit.co/download/shiny-server/>) is a free
solution to host any of your apps online.

To set up Shiny Server on your premises, you can refer to
<https://docs.posit.co/shiny-server/>. If you are already familiar with
it, and have a Shiny Server installed and running, you can consider
jumping directly to <https://docs.posit.co/shiny-server/#quick-start>
for a full dive in.

Since this might be an easy and free option, we will cover this in the
remainder of this document.

If you have root access to the Shiny Server, it might be quite
straightforward to install any required dependencies, be those Unix
packages or R/Bioconductor packages. Keep in mind that the Shiny Server
has to run on a Linux system, and a common distribution for that would
be Ubuntu.

In the simplest case, you can login to your Shiny Server and run the
following commands to make sure you are all set.

``` bash
# login via ssh
ssh username@server

# start R
R
```

Within the R console

\
`# install Bioconductor`\
[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"BiocManager"``)`\
\
`# install iSEE and its dependencies`\
`BiocManager``::`[`install`](https://bioconductor.github.io/BiocManager/reference/install.html)`(``"iSEE"``)`\
`# install also its suggested packages with...`\
`BiocManager``::`[`install`](https://bioconductor.github.io/BiocManager/reference/install.html)`(``"iSEE"``, dependencies ``=``TRUE``)`\
\
`# load the iSEE package`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`"iSEE"`](https://isee.github.io/iSEE/)`)`\
`# run the app without any dataset pre-loaded`\
[`iSEE`](https://isee.github.io/iSEE/reference/iSEE.html)`(``)`\
`# keep in mind that the server might be a headless one, so it can be that no app `\
`# is showing up as you commonly expect when you run this locally`

### Using Posit Connect

If your group/your institute/your company has access to an instance of
Posit Connect, it might be even easier to deploy your applications.

Posit Connect is an enterprise-level product, available at
<https://posit.co/products/enterprise/connect/>. A very comprehensive
user guide is available at <https://docs.posit.co/connect/user/>.

If you use Posit Connect, you can still re-apply some of the content
explained below for the deployment of your data with iSEE.

### Using shinyapps.io

Shinyapps.io is another service offered by Posit to share your Shiny
applications online. A free tier is available for all, yet this might
clash a bit with the specific requirements that serving a complex,
fairly large dataset within iSEE entails - not because of iSEE, but
rather for the fact that the dataset itself can be large/require more
memory than what the free tier might offer.

Similarly to Posit Connect, some concepts of the deployment are in
common, and you might learn the essential ones to deploy your data
within shinyapps.io.

## Deploying an exemplary instance of iSEE on any dataset

In this section, you will learn the necessary steps to get your data
onto the server and deploy an app that explores it.

Some preliminary operations we will need to do include:

- creating the folder and the app script to run your iSEE instance
- setting up the Shiny Server to know that a new app is ready to be
  displayed
- checking the logs to monitor the app behavior

Assuming you are already logged in into the Shiny Server, we will try to
deploy a `my_iSEE` app by typing while in the root folder:

``` bash
# navigate to...
cd /srv/shiny-server
# create a new folder named my_iSEE
mkdir my_iSEE  
# this will be the folder where to put the app.R file, which you can create with any editor
touch my_iSEE/app.R
```

We will fill in the content of the `app.R` file as we go.

### Got data?

First things first - you’ll need some data. iSEE will simply require
*any* SummarizedExperiment or SingleCellExperiment (or any of its
derivate classes).

You will need essentially any command that gives you the `my_sce` object
that you will need.

\
[`library`](https://rdrr.io/r/base/library.html)`(`[`"SummarizedExperiment"`](https://bioconductor.org/packages/SummarizedExperiment)`)`\
[`library`](https://rdrr.io/r/base/library.html)`(``"SingleCellExperiment"``)`\
[`library`](https://rdrr.io/r/base/library.html)`(`[`"iSEE"`](https://isee.github.io/iSEE/)`)`\
\
`# if using an RDS file`\
`my_sce`` ``<-`` `[`readRDS`](https://rdrr.io/r/base/readRDS.html)`(``"path/to/that/sce.RDS"``)`\
\
`# if using an h5ad file`\
`my_sce`` ``<-`` ``zellkonverter``::`[`readH5AD`](https://rdrr.io/pkg/zellkonverter/man/readH5AD.html)`(``"path/to/data.h5ad"``)`\
\
`# if serving an example dataset, this can also come from a function call, e.g.`\
`my_sce`` ``<-`` ``scRNAseq``::``ReprocessedAllenData``(``)`

Keep in mind that the lines to load the data will become an essential
part of the `app.R` file. We will copy its content into it, once we
assemble the final version of the file on the Shiny Server.

### Setting up iSEE for that dataset

This is the part that you can take care of on any machine, and possibly
your laptop is the best setting to launch iSEE and configure it as you
wish, with the panels you desire, with the preset values for any of the
Data/Visual/Selection parameters.

This can boil down to…

\
`# as a starter...`\
[`iSEE`](https://isee.github.io/iSEE/reference/iSEE.html)`(``my_sce``)`` `

After navigating and changing configurations, do store the code to
create the `initial` list-like object to start iSEE just the way you
want it to look like. This can be done as described in the dedicated
section of the [overview
vignette](https://iSEE.github.io/iUSEiSEE/articles/d02_iSEE_overview.html#display-panel-settings)
by clicking on the Export -\> Display panel settings button.\
Once you have the code to create that `initial` configuration, you can
test it by running

\
[`iSEE`](https://isee.github.io/iSEE/reference/iSEE.html)`(``my_sce``, initial ``=`` ``initial``)`

This should give you the app in the exact status you wanted to start
from.

Do not forget to store the code to create *exactly* that `initial`
object, and put that into the `app.R` file we are assembling.

### Enhancing the experience of users with a tour

An excellent way to guide viewers and users of the app is via a tour.
See more in the dedicated section of the [overview
vignette](https://iSEE.github.io/iUSEiSEE/articles/d02_iSEE_overview.html#quick-tour).

Typically, a tour can be saved as a `data.frame` object, that is created
via a simple tabular text file, which contains at least two columns -
`element` and `intro`, as expected by the `rintrojs` package. See more
about this by checking the main help topic of the iSEE function, via
[`?iSEE`](https://isee.github.io/iSEE/reference/iSEE.html).

Once the tour is prepared, you can read it in and run the app with this
command:

\
`my_tour`` ``<-`` `[`read.delim`](https://rdrr.io/r/utils/read.table.html)`(``"path/to/tsvfile.txt"``)`\
[`iSEE`](https://isee.github.io/iSEE/reference/iSEE.html)`(``my_sce``, initial ``=`` ``initial``, tour ``=`` ``my_tour``)`

We are all set! The next step will bring all these ingredients onto the
Shiny Server.

### Transferring data and code to run the iSEE instance

This step normally can be executed using the `scp` command.

We will copy, one after the other, the dataset object, the `app.R`, and
optionally the `tsvfile.txt` for the tour.

``` bash
# from your laptop, where all these files are
scp sce.RDS app.R tsvfile.txt username@server:/srv/shiny-server/my_iSEE
```

As of now, this is more or less how your `app.R` could look like, in a
very simplified form:

    library("iSEE")

    my_sce <- readRDS("path/to/that/sce.RDS")

    initial <- list(
      ReducedDimensionPlot(),
      FeatureAssayPlot(),
      RowDataTable()
    )

    my_tour <- read.delim("path/to/tsvfile.txt")

    iSEE(my_sce, initial = initial, tour = my_tour)

Keep in mind you can still refine and edit this file once it is on the
Shiny Server, by simply using any text editor (vi, emacs, gedit, …).

Your directory structure should look like this:

    root@shiny:/srv/shiny-server# tree my_iSEE/
    my_iSEE/
    └── app.R
    └── sce.RDS
    └── tsvfile.txt

Time to tell now the Shiny Server that a new app is ready to be served!
You will need to edit the `/etc/shiny-server/shiny-server.conf` file and
add these lines within the `server {}` settings:

    server{
      # ...
      # whatever other content you had in this file
      # ...
      location /my_iSEE {
        app_dir /srv/shiny-server/my_iSEE;
        log_dir /var/log/shiny-server/my_iSEE;
        directory_index off;
        app_init_timeout 250;
      }
      # ...
    }

Specifically, this will also tell us where the log files will be stored.
They can be easily inspected as the app is running by using the `tail`
command.

``` bash
tail -f /var/log/shiny-server/my_iSEE-shiny-[date_time].log
```

Once you are done with this, you can restart the Shiny Server (not
strictly necessary, but suggested to make sure all apps are ready to be
served) with this command

``` bash
systemctl restart shiny-server.service 
```

### Start spreading the news

If all went fine, you will be able to see your app served onto your
Shiny Server at the address `[your server address]/my_iSEE`.

Congratulations! Time to proudly spread the news about that precious
URL.\
Or well, if you have some further ideas on how the deployed app should
look like, just play around with it, store the code to obtain the
updated `initial` configuration, edit the content of the tour, or a mix
of these things.

### Providing information in your manuscript

If you wanted to make your dataset available not just on the classical
repositories such as GEO, but rather really ready-to-explore for the
readers of your manuscript, well done thought!

You can consider adding/updating the “Data Availability” section of your
manuscript by putting a sentence on the line of

> We provide the annotated single-cell RNA-seq datasets via an
> interactive application, built with the iSEE package and available at
> <http://shiny.imbei.uni-mainz.de:3838/iSEE_KDM6B_inhibition>.

This example is taken by a recent preprint where the authors have
provided their datasets exactly in this manner. You can also consider
citing iSEE in the main text - the info you will need is easy to be
found.

\
[`citation`](https://rdrr.io/r/utils/citation.html)`(``"iSEE"``)`\
`#> To cite package 'iSEE' in publications use:`\
`#> `\
`#>   Rue-Albrecht K, Marini F, Soneson C, Lun ATL (2018). "iSEE:`\
`#>   Interactive SummarizedExperiment Explorer." _F1000Research_, *7*,`\
`#>   741. doi:10.12688/f1000research.14966.1`\
`#>   <https://doi.org/10.12688/f1000research.14966.1>.`\
`#> `\
`#> A BibTeX entry for LaTeX users is`\
`#> `\
`#>   @Article{,`\
`#>     title = {iSEE: Interactive SummarizedExperiment Explorer},`\
`#>     author = {Kevin Rue-Albrecht and Federico Marini and Charlotte Soneson and Aaron T. L. Lun},`\
`#>     publisher = {F1000 Research, Ltd.},`\
`#>     journal = {F1000Research},`\
`#>     year = {2018},`\
`#>     month = {Jun},`\
`#>     volume = {7},`\
`#>     pages = {741},`\
`#>     doi = {10.12688/f1000research.14966.1},`\
`#>   }`

## Deploying a collection of datasets via iSEEindex

The concept of serving one dataset is at the core of the iSEE
application.

In some recent developments, we have created the `iSEEindex` package,
that extends this idea to an entire **collection** of datasets. This
leverages the possibility, within iSEE, to have a custom “landing
page” - iSEEindex takes this to the next level, without too much
additional overhead.

To get familiar with how `ìSEEindex` works, we refer you to the
documentation and vignettes of the package itself, accessible at
<https://bioconductor.org/packages/iSEEindex/>.

Adding up the concepts we have learned in this vignette to the info on
how iSEEindex works, this can be translated into a couple of simple
operations:

- Data: You will need to transfer not just one file but all the files,
  possibly one for each dataset you want to serve

- `initial` configurations: Again, ideally one per dataset. You might
  need a small script that specifically creates that object

- Tour: Again, one tour per dataset. Ideal to guide readers through the
  many facets of a dataset - consider that your live, breathing version
  of the figure legend!

A very good example of how to set up all this into one well-crafted file
is the yaml example provided within the iSEEindex package, available at
<https://github.com/iSEE/iSEEindex/blob/devel/inst/example.yaml>.

If you would like to see how one such instance can look like, you can
see the IFNresource in action at
<https://rehwinkellab.shinyapps.io/ifnresource/> (Rigby et al. 2023).

## Looking for some inspiration?

The apps gallery on the iSEE website
(<https://isee.github.io/apps.html>) is the place to watch for seeing
some apps deployed in the wild.

If you want to see the code underlying some of such instances - and
more - you can check out the <https://github.com/iSEE/iSEE_instances/>
Github repository.

Feel free to reach out (e.g. via email at <marinif@uni-mainz.de>) if you
need some assistance in this process, or would like your data to be
hosted upon our premises at the IMBEI.

## Session info

**Session info**

\
[`sessionInfo`](https://rdrr.io/r/utils/sessionInfo.html)`(``)`\
`#> R version 4.6.1 (2026-06-24)`\
`#> Platform: x86_64-pc-linux-gnu`\
`#> Running under: Ubuntu 24.04.5 LTS`\
`#> `\
`#> Matrix products: default`\
`#> BLAS:   /usr/lib/x86_64-linux-gnu/openblas-pthread/libblas.so.3 `\
`#> LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.26.so;  LAPACK version 3.12.0`\
`#> `\
`#> locale:`\
`#>  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              `\
`#>  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    `\
`#>  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   `\
`#>  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 `\
`#>  [9] LC_ADDRESS=C               LC_TELEPHONE=C            `\
`#> [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       `\
`#> `\
`#> time zone: Etc/UTC`\
`#> tzcode source: system (glibc)`\
`#> `\
`#> attached base packages:`\
`#> [1] stats4    stats     graphics  grDevices utils     datasets  methods  `\
`#> [8] base     `\
`#> `\
`#> other attached packages:`\
`#>  [1] iSEE_2.24.0                 SingleCellExperiment_1.34.0`\
`#>  [3] SummarizedExperiment_1.42.0 Biobase_2.72.0             `\
`#>  [5] GenomicRanges_1.64.0        Seqinfo_1.2.0              `\
`#>  [7] IRanges_2.46.0              S4Vectors_0.50.3           `\
`#>  [9] BiocGenerics_0.58.1         generics_0.1.4             `\
`#> [11] MatrixGenerics_1.24.0       matrixStats_1.5.0          `\
`#> [13] BiocStyle_2.40.0           `\
`#> `\
`#> loaded via a namespace (and not attached):`\
`#>  [1] rlang_1.3.0           magrittr_2.0.5        shinydashboard_0.7.3 `\
`#>  [4] clue_0.3-68           GetoptLong_1.1.1      otel_0.2.0           `\
`#>  [7] compiler_4.6.1        mgcv_1.9-4            png_0.1-9            `\
`#> [10] systemfonts_1.3.2     vctrs_0.7.3           pkgconfig_2.0.3      `\
`#> [13] shape_1.4.6.1         crayon_1.5.3          fastmap_1.2.0        `\
`#> [16] XVector_0.52.0        fontawesome_0.5.3     promises_1.5.0       `\
`#> [19] rmarkdown_2.32        shinyAce_0.4.4        ragg_1.5.2           `\
`#> [22] xfun_0.62             cachem_1.1.0          jsonlite_2.0.0       `\
`#> [25] listviewer_4.0.0      later_1.4.8           DelayedArray_0.38.2  `\
`#> [28] parallel_4.6.1        cluster_2.1.8.3       R6_2.6.1             `\
`#> [31] bslib_0.12.0          RColorBrewer_1.1-3    jquerylib_0.1.4      `\
`#> [34] Rcpp_1.1.2            iterators_1.0.14      knitr_1.52           `\
`#> [37] httpuv_1.6.17         Matrix_1.7-6          splines_4.6.1        `\
`#> [40] igraph_2.3.4          tidyselect_1.2.1      abind_1.4-8          `\
`#> [43] yaml_2.3.12           doParallel_1.0.17     codetools_0.2-20     `\
`#> [46] miniUI_0.1.2          lattice_0.23-1        tibble_3.3.1         `\
`#> [49] shiny_1.14.0          S7_0.2.2              evaluate_1.0.5       `\
`#> [52] desc_1.4.3            circlize_0.4.18       pillar_1.11.1        `\
`#> [55] BiocManager_1.30.27   DT_0.34.0             foreach_1.5.2        `\
`#> [58] shinyjs_2.1.1         ggplot2_4.0.3         scales_1.4.0         `\
`#> [61] xtable_1.8-8          glue_1.8.1            tools_4.6.1          `\
`#> [64] colourpicker_1.3.0    fs_2.1.0              grid_4.6.1           `\
`#> [67] colorspace_2.1-4      nlme_3.1-171          vipor_0.4.7          `\
`#> [70] cli_3.6.6             textshaping_1.0.5     S4Arrays_1.12.1      `\
`#> [73] viridisLite_0.4.3     ComplexHeatmap_2.28.0 dplyr_1.2.1          `\
`#> [76] gtable_0.3.6          rintrojs_0.3.4        sass_0.4.10          `\
`#> [79] digest_0.6.39         SparseArray_1.12.3    ggrepel_0.9.8        `\
`#> [82] rjson_0.2.23          htmlwidgets_1.6.4     farver_2.1.2         `\
`#> [85] htmltools_0.5.9       pkgdown_2.2.1         lifecycle_1.0.5      `\
`#> [88] shinyWidgets_0.9.1    GlobalOptions_0.1.4   mime_0.13`

## References

Rigby, Rachel, Kevin Rue-Albrecht, David Sims, and Jan Rehwinkel. 2023.
“Single-cell analysis of signalling responses to type I interferons.”
*bioRxiv*, 1–68.
