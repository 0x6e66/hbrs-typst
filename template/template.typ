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

  set page(
    paper: "a4",
    margin: (
      left: 4cm,
      right: 2cm,
      top: 2.5cm,
      bottom: 1.5cm,
    ),
    background: none,
    header: locate(loc => {
      if [#loc.page()] == [1] {
        return []
      }
      let elems = query(
        selector(heading).before(loc),
        loc,
      )
      if elems != () {
        let body = elems.last().body
        h(1fr) + emph(body)
      }
    }),
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