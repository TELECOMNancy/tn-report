// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#import "chapters/nonPlagiat.typ": *
#import "chapters/abstract.typ": *
#import "chapters/contact.typ": *
#import "chapters/appreciations.typ": *


#let project(
  logo: (ul : "figures/logo_ul.png", tn : "figures/logo_tn.jpg", inp: "figures/logo_inp.png"),
  
  title: "Compte rendu d'expérience en entreprise",
  subtitle: "Winter is coming",
  authors: (firstName : "Jon", lastName : "SNOW"),
  anneeScolaire : "2022-2023",
  supervisor : "Eddard Stark",
  company : "Home Box Office",
  numeroCarte : "2014041022",
  town: "Winterfell",
  date: "14 juillet 2023",
  
  authorsCoordinates :(
    number : "numero",
    street : "rue",
    cp : "codepostal",
    livingTown : "ville",
    phone : "Téléphone",
    mail : "jon@castleblack.com",
  ),

  companyCoordinates :(
    number : "numéro",
    street : "rue",
    cp : "codepostal",
    city : "ville",
    phone: "téléphone"
  ),


  body,
) = {
  // Set the document's basic properties.
  set document(title: title)
  set text(font: "Fira Sans", lang: "fr")
  set heading(numbering: none)
  show outline: set par(leading: 3em)
  set outline(fill: "") 
  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
 

  table(align: center, stroke: none, columns: (auto, auto, auto),
    if logo.tn != none {
      image(logo.tn, width: 80%)
    },
    if logo.inp != none{ 
      image(logo.inp, width: 80%)
    },
    if logo.ul !=none{ 
      image(logo.ul, width: 80%)
    }    
  )


  align(center)[
    #align(horizon)[
      #text(title ,size : 30pt)
      #line(length: 60%)
      #text(subtitle + "\n\n", size: 20pt)
      #strong(text(authors.lastName, size: 18pt)) #strong(text(authors.firstName, size: 18pt)) #text("\n\n")
      #strong(text("Année " + anneeScolaire +"\n\n\n\n\n\n\n\n\n", size: 14pt))
      #text("Stage de première année réalisé dans l'entreprise " + company)
    ]
  ]

  align(bottom+left)[ #text("Maitre de stage : " + supervisor)]


  // Abstract page.
  v(1fr)



  pagebreak()
  pagebreak()
  
  

  set page(numbering: "i", number-align: center)
  nonPlagiat(
    authors : (firstName : authors.firstName, lastName : authors.lastName),
    numeroCarte : numeroCarte,
    anneeScolaire : anneeScolaire,
    subtitle: subtitle,
    town : town,
    date : date,
  )
  

  pagebreak() 
  pagebreak()

  contact(
    authors : authors,
    
    title : title, 
    subtitle : subtitle,
    anneeScolaire : anneeScolaire,
    company : company,
    authorsCoordinates : authorsCoordinates,
    companyCoordinates : companyCoordinates,
    supervisor: supervisor,
  )

  pagebreak()
  pagebreak()

  appreciations()
  v(1.618fr)
  pagebreak()
  pagebreak()
  // Table of contents.
  [
    = Table des matières
  ]
  outline(title: none, depth: 3, indent: true)
  
  pagebreak()
  


  // Main body.
  set par(justify: true)
  set heading(numbering: "1.1")
  body
}
