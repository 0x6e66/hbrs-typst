#import "@preview/fontawesome:0.1.0": *

#import "meta.typ": *
#import "utils.typ": *
#import "titlepage.typ": titlepage
#import "declaration.typ": declaration
#import "acronyms.typ": acronyms

#let auto_import(file) = {
  include {"../modules_" + language + "/" + file + ".typ"}
}

#let used_acronyms = state("usedDic", (:))
#let acro(body) = {
  if(acronyms.keys().contains(body) == false) {
    return rect(
      fill: red,
      inset: 8pt,
      radius: 4pt,
      [*Warning:\ #body*],
    )
  }
  used_acronyms.display(usedDic => {
    if(usedDic.keys().contains(body)) {
      return body
    }
    return acronyms.at(body) + " (" + body + ")"
  });
  used_acronyms.update(usedDic => {
    usedDic.insert(body, true)
    return usedDic
  })
}

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

  set par(justify: true)

  titlepage
  declaration
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