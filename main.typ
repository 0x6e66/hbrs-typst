#import "template/template.typ": *

#show: thesis

#titlepage
#declaration
#table_of_contents

// Start page numbering when actual content starts
#set page(footer: [
    #set align(center)
    #counter(page).display(
      "-- 1 --",
    )
  ])
#counter(page).update(1)

#auto_import("00_introduction")
#auto_import("01_fundamentals")

#pagebreak()
#table_of_figures
#pagebreak()
#table_of_tables
#pagebreak()
#table_of_listings
#pagebreak()
#table_of_acronyms
#pagebreak()
#bib