# deploy/deploy-shinyapps.R
# usethis::use_build_ignore("deploy")
rsconnect::setAccountInfo(
  Sys.getenv("SHINYAPPS_ACCOUNT"),
  Sys.getenv("SHINYAPPS_TOKEN"),
  Sys.getenv("SHINYAPPS_SECRET")
)
# Add here any additional files/directories the app needs
app_files = c(
  "app.R",
  "DESCRIPTION",
  "NAMESPACE",
  "R/",
  "inst/"
)
rsconnect::deployApp(appName = "ShinyCICD", appFiles = app_files,
                     forceUpdate = TRUE)
