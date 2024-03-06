#import "@preview/fontawesome:0.1.0": *

#import "../ads/meta.typ": *
#import "utils.typ": *
#import "titlepage.typ": titlepage
#import "declaration.typ": declaration
#import "../ads/acronyms.typ": acronyms
#import "../ads/abstract.typ": abstract

#let thesis(doc) = {
  set text(
    font: "New Computer Modern",
    weight: "regular",
    size: 11pt,
    lang: language
  )
  set align(left)

  let ht-first = state("page-first-section", [])
  let ht-last = state("page-last-section", [])

  set page(
    paper: "a4",
    margin: (
      left: 4cm,
      right: 2cm,
      top: 2.5cm,
      bottom: 1.5cm,
    ),
    background: none,
    // https://stackoverflow.com/questions/76363935/typst-header-that-changes-from-page-to-page-based-on-state
    header: locate(
      loc => [
          #let first-heading = query(
            heading.where(level: 1).or(heading.where(level: 2)).or(heading.where(level: 3)), loc
          ).find(
            h => h.location().page() == loc.page()
          )
          #let last-heading = query(
            heading.where(level: 1).or(heading.where(level: 2)).or(heading.where(level: 3)), loc
          ).rev().find(h => h.location().page() == loc.page())
          #{
            if not first-heading == none {
              ht-first.update([ #first-heading.body ])
              ht-last.update([ #last-heading.body ])
              align(right, text(style: "italic")[ #ht-first.display() ])
            } else {
                align(right, text(style: "italic")[ #ht-last.display() ])
            }
          }
      ]
    )
  )

  set heading(numbering: "1.1")
  show heading.where(
    level:1,
  ): it => [
    #set align(left)
    #set text(20pt, weight: "bold")
    #block(it)
  ]
  show heading.where(
    level:2,
  ): it => [
    #set align(left)
    #set text(17pt, weight: "regular")
    #block(it)
  ]
  show heading.where(
    level:3,
  ): it => [
    #set align(left)
    #set text(14pt, weight: "regular")
    #block(it)
  ]
  show heading.where(
    level:4,
  ): it => [
    #set align(left)
    #set text(11pt, weight: "regular")
    #block(it)
  ]
  

  set par(justify: true)

  titlepage
  declaration
  abstract
  table_of_contents

  // Start page numbering when actual content starts
  set page(footer: [
      #set align(center)
      #counter(page).display(
        "-- 1 --",
      )
    ])
  counter(page).update(1)

  doc

  pagebreak()
  table_of_figures
  pagebreak()
  table_of_tables
  pagebreak()
  table_of_listings
  pagebreak()
  table_of_acronyms
  pagebreak()
  bib
}