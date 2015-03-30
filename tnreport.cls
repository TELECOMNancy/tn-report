\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tnreport}[2015/03/13 TELECOM Nancy Master Thesis, v0.2]

\LoadClass[a4paper,twoside,12pt]{report}

\RequirePackage{graphicx}
\RequirePackage[francais]{babel}
\RequirePackage{amsfonts,amssymb,amsmath,mathtools}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
%\RequirePackage{times}
\RequirePackage{libertine}
%\RequirePackage{newtxtext}
\RequirePackage[libertine]{newtxmath}

\RequirePackage[a4paper]{geometry}
\geometry{top=2cm, bottom=2cm,right=2cm,left=2.5cm}

\RequirePackage[colorlinks,linkcolor=black,citecolor=black,pagebackref]{hyperref}
\RequirePackage{acronym}

\newcommand{\email}[1]{\href{mailto:#1}{\nolinkurl{#1}}}
\newcommand{\universityYear}[1]{\the\numexpr #1 - 1 \relax--\the#1}

\RequirePackage{draftwatermark}
\@sc@wm@stampfalse
\SetWatermarkText{Confidentiel}
\SetWatermarkScale{.8}
\DeclareOption{confidential}{\@sc@wm@stamptrue}
\ProcessOptions

\RequirePackage{etoolbox}
\newbool{pidr}
\DeclareOption{pidr}{\booltrue{pidr}}
\ProcessOptions

\RequirePackage{authblk}

\addto\captionsfrench{%
  \renewcommand\listfigurename{Liste des illustrations}}


\RequirePackage{xcolor}
\RequirePackage{titlesec}
\titleformat{\chapter}
  {\normalfont\LARGE\bfseries}{\thechapter}{1em}{}

\usepackage[chapter]{tocbibind}

\setlength{\parindent}{0pt}
\parskip 10pt

\def\includeCompanyLogo{%
  \@ifundefined{reportCompanyLogoPath}{}{\includegraphics[height=6em]{\reportCompanyLogoPath}}
}

%\def\reportAuthorFirstName{Prénom} % Prénom de l'élève
%\def\reportAuthorLastName{Nom} % Nom de l'élève
%\def\reportStudentId{XXXXXXXX} % Numéro de carte d'étudiant de l'élève


\def\reportAuthor{Nom Prénom}

\def\reportAuthorAddress{numéro, rue}
\def\reportAuthorCity{code postal, VILLE} % Adresse de l'élève
\def\reportAuthorPhone{téléphone} % Téléphone de l'élève 
\def\reportAuthorEmail{\email{courriel}} % Courriel de l'élève

\def\reportTitle{Titre de stage} % Titre du mémoire
\def\reportLongTitle{\reportTitle{}} % Titre plus long du mémoire
\def\reportYear{\universityYear{\year}} % Année universitaire

\def\reportCompany{Nom Entreprise} % Nom de l'entreprise d'accueil
\def\reportCompanyAddress{numéro, rue} % Rue de l'entreprise
\def\reportCompanyCity{code postal, VILLE} % Ville de l'entreprise
\def\reportCompanyPhone{téléphone} % Téléphone de l'entreprise
%\def\reportCompanyLogoPath{figures/anonymous_company-logo} % Logo de l'entreprise
\def\reportSchool{TELECOM Nancy} % Nom de l'école
\def\reportSchoolAddress{193 avenue Paul Muller} % Rue de l'école
\def\reportSchoolCity{CS 90172, VILLERS-L\`ES-NANCY} % Ville de l'école
\def\reportSchoolPhone{+33 (0)3 83 68 26 00} % Téléphone de l'école
\def\reportSchoolEmail{contact@telecomnancy.eu}

\def\reportSchoolDiplomaYear{3} % Année diplomante

\def\reportSupervisor{Prénom Nom} % Prénom Nom de l'encadrant (pour les PIDR uniquement)
\def\reportIndustrialSupervisor{Prénom Nom} % Prénom Nom de l'encadrant industriel
\def\reportAcademicSupervisor{Prénom Nom} % Prénom Nom de l'encadrant académique

\def\place{Ville} % Ville pour la signature pour l'engagement anti-plagiat
\def\date{\today} % Date pour la signature de l'engagement anti-plagiat

\def\reportProjectCustomer{Projet réalisé pour l'équipe XYZ du laboratoire DUMMY} % intitulé du 'client' du PIDR

\ifbool{pidr}
  {\def\reportType{Projet interdisciplinaire\newline ou de recherche}
   \def\reportSchoolDiplomaYear{2}}
  {\def\reportType{Mémoire d'ingénieur}}

\makeatletter
\def\maketitle{%
\pagestyle{empty}
\begin{center}
\includegraphics[width=4.5cm]{figures/school-logo}
\hspace{9mm}
\includegraphics[width=4.5cm]{figures/collegium-logo}
\hspace{9mm}
\includegraphics[width=4.5cm]{figures/university-logo}

\vfill

{\fontsize{40}{40}\selectfont \reportType{}}

\rule{\textwidth}{1pt}

\bigskip

{\fontsize{22}{22}\selectfont \reportTitle{}}

\medskip

{\fontsize{18}{18}\selectfont \bf \reportAuthor{}}

\medskip

{\fontsize{14}{14}\selectfont \bf Année \reportYear{}}

\vfill


\ifbool{pidr}
  {\reportProjectCustomer{}}
  {Stage de fin d'études réalisé dans l'entreprise \reportCompany{}

   en vue de l'obtention du diplôme d'ingénieur de \reportSchool{}}

\vfill
\vfill

\end{center}


\ifbool{pidr}
  {Encadrant : \reportSupervisor{}}
  {Maître de stage : \reportIndustrialSupervisor{}

   Encadrant universitaire : \reportAcademicSupervisor{}}

\cleardoublepage
\setcounter{page}{1}
\pagestyle{plain}
}
\makeatother


\makeatletter
\newcommand\insertAntiPlagiarismAgreement[2]{%

  \begin{center}
    \Large \bf Déclaration sur l'honneur de non-plagiat
  \end{center}

  \medskip
  \medskip

  {\bf Je soussigné(e),}
  
  {\bf Nom, prénom : #1}
  
  {\bf \'Elève-ingénieur(e) régulièrement inscrit(e) en \reportSchoolDiplomaYear{}\up{e} année à \reportSchool{}}
  
  {\bf Numéro de carte de l'étudiant(e) :} #2
  
  {\bf Année universitaire :} \reportYear{}
  
  {\bf Auteur(e) du document, mémoire, rapport ou code informatique intitulé :}
  
  \begin{center}
    \Large \reportLongTitle{}
  \end{center}
  \medskip

  Par la présente, je déclare m'être informé(e) sur les différentes formes de
  plagiat existantes et sur les techniques et normes de citation et référence.

  Je déclare en outre que le travail rendu est un travail original, issu de ma
  réflexion personnelle, et qu'il a été rédigé entièrement par mes soins.
  J'affirme n'avoir ni contrefait, ni falsifié, ni copié tout ou partie de
  l'\oe{}uvre d'autrui, en particulier texte ou code informatique, dans le but
  de me l'accaparer.

  Je certifie donc que toutes formulations, idées, recherches, raisonnements,
  analyses, programmes, schémas ou autre créations, figurant dans le document
  et empruntés à un tiers, sont clairement signalés comme tels, selon les
  usages en vigueur.

  Je suis conscient(e) que le fait de ne pas citer une source ou de ne pas la
  citer clairement et complètement est constitutif de plagiat, que le plagiat
  est considéré comme une faute grave au sein de l'Université, et qu'en cas de
  manquement aux règles en la matière, j'encourrais des poursuites non
  seulement devant la commission de discipline de l'établissement mais
  également devant les tribunaux de la République Fran\c{c}aise.

  \medskip
  \medskip

  \hspace{5cm}{\bf Fait à \place{},     le  \date{}}

  \hspace{5cm}{\bf Signature :}
\cleardoublepage
}
\makeatother


\makeatletter
\def\makesecondtitle{%
\begin{center}

{\fontsize{40}{40}\selectfont \reportType{}}

\rule{\textwidth}{1pt}

\bigskip

{\fontsize{22}{22}\selectfont \reportTitle{}}

\medskip

{\fontsize{18}{18}\selectfont \bf \reportAuthor{}}

\medskip

{\fontsize{14}{14}\selectfont \bf Année \reportYear{}}

\vfill

\ifbool{pidr}
  {\reportProjectCustomer{}}
  {Stage de fin d'études réalisé dans l'entreprise \reportCompany{}

   en vue de l'obtention du diplôme d'ingénieur de \reportSchool{}}
\vfill
\end{center}

\reportAuthor{} \\
\ifbool{pidr}
  {}
  {\reportAuthorAddress{} \\
   \reportAuthorCity{}\\
   \reportAuthorPhone{} \\
  }
\reportAuthorEmail{} \\
\smallskip

\reportSchool{}\\
\reportSchoolAddress{},\\
\reportSchoolCity{}\\
\reportSchoolPhone{}\\
\email{\reportSchoolEmail}\\
\smallskip

\begin{tabular}{@{}lr@{}}
\parbox[b]{.7\linewidth}{
\reportCompany{} \\
\reportCompanyAddress{} \\
\reportCompanyCity{} \\
\reportCompanyPhone{} \\
} & \includeCompanyLogo{} \\
\end{tabular}

\medskip

\ifbool{pidr}
  {Encadrant : \reportSupervisor{}}
  {Maître de stage : \reportIndustrialSupervisor{}

   Encadrant universitaire : \reportAcademicSupervisor{}}

\cleardoublepage
}
\makeatother
