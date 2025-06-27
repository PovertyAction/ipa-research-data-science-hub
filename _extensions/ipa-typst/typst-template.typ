// IPA Typst Template
// This template provides basic article formatting with IPA branding

// Font specifications:
// - Georgia Regular for headings (primary typeface)
// - Arial Bold for secondary titles
// - Arial Regular for body text, labels, footnotes, and captions

#let quarto-ipadoc(
  // The document's title
  title: none,

  // An array of authors. For each author you can specify a name, orcid, and affiliations.
  // affiliations should be content, e.g. "1", which is shown in superscript and should match the affiliations list.
  // Everything but but the name is optional.
  authors: (),
  date: none,
  abstract: none,
  keywords: (),
  paper-size: "a4",
  // Feel free to change this, the font applies to the whole document
  font-face: "Noto Sans",
  heading-numbering: none,

  // The document's content
  body,
) = {

  // Set document properties
  set document(
    title: title,
    author: if authors != () { authors.map(a => repr(a)) } else { () },
    keywords: keywords,
  )

  // Set page properties
  set page(
    paper: paper-size,
    margin: (left: 25%),
    header: [
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [
          #image("assets/logos/ipa-logo-full.jpg", height: 1.2cm)
        ],
        [
          #text(size: 10pt, fill: gray)[
            Research & Data Science Hub
          ]
        ]
      )
      #line(length: 100%, stroke: 0.5pt + gray)
    ],
    footer: [
      #line(length: 100%, stroke: 0.5pt + gray)
      #grid(
        columns: (1fr, auto),
        align: (left, right),
        [
          #text(size: 8pt, fill: gray)[
            © Innovations for Poverty Action. Licensed under CC BY 4.0.
          ]
        ],
        [
          #text(size: 8pt, fill: gray)[
            #context counter(page).display("1 of 1", both: true)
          ]
        ]
      )
    ]
  )

  // Set text properties - Arial Regular for body text
  // set text(
  //   font: ("Arial", "Liberation Sans", "Helvetica", "sans-serif"),
  //   size: 11pt,
  //   lang: "en"
  // )
  set text(font: font-face, size: 11pt, lang: "en")

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Set paragraph spacing
  set par(
    justify: true,
    leading: 0.65em,
  )

  // Configure headings.
  set heading(numbering: heading-numbering)
  show heading.where(level: 1): it => [
    #set text(size: 26pt, weight: "regular")
    #block(above: 1.5em, below: 1em)[#it]
  ]

  show heading.where(level: 2): it => [
    // #set text(size: 14pt, weight: "regular", font: ("Georgia", "Times New Roman", "serif"))
    #block(above: 1.2em, below: 0.8em)[#it]
  ]

  show heading.where(level: 3): it => [
    // #set text(size: 12pt, weight: "bold", font: ("DejaVu Sans", "Arial"))
    #block(above: 1em, below: 0.6em)[#it]
  ]

  // // Title block
  if title != none [
    #align(center)[
      #block(above: 2em, below: 1em)[
        #text(size: 18pt, weight: "bold")[#title]
      ]
    ]
  ]

  // Authors
  if authors != () [
    #align(center)[
      #block(below: 1em)[
        #text(size: 12pt)[#authors.join(", ")]
      ]
    ]
  ]

  // Date
  if date != none [
    #align(center)[
      #block(below: 1.5em)[
        #text(size: 10pt, style: "italic")[#date]
      ]
    ]
  ]

  // Abstract
  if abstract != none [
    #block(above: 1.5em, below: 1.5em)[
      #set par(justify: true)
      #text(weight: "bold")[Abstract: ]
      #abstract
    ]
  ]

  // Keywords
  if keywords != () [
    #block(below: 1.5em)[
      #text(weight: "bold")[Keywords: ]
      #keywords.join(", ")
    ]
  ]

  // Display document content
  body
}
