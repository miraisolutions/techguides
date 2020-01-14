<!-- README.md is generated from README.Rmd. Please edit that file -->
roxygenExPkg
============

An example package showing motivated guidelines about structuring the
**roxygen2** documentation content.

Installation
------------

#### Local checkout

In order to install the package from a git checkout, install as follows:

``` r
devtools::install()
```

#### GitHub

In order to access *private repositories* on GitHub programmatically,
the best way is to generate a personal access token (PAT) online
<a href="https://github.com/settings/tokens" class="uri">https://github.com/settings/tokens</a>.
Once generated, you need to copy the value and save it somewhere. Once
you move away from the page, you will not be able to retrieve the value
online anymore. To make the PAT available to R and RStudio sessions, the
preferred option is to set the `GITHUB_PAT` environment variable in your
`.Renviron` (e.g. under /etc/R on a typical Linux setup) to the value
stored above. The package `devtools` will look for this environment
variable.

``` r
devtools::install_github(
  "miraisolutions/techguides/roxygen_guidelines/roxygenExPkg"
)
```

Guidelines and examples
-----------------------

The package contains examples, illustrating and motivating
best-practices, which can be found in the R sources of the package
itself. The corresponding help documentation pages can be browsed to see
how help content is rendered.

``` r
help(package = "roxygenExPkg")
```
