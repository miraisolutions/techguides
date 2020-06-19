rsconnect::setAccountInfo(
  Sys.getenv("SHINYAPPS_ACCOUNT"),
  Sys.getenv("SHINYAPPS_TOKEN"),
  Sys.getenv("SHINYAPPS_SECRET")
)
rsconnect::deployApp(
  appName = "ShinyCICD",
  # exclude hidden files and renv directory
  appFiles = setdiff(list.files(), "renv")
)
