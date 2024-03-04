#import "meta.typ": *
#import "utils.typ": *

#let titlepage = {
  grid(
    columns: (20%, 80%),
    gutter: 10pt,
    image(hbrs_logo),
    align(left, text([*Hochschule \ Bonn-Rhein-Sieg* \ _University of Applied Sciences_ \ \ *Fachbereich Informatik* \ _Department of Computer Science_])),
  )

  v(2cm)

  align(
    center,
    text(
      size: 25pt,
      language_switch(thesis_subject_type),
    )
  )

  v(-0.2cm)
  

  align(
    center,
    text(
      size: 15pt,
      {
        if language == "de" {
          [im #text(thesis_type)-Studiengang #language_switch(thesis_study_course)]
        }else if language == "en" {
          [for the #text(thesis_type)-course #language_switch(thesis_study_course)]
        }
      }
    )
  )

  v(2cm)

  align(
    center,
    text(
      size: 25pt,
      language_switch(thesis_title),
    )
  )

  v(-0.8cm)

  align(
    center,
    text(
      size: 15pt,
      [-],
    )
  )

  v(-0.5cm)

  align(
    center,
    text(
      size: 18pt,
      language_switch(thesis_sub_title),
    )
  )

  v(0.8cm)

  align(
    center,
    text(
      size: 15pt,
      {
        if language == "de" {
          [von \ *#author_first_name #author_last_name*]
        }else if language == "en" {
          [by \ *#author_first_name #author_last_name*]
        }
      }
    )
  )

  align(
    left + bottom,
    text(
      size: 12pt,
      {
        table(
          columns: (auto, auto),
          stroke: none,
          align: (x, y) => (right, left).at(x),
          {
            if language == "de" {"Erstprüfer"}
            else if language == "en" {"First Supervisor"}
          }, thesis_supervisor_first,
          {
            if language == "de" {"Zweitprüfer"}
            else if language == "en" {"Second Supervisor"}
          }, thesis_supervisor_second,
          {
            if language == "de" {"Betreuer"}
            else if language == "en" {"Third Supervisor"}
          }, thesis_supervisor_third,
          {
            if language == "de" {"Abgegeben am"}
            else if language == "en" {"Date of submission"}
          }, today,
          {
            if language == "de" {"Matrukelnummer, Kurs"}
            else if language == "en" {"Matrukelnumber, Course"}
          }, [#author_matrikel_number, #author_course]
        )
      }
    )
  )


  pagebreak()
}
