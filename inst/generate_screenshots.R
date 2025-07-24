# To generate new screenshots, use this script

# ... install webshot2
Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS="true")
BiocManager::install("rstudio/webshot2")

# ... define the SCREENSHOT function that will create the screenshots
SCREENSHOT <- function(x, delay=10, zoom=1, vwidth=992, vheight=744) {
  dir.create(dirname(x), recursive=TRUE, showWarning=FALSE)
  webshot2::appshot(app, delay=delay, file=x,
                    zoom=zoom, vwidth=vwidth,
                    vheight=vheight) |> webshot2::resize("200%")
}

# ...set working directory to package root directory and run
#    (replacing fname with the vignette file name):
dir.create("vignettes/images", recursive=TRUE, showWarning=FALSE)
fname <- "vignettes/05_extending_iSEE.Rmd"
rmarkdown::render(fname, run_pandoc=FALSE)

