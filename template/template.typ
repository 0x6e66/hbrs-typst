#import "@preview/fontawesome:0.1.0": *

#import "meta.typ": *
#import "titlepage.typ": *
#import "declaration.typ": *
#import "utils.typ": *

#let auto_import(file) = {
  include {"../modules_" + language + "/" + file + ".typ"}
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
    // number-align: center,
    // numbering: none
    // footer: [
    //   #set align(center)
    //   #counter(page).display(
    //     "-- 1 --",
    //   )
    // ],
  )
  set heading(numbering: "1.1")

  set par(justify: true)

  // show heading: it => [
  //   #let s = {
  //     if it.level == 1{
  //       30pt
  //     } else if it.level == 2 {
  //       16pt
  //     }else {
  //       11pt
  //     }
  //   }
  //   #set text(size: s)
  //   #it
  // ]

  doc
}