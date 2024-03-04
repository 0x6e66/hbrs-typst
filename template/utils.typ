#import "meta.typ": *

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

#let table_of_contents = {
  outline(
    title:
      if language == "de" {
        "Inhaltsverzeichnis"
      } else if language == "en" {
        "Table of Contenst"
      },
    target: heading,
  )

  pagebreak()
}

#let table_of_figures = {
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