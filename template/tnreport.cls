\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{tnreport}[2020/04/28 TELECOM Nancy Master Thesis, v1.0] 


\LoadClass[a4paper,twoside,12pt]{report} %Base Class on which the whole template is constructed
\RequirePackage{etoolbox}
\RequirePackage{amsfonts,amssymb,amsmath,mathtools}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{graphicx}

\RequirePackage[a4paper]{geometry}
\geometry{top=2cm, bottom=2cm,right=2cm,left=2.5cm}

%%---Options---%%

%Watermark for confidential reports
\newbool{watermark}
\boolfalse{watermark}
\DeclareOption{confidential}{\booltrue{watermark}}

%type of report : by default (nothing set) the type is stage3a
\newbool{stage1a}
\boolfalse{stage1a}
\DeclareOption{stage1a}{\booltrue{stage1a}}

\newbool{stage2a}
\boolfalse{stage2a}
\DeclareOption{stage2a}{\booltrue{stage2a}}

\newbool{pidr}
\boolfalse{pidr}
\DeclareOption{pidr}{\booltrue{pidr}}

\newbool{pi}
\boolfalse{pi}
\DeclareOption{pi}{\booltrue{pi}}

%lang of the report, default is french
\newbool{english}
\boolfalse{english}
\DeclareOption{english}{\booltrue{english}}

\DeclareOption*{
	\ClassWarning{tnreport}{Unknow option '\CurrentOption'}
}

\ProcessOptions\relax


%%---Packages---%%


\ifbool{english}{
	\RequirePackage[english]{babel}
}{
	\RequirePackage[french]{babel} %option francais is deprecated
}


\RequirePackage[svgnames,table]{xcolor} %table option is usefull when coloring rows in tabular

\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{amsfonts,amssymb,amsmath,mathtools}

\RequirePackage{authblk}
\RequirePackage[chapter]{tocbibind}

\RequirePackage{tabularx}
\RequirePackage{titlesec}
\RequirePackage[colorlinks,linkcolor=black,citecolor=black,pagebackref,linktocpage=true]{hyperref}
\RequirePackage{acronym}


\RequirePackage{glossaries-extra} %use this instead of "glossaries" for better looking glossaries
\makeglossaries

%only loads the draftwatermark package if it is needed
\ifbool{watermark}{\RequirePackage[text=Confidentiel,scale=0.8]{draftwatermark}}{}

\RequirePackage{listings}
\lstset{ %
  backgroundcolor=\color{white},   % choose the background color
  basicstyle=\footnotesize,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{Orange},    % comment style
  extendedchars=false,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,                    % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{DarkOrchid},       % keyword style
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{DarkGray}, % the style that is used for the line-numbers
  rulecolor=\color{DarkGray},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{DarkGreen},     % string literal style
  tabsize=2,                     % sets default tabsize to 2 spaces
  %title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}


%%---custom commands---%%

