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
#v(50pt)
#include "chapters/01_introduction.typ"
#pagebreak()
#pagebreak()

= Présentation de l'entreprise
#v(50pt)
#include "chapters/02_company.typ"

#pagebreak()

= Présentation de la tâche effectuée
#v(50pt)
#include "chapters/03_taskDone.typ"

#pagebreak()

= Réflexion

== Premier sujet

== Deuxième sujet

#pagebreak()
= Conclusion

#set heading(numbering: none)
#pagebreak()
= Bibliographie / Webographie
#pagebreak()

= Liste des illustrations
#pagebreak()
= Liste des tableaux
#pagebreak()
= Listings
#pagebreak()
= Glossaire
#pagebreak()