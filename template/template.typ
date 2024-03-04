#import "@preview/fontawesome:0.1.0": *

#import "meta.typ": *
#import "titlepage.typ": *
#import "declaration.typ": *

#let auto_import(file) = {
  include {"../modules_" + language + "/" + file + ".typ"}
}


#let thesis(doc) = {
  set text(
    font: "Noto Music",
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
      bottom: 1cm,
    ),
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
    number-align: center,
    // numbering: "-1-"
    footer: [
      #set align(center)
      #counter(page).display(
        "-1-",
      )
    ]
  )
  set heading(numbering: "1.1")
  set par(justify: true)

  doc
}