\newcommand{\email}[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\newcommand{\universityYear}[1]{\the\numexpr #1 - 1 \relax--\the#1}
%\newcommand{\universityYear}[1]{\the\numexpr #1}
%if you need want only on year to display, use second line and comment the first one



\titleformat{\chapter}
  {\normalfont\LARGE\bfseries}{\thechapter}{1em}{}


\setlength{\parindent}{0pt}
\parskip 10pt

\def\includeCompanyLogo{%
  \@ifundefined{reportCompanyLogoPath}{}{\includegraphics[height=6em]{\reportCompanyLogoPath}}
}

%below split between langs is mostly cosmetic
\ifbool{english}{
	%true means english
	
	\def\reportAuthor{Your name}
	
	\def\reportAuthorAddress{Your address}
	\def\reportAuthorCity{postal code, CITY} % Author city and postal code
	\def\reportAuthorPhone{Your phone number} % Author phone number
	\def\reportAuthorEmail{\email{Your mailing address}} % Author Email
	
	\def\reportTitle{Internship title} % Internship title
	\def\reportLongTitle{\reportTitle{}} % Long internship title
	\def\reportYear{\universityYear{\year}} % University year
	
	\def\reportCompany{Company title} % Company title
	\def\reportCompanyAddress{Company address} % Company address
	\def\reportCompanyCity{Postal code, CITY} % Company city and postal code
	\def\reportCompanyPhone{Company phone number} % Company phone number
	\def\reportCompanyLogoPath{figures/anonymous_company-logo} % Company Logo
	\def\reportSchool{TELECOM Nancy} % School name
	\def\reportSchoolAddress{193 avenue Paul Muller} % School address
	\def\reportSchoolCity{CS 90172, VILLERS-L\`ES-NANCY} % School city and postal code
	\def\reportSchoolPhone{+33 (0)3 83 68 26 00} % School phone number
	\def\reportSchoolEmail{contact@telecomnancy.eu} % School contact email
	
	\def\reportSchoolDiplomaYear{3} % School Diploma Year
	
	\def\reportSupervisor{Industrial supervisor's name} % Industrial supervisor's name in company or laboratory
	\def\reportAcademicSupervisor{Academic supervisor's name} % Academic supervisor's name
	
	\def\place{City} % City of signature for the anti-plagiarism agreement
	\def\date{\today} % Date of signature for the anti-plagiarism agreement
	
	\def\reportProjectCustomer{Project done for the XYZ team of DUMMY laboratory}
	
	\def\reportIndustrialCustomer{Project done in partnership with \reportCompany{}}
	
	\ifbool{pidr}
	{\def\reportType{Cross-Disciplinary or Research Project}
		\def\reportSchoolDiplomaYear{2}}
	{\ifbool{pi}
		{\def\reportType{Industrial Project}
			\def\reportSchoolDiplomaYear{3}}
		{\ifbool{stage2a}
			{\def\reportType{Internship report}
				\def\reportSchoolDiplomaYear{2}}
			{\def\reportType{Master Thesis}}}}
		
}{
	%false means french
	\addto\captionsfrench{%
		\renewcommand\listfigurename{Liste des illustrations}}
	
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
	\def\reportCompanyLogoPath{figures/anonymous_company-logo} % Logo de l'entreprise
	\def\reportSchool{TELECOM Nancy} % Nom de l'école
	\def\reportSchoolAddress{193 avenue Paul Muller} % Rue de l'école
	\def\reportSchoolCity{CS 90172, VILLERS-L\`ES-NANCY} % Ville de l'école
	\def\reportSchoolPhone{+33 (0)3 83 68 26 00} % Téléphone de l'école
	\def\reportSchoolEmail{contact@telecomnancy.eu}
	
	\def\reportSchoolDiplomaYear{3} % Année diplomante
	
	\def\reportSupervisor{Prénom Nom} % Prénom Nom de l'encadrant (pour les PIDR uniquement)
%	\def\reportIndustrialSupervisor{Prénom Nom} % Prénom Nom de l'encadrant industriel
	\def\reportAcademicSupervisor{Prénom Nom} % Prénom Nom de l'encadrant académique
	
	\def\place{Ville} % Ville pour la signature pour l'engagement anti-plagiat
	\def\date{\today} % Date pour la signature de l'engagement anti-plagiat
	
	\def\reportProjectCustomer{Projet réalisé pour l'équipe XYZ du laboratoire DUMMY} % intitulé du 'client' du PIDR
	
	\def\reportIndustrialCustomer{Projet réalisé en partenariat avec ENTERPRISE} % intitulé du 'client' du PI
	
	\ifbool{pidr}
	{\def\reportType{Projet interdisciplinaire\newline ou de recherche}
		\def\reportSchoolDiplomaYear{2}}
	{\ifbool{pi}
		{\def\reportType{Projet industriel}
			\def\reportSchoolDiplomaYear{3}}
		{\ifbool{stage1a}
			{\def\reportType{Compte rendu d’expérience en entreprise}
				\def\reportSchoolDiplomaYear{1}}
			{\ifbool{stage2a}
				{\def\reportType{Rapport de stage}
					\def\reportSchoolDiplomaYear{2}}
				{\def\reportType{Mémoire d'ingénieur}}}}}
}%end of french defs


%%title definition%%

\makeatletter
\def\maketitle{%
\pagestyle{empty}
\begin{center}
\includegraphics[width=4cm]{figures/school-logo}%images looks better width those customs parameters
\hspace{12mm}
\includegraphics[width=4.5cm]{figures/collegium-logo}
\hspace{6mm}
\includegraphics[width=5cm]{figures/university-logo}

\vfill

{\fontsize{40}{40}\selectfont \reportType{}}

\rule{\textwidth}{1pt}

\bigskip

{\fontsize{22}{22}\selectfont \reportTitle{}}

\medskip

{\fontsize{18}{18}\selectfont \bf \reportAuthor{}}

\medskip


\ifbool{english}{%One must be carefull with spaces in the following bloc
{\fontsize{14}{14}\selectfont \bf Academic Year \reportYear{}}

\vfill
	
\ifbool{pidr}
{\reportProjectCustomer{}}
{\ifbool{pi}
	{\reportIndustrialCustomer{}}
	{\ifbool{stage2a}
		{Second year internship done in partnership with \reportCompany{}}
		{Final year internship done in partnership with
			
			\reportCompany{}
			
			in preparation for the engineering diploma of \reportSchool{}}}}
}{%french version has been changed a bit in appearance to fit the english layout
{\fontsize{14}{14}\selectfont \bf Année \reportYear{}}

\vfill

\ifbool{pidr}
  {\reportProjectCustomer{}}
  {\ifbool{pi}
    {\reportIndustrialCustomer{}}
	{\ifbool{stage1a}
		{Stage de première année réalisé dans l'entreprise \reportCompany{}}
		{\ifbool{stage2a}
			{Stage de deuxième année réalisé dans l'entreprise \reportCompany{}}
			{Stage de fin d'études réalisé dans l'entreprise 
				
				\reportCompany{}

		en vue de l'obtention du diplôme d'ingénieur de \reportSchool{}}}}}
}
\vfill

\end{center}

\ifbool{english}{
\ifbool{pidr}
{Supervisor : \reportSupervisor{}}
{\ifbool{pi}
	{Industrial supervisor: \reportSupervisor{}
		
		Academic supervisor: \reportAcademicSupervisor{}}
	{Internship supervisor: \reportSupervisor{}
		
		Academic supervisor: \reportAcademicSupervisor{}}}
}{
\ifbool{pidr}
{Encadrant : \reportSupervisor{}}
{\ifbool{pi}
    {Encadrant industriel : \reportSupervisor{}

        Encadrant académique : \reportAcademicSupervisor{}}
    {\ifbool{stage1a}
    	{Maître de stage : \reportSupervisor{}}
    	{Maître de stage : \reportSupervisor{}

        Encadrant universitaire : \reportAcademicSupervisor{}}}}
}

\cleardoublepage
\setcounter{page}{1}
\pagestyle{plain}
}
\makeatother


\makeatletter
\newcommand\insertAntiPlagiarismAgreement[2]{%

  \begin{center} %Maybe one should makes an english version of this... TODO?
    \Large \bf Déclaration sur l'honneur de non-plagiat
  \end{center}

  \medskip
  \medskip

  {\bf Je soussigné(e),}

  {\bf Nom, prénom : #1}

  {\bf \'Elève-ingénieur(e) régulièrement inscrit(e) en \reportSchoolDiplomaYear{}\textsuperscript{e} année à \reportSchool{}} % \up should not be used as it is a custom internal command from french babel package which is not guaranted by the package

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

\ifbool{english}{
{\fontsize{14}{14}\selectfont \bf Academic Year \reportYear{}}

\vfill
\ifbool{pidr}
{\reportProjectCustomer{}}
{\ifbool{pi}
	{\reportIndustrialCustomer{}}
	{\ifbool{stage2a}
		{Second year internship done in partnership with \reportCompany{}}
		{Final year internship done in partnership with
			
			\reportCompany{}
			
			in preparation for the engineering diploma of \reportSchool{}}}}
}{
{\fontsize{14}{14}\selectfont \bf Année \reportYear{}}

\vfill

\ifbool{pidr}
  {\reportProjectCustomer{}}
  {\ifbool{pi}
    {\reportIndustrialCustomer{}}
	{\ifbool{stage1a}
		{Stage de première année réalisé dans l'entreprise \reportCompany{}}
		{\ifbool{stage2a}
			{Stage de deuxième année réalisé dans l'entreprise \reportCompany{}}
			{Stage de fin d'études réalisé dans l'entreprise \reportCompany{}

			en vue de l'obtention du diplôme d'ingénieur de \reportSchool{}}}}}
}

\vfill
\end{center}

\reportAuthor{} \\
\ifbool{pidr}
  {}
  {\ifbool{pi}
    {}
  {\reportAuthorAddress{} \\
    \reportAuthorCity{}\\
    \reportAuthorPhone{} \\
  }}
\reportAuthorEmail{} \\
\smallskip

\reportSchool{}\\
\reportSchoolAddress{},\\
\reportSchoolCity{}\\
\reportSchoolPhone{}\\
\email{\reportSchoolEmail}\\
\smallskip


\reportCompany{}\\
\reportCompanyAddress{}\\
\reportCompanyCity{}\\
\reportCompanyPhone{}  \hfill\smash{\raisebox{-0.5\normalbaselineskip}{\includeCompanyLogo{}}}%maybe you will need to modifie this line to suites better to the compagny logo size


\medskip

\ifbool{english}{
	\ifbool{pidr}
	{Encadrant : \reportSupervisor{}}
	{\ifbool{pi}
		{Industrial supervisor: \reportSupervisor{}
			
			Academic supervisor: \reportAcademicSupervisor{}}
		{Internship supervisor: \reportSupervisor{}
			
			Academic supervisor: \reportAcademicSupervisor{}}}
}{
\ifbool{pidr}
  {Encadrant : \reportSupervisor{}}
  {\ifbool{pi}
    {Encadrant industriel : \reportSupervisor{}

      Encadrant académique : \reportAcademicSupervisor{}}
  {\ifbool{stage1a}
    	{Maître de stage : \reportSupervisor{}}
    	{Maître de stage : \reportSupervisor{}

        Encadrant universitaire : \reportAcademicSupervisor{}}}}
}

\cleardoublepage
}
\makeatother
