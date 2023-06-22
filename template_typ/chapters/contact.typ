#let contact(
  authors: none,
  
  title : none,
  subtitle : none,
  anneeScolaire : none,
  company : none,
  mail : none,
  authorsCoordinates : none,
  companyCoordinates : none,
  supervisor : none,
) = {
  align(center)[
    #text(title, size: 30pt)
    #line(length : 80%)
    #text(subtitle + "\n\n", size: 20pt)
    #strong(text(authors.firstName + " " + authors.lastName + "\n\n", size : 18pt))
    #strong(text("Année " + anneeScolaire + "\n\n\n\n\n\n\n"))
    #text(" Stage de première année réalisé dans l’entreprise " + company+ "\n\n\n\n\n\n")
  ]

  align(left)[
    #authors.firstName #authors.lastName \
    #authorsCoordinates.number, #authorsCoordinates.street \ 
    #authorsCoordinates.cp, #authorsCoordinates.livingTown\ 
    #authorsCoordinates.phone \
    #text(link(authorsCoordinates.mail), fill: red, font: "Fira Mono")
    #v(2fr)
    
    TELECOM Nancy\
    193 avenue Paul Muller,\
    CS 90172, VILLER-LÈS-NANCY\
    +33 (0)3 83 68 26 00\
    #text(link("contact@telecomnancy.eu"), fill: red, font: "Fira Mono")\
    #v(2fr)

    #company\
    #companyCoordinates.number, #companyCoordinates.street\
    #companyCoordinates.cp, #companyCoordinates.city\
    #companyCoordinates.phone\

    Maître de strage : #supervisor
  ]

}