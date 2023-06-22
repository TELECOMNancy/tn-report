#let nonPlagiat( 
  authors : (firstName : "", lastName : ""),
  numeroCarte : none,
  anneeScolaire : none,
  title : none,
  town : none,
  date : none,
  subtitle : none,
) = {

align(
  center,
  text("Déclaration sur l'honneur de non-plagiat", size: 20pt)
)
  strong("Je soussigné(e), \n\n")
  
  strong(text("Nom, prénom : " + text(authors.lastName) +", "+ text(authors.firstName)) + "\n\n")

  strong(text("Élève-ingénieur(e) régulièrement inscrit(e) en 1e année à TELECOM Nancy\n\n"))
  
  strong(text("Numéro de carte de l’étudiant(e) : ")) + text(numeroCarte)+ "\n\n"
  
  strong("Année universitaire : ")+ anneeScolaire + "\n\n"
  
  strong("Auteur(e) du document, mémoire, rapport ou code informatique intitulé : \n\n")
  
  align(center,text(subtitle, size: 20pt))

  text("
Par la présente, je déclare m’être informé(e) sur les différentes formes de plagiat existantes et sur les techniques et normes de citation et référence.\n
Je déclare en outre que le travail rendu est un travail original, issu de ma réflexion personnelle, et qu’il a été rédigé entièrement par mes soins.
J’affrme n’avoir ni contrefait, ni falsifié, ni copié tout ou partie de l’œuvre d’autrui, en particulier texte ou code informatique, dans le but de me l’accaparer.\n
Je certifie donc que toutes formulations, idées, recherches, raisonnements, analyses, programmes, schémas ou autre créations, figurant dans le document et empruntés à un tiers, sont clairement signalés comme tels, selon les usages en vigueur.\n
Je suis conscient(e) que le fait de ne pas citer une source ou de ne pas la citer clairement et complètement est constitutif de plagiat, que le plagiat est considéré comme une faute grave au sein de l’Université, et qu’en cas de manquement aux règles en la matière, j’encourrais des poursuites non seulement devant la commission de discipline de l’établissement mais également devant les tribunaux de la République Française. \n\n")

  
  align(center, strong(text("Fait à " + town + ", le " + date + "\n\n\n")))
  strong(text("                                                      Signature:                                    " + box(image("/figures/logo_inp.png", width: 20%) )))
  

}
