library(XLConnect)
file.copy("xlconnect-examples.xls", "xlconnect-populated.xls", overwrite = TRUE)
wb <- loadWorkbook("xlconnect-populated.xls")


# method 1 (Guido referred to RBRM, but we have dozens of examples in RMP by now): writing data into a placeholder named region
# (these are pretty much always just one row, as we otherwise would overwrite data)
dummyTable <- expand.grid(variable = paste0("var", 1:5), row = paste0("row", 1:4))
dummyTable <- cbind(dummyTable, value = 1:ncol(dummyTable))

# writeNamedRegion will overwrite the header, but it is good practice to ensure the columns match
if (!all(colnames(dummyTable) == colnames(readNamedRegion(wb, "populateMe")))) {
  stop("table to populate does not match expected header, column names and order must match")
}

writeNamedRegion(wb, dummyTable, "populateMe")
# make sure values are updated upon opening the file (i.e. excel formulas executed)
setForceFormulaRecalculation(wb, "*", TRUE)
saveWorkbook(wb)


# method 2 (like in GIPAR)
createSheet(wb, "new_sheet")
createName(wb, "formatMe", "new_sheet!$B$3")
writeNamedRegion(wb, dummyTable, "formatMe")

# get and apply cell styles (GIPAR has some specific logic which is mostly about getting the correct reference formulas)
# Important: these custom cell styles cannot be moved from one workbook to another, but one can delete data
# afterwards which is also done in GIPAR (removing the sheet containing the styles)
setCellStyle(wb, formula = "new_sheet!$B$3:$B$23", cellstyle = getCellStyle(wb, "bold"))
setCellStyle(wb, formula = "new_sheet!$C$3:$F$3", cellstyle = getCellStyle(wb, "fancy"))
setCellStyle(wb, formula = "new_sheet!$C$4:$D$13", cellstyle = getCellStyle(wb, "underlined"))
saveWorkbook(wb)


# there are other ways of course, imo setStyleAction is the most important function to know about when deciding how to define cell styling.
# getReference*, aref / aref2idx functions and others can help to locate where what data and format should go
# getCellFormula / setCellFormula I used rarely and would not recommend it in my work with excel files and xlconnect in any case so far
# (if it is necessary, that often means that the excel template is rather complex and one would have to replicate the excel formulas
# logic in R somehow). I guess it's also a conceptual / design question, but I prefer to separate R and excel when it comes to formulas / operations.



