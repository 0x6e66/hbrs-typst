#import "template/template.typ": *

#show: thesis

#titlepage

#declaration

#table_of_contents
#table_of_figures

// Start page numbering when actual content starts
// #start_page_numbering
#set page(footer: [
    #set align(center)
    #counter(page).display(
      "-- 1 --",
    )
  ])
#counter(page).update(1)

#auto_import("00_introduction")
#auto_import("01_fundamentals")

#bib
