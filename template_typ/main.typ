#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  
)


// We generated the example code below so you can see how
// your document will look. Go ahead and replace it with
// your own content!

#set page(numbering: "1") 

= Introduction
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/01_introduction.typ"
#pagebreak()
#pagebreak()

= Présentation de l'entreprise
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/02_company.typ"

#pagebreak()

= Présentation de la tâche effectuée
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/03_taskDone.typ"

#pagebreak()

= Réflexion
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/04_reflexion.typ"

== Premier sujet
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/04_reflexion_01.typ"


== Deuxième sujet
// Do not write your text in this document, but in the document dedicated
#v(50pt)
#include "chapters/04_reflexion_02.typ"


#pagebreak()
= Conclusion
#v(50pt)
// Do not write your text in this document, but in the document dedicated
#include "chapters/05_conclusion.typ"


#set heading(numbering: none)
#pagebreak()
= Bibliographie / Webographie
#pagebreak()

= Liste des illustrations
#outline(
  target: figure.where(kind: image),
  title : none,
)

#pagebreak()


= Liste des tableaux
#outline(
  target : figure.where(kind: table),
  title : none,
)
#pagebreak()


= Listings
#pagebreak()


= Glossaire
#pagebreak()
