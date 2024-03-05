#import "@preview/outrageous:0.1.0"

#import "meta.typ": *
#import "acronyms.typ": acronyms

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
    depth: 3,
  )

  pagebreak()
}

#let table_of_figures = {
  heading(
    numbering: none,
    outlined: true,
    bookmarked: true, 
    if language == "de" {
      "Abbildungsverzeichnis"
    } else if language == "en" {
      "List of figures"
    }
  )
  outline(
    title: none,
    target: figure.where(kind: "fig"),
  )
}

#let table_of_tables = {
  heading(
    numbering: none,
    outlined: true,
    bookmarked: true, 
    if language == "de" {
      "Tabellenverzeichnis"
    } else if language == "en" {
      "List of tables"
    }
  )
  outline(
    title: none,
    target: figure.where(kind: "tab"),
  )
}

#let table_of_acronyms = {
  heading(
    numbering: none,
    outlined: true,
    bookmarked: true, 
    if language == "de" {
      "Abkürzungsverzeichnis"
    } else if language == "en" {
      "List of acronyms"
    }
  )
  table(
    columns: (auto, auto),
    stroke: none,
    align: (x, y) => (right, left).at(x),
    ..for (k, v) in acronyms {
      ([*#k*], v)
    }
  )
}

#let table_of_listings = {
  heading(
    numbering: none,
    outlined: true,
    bookmarked: true, 
    if language == "de" {
      "Quellcodeverzeichnis"
    } else if language == "en" {
      "List of code-listings"
    }
  )
  outline(
    title: none,
    target: figure.where(kind: "lst"),
  )
}

#let bib = {
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