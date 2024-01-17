# Control dependencies with `renv`


For production readiness - and project safety - it is important to control the dependencies of a piece of development. This can be done at project level using the package [`renv`](https://rstudio.github.io/renv/).

In a `renv`-project (and a new R session starts), `renv` detects the project dependencies and whether they are out of sync, ensuring the same virtual environment applies all the time the project is opened.

This approach ensures that the set of dependencies is collaboratively shared and maintained. Moreover, it can be used to align the development environment to the production stage. Managing the dependencies the way up to production improves reproducibility, a key requirement in enterprise.

Finally, as the control is at project level, it is possible to have different virtual environments (for example different packages version) for different projects, while keeping the maintenance of the versioned package library efficient through caching.

## Install `renv`

`renv` can be installed from CRAN as:


```r
install.packages("renv")
```

## Initialize an `renv` project

To initialize a package with `renv`, run:


```r
renv::init(
  # use the DESCRIPTION file to capture dependencies
  settings = list(snapshot.type = "explicit"),
  # do not install dependencies (done in a custom way)
  bare = TRUE
)
```

This ensures that the dependencies of the package, as listed in the `DESCRIPTION` file are used for initializing the virtual environment. 

Note: `renv` tracks and installs only the packages explicitly mentioned in the `DESCRIPTION` file. This means that only the dependencies used by the package are installed. Packages needed for development, such as `devtools`, should be be installed for the specific project via `install.packages()` or `renv::install()`.

The `renv` initialization causes:

- the creation of a new `renv.lock` file where the R version and the list of used packages with their version are tracked;
- the creation of a new `renv` folder containing:
    - a setting file `settings.dcf`,
    - a script `activate.R` to activate the project-specific virtual environment,
    - the project-specific `library` of installed packages;
- the execution of the activation script on project launch via `.Rprofile`;
- an update of the `.Rbuildignore` because the `renv`-specific files are not part of the R package infrastructure;
- an update of the `.gitignore` to exclude the `renv` library from version control, as it can be simply restored via `renv::restore()`.

Having all the `renv` infrastructure committed under version control ensures that the same `renv` setup is available to anyone working on the same project (via `renv::restore()`).

### Control packages version

As a note, if the `DESCRIPTION` file does not request a specific package version, the `renv` initialization will pick the version currently available in the user library when the snapshot of the packages was created. However, it is advisable to have a stricter control over the version of the packages used in a project. To do so, one can set the option to install dependencies from a specific MRAN repo, therefore fixing the version for all available packages.


```r
# Install all dependencies from a specific MRAN date repo
options(repos = "https://mran.microsoft.com/snapshot/2020-11-15")
```

One can then install the dependencies of a package via:


```r
renv::install("remotes")
(deps <- remotes::dev_package_deps(dependencies = TRUE))
renv::install(with(deps, sprintf("%s@%s", package[diff!=0], available[diff!=0])))
```

To create a snapshot of the package dependencies and update the `renv.lock` file:


```r
# Create a snapshot to track dependencies in the lockfile
renv::snapshot()
```

## Caching the packages' versions

`renv` caches the packages' versions. If you have installed the same package version in a different project, you should have it already cached and available. By running:


```r
renv::status()
```

One can check if packages versions are out of sync and via 


```r
renv::restore()
```

It is possible to restore the versions as listed in the `renv.lock` file.

## Removing the `renv` setup from a project

If you would like to remove the `renv` setup from a project:

- run `renv::deactivate()` to fall back on a `renv`-free setup;
- delete `renv.lock` and the `renv` folder for clarity.
