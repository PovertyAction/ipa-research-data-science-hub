// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template
// that ships with Quarto). It calls the typst function named 'article' which
// is defined in the 'typst-template.typ' file.
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: quarto-ipadoc.with(
$if(title)$
  title: "$title$",
$endif$
$if(subtitle)$
  subtitle: "$subtitle$",
$endif$
$if(short-title)$
  short-title: "$short-title$",
$endif$
$if(venue)$
  venue: $venue$,
$endif$
$if(logo)$
  // This is relative to the template file
  // When importing normally, you should be able to use it relative to this file.
  logo: "$logo$",
$endif$
$if(doi)$
  doi: "$doi$",
$endif$
$if(theme)$
  theme: $theme$,
$endif$
// $if(by-author)$
//   authors: (
// $for(by-author)$
// $if(it.name.literal)$
//     ( name: "$it.name.literal$" ),
// $endif$
$endfor$
    ),
$endif$

$if(pub-date)$
  date: (
    $for(pub-date)$
    (title:"$it.title$",
    date:$it.date$),
    $endfor$
  ),
$endif$

$if(institute)$
  affiliations: (
$for(institute)$
    ( id: "$it.id$",
      name: "$it.name$"
    ),
$endfor$
    ),
$endif$

$if(keyword)$
  keywords: (
    $for(keyword)$
    "$keyword$"$sep$,
    $endfor$
  ),
$endif$

$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(mainfont)$
  font-face: "$mainfont$",
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(kind)$
  kind: [$kind$],
$endif$

$if(margin-content)$
  margin: (
    $for(margin-content)$
      (
        title: "$it.title$",
        content: [$it.content$]
      ),
    $endfor$
  ),
$endif$

$if(bibliography)$
  bibliography-file: "$bibliography$",
  $if(biblio-style)$
  bibliography-style: "$biblio-style$",
  $endif$
$endif$


)
