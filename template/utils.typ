#import "meta.typ": *
#import "@preview/outrageous:0.1.0"

#let language_switch(dict) = {
  for (k, v) in dict {
    if k == language {
      return v
      break
    }
  }
  panic("language value not matching any key in the array")
}

#let today= {
  datetime.today().display("[day].[month].[year]")
}

// #let start_page_numbering = {
//   set page(footer: [
//     #set align(center)
//     #counter(page).display(
//       "-- 1 --",
//     )
//   ])
//   counter(page).update(1)
// }

#let table_of_contents = {
  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.outrageous-toc,
  )
  outline(
    title:
      if language == "de" {
        "Inhaltsverzeichnis"
      } else if language == "en" {
        "Table of Contenst"
      },
    target: heading,
    indent: auto,
    depth: 3
  )

  pagebreak()
}

#let table_of_figures = {
  show outline.entry: outrageous.show-entry.with(
    ..outrageous.presets.outrageous-figures,
  )
  outline(
    title:
      if language == "de" {
        "Abbildungsverzeichnis"
      } else if language == "en" {
        "Table of Figures"
      },
    target: figure,
  )

  pagebreak()
}

#let bib = {
  pagebreak()
  bibliography(
    title: {
      if language == "de" {
        "Literaturverzeichnis"
      } else if language == "en" {
        "Bibliography"
      }
    },
    bib_file
  )
}