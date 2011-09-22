\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{DarioBattistaGhilardi_Styles}
              [11/08/2007 v3.1 - Stile Latex per Tesi di Laurea presso il DTI -- by Roberto Aringhieri]

%%% \newif per le opzioni
%%%
\newif\if@correlatore \@correlatorefalse 									% per default non c'e' correlatore
\newif\if@linea \@lineafalse												% per default nessuna linea nelle header
\newif\if@titoliSinistra \@titoliSinistrafalse								% per default i titoli sono a destra
\newif\if@righeNumerate \@righeNumeratefalse								% per default le righe non sono numerate
\newif\if@righeNumeratePerPagina \@righeNumeratePerPaginafalse				% per default le righe non sono numerate
\newif\if@prefazione \@prefazionefalse										% per default nessuna prefazione
\newif\if@ringraziamenti \@ringraziamentifalse								% per default nessun ringraziamento

\newif\if@listaFigureInizio \@listaFigureIniziofalse						% per default nessuna lista figure
\newif\if@listaFigureFine \@listaFigureFinefalse							% per default nessuna lista figure
\newif\if@listaTabelleInizio \@listaTabelleIniziofalse						% per default nessuna lista tabelle
\newif\if@listaTabelleFine \@listaTabelleFinefalse							% per default nessuna lista tabelle

\newif\if@informatica \@informaticatrue										% se non indicato diversamente 
\newif\if@sicurezza \@sicurezzafalse										% e' una laurea
\newif\if@ts \@tsfalse														% in
\newif\if@magistrale \@magistralefalse										% informatica

%%% gestione delle opzioni da \documentclass
%%%
\PassOptionsToClass{12pt}{book}		
\PassOptionsToClass{a4paper}{book}	
\PassOptionsToClass{titlepage}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{correlatore}{\@correlatoretrue}
\DeclareOption{linea}{\@lineatrue}
\DeclareOption{titoliSinistra}{\@titoliSinistratrue}
\DeclareOption{prefazione}{\@prefazionetrue}
\DeclareOption{ringraziamenti}{\@ringraziamentitrue}
%\DeclareOption{listaFigureInizio} {
%	\@listaFigureFinefalse
%	\@listaFigureIniziotrue
%}
%\DeclareOption{listaFigureFine} {
%	\@listaFigureFinetrue
%	\@listaFigureIniziofalse
%}
%\DeclareOption{listaTabelleInizio} {
%	\@listaTabelleFinefalse
%	\@listaTabelleIniziotrue
%}
%\DeclareOption{listaTabelleFine} {
%	\@listaTabelleFinetrue
%	\@listaTabelleIniziofalse
%}
\DeclareOption{righeNumerate} {
	\@righeNumeratetrue
	\@righeNumeratePerPaginafalse
}
\DeclareOption{righeNumeratePerPagina} {
	\@righeNumeratefalse
	\@righeNumeratePerPaginatrue
}
\DeclareOption{informatica}{
	\@informaticatrue
	\@sicurezzafalse
	\@tsfalse
	\@magistralefalse
}
\DeclareOption{sicurezza}{
	\@informaticafalse
	\@sicurezzatrue
	\@tsfalse
	\@magistralefalse
}
\DeclareOption{ts}{
	\@informaticafalse
	\@sicurezzafalse
	\@tstrue
	\@magistralefalse
}
\DeclareOption{magistrale}{
	\@informaticafalse
	\@sicurezzafalse
	\@tsfalse
	\@magistraletrue
}
\ProcessOptions
\LoadClass{book}


%%% required packages
%%%
\RequirePackage{parskip}
\RequirePackage{epigraph}
\RequirePackage{lineno}
\RequirePackage[italian]{babel}  
\usepackage[utf8]{inputenc}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage[mathscr]{eucal}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{url}
\RequirePackage{rotating}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{floatflt}
\RequirePackage{listings}
\usepackage[usenames]{color}

\definecolor{light-gray}{gray}{0.50}

\lstset{language=PHP,
   keywords={wait,case,else,elseif,end,for,function,
      if,assign,while,foreach},
   basicstyle=\ttfamily\footnotesize,
   keywordstyle=\color{blue},
   commentstyle=\color{red},
   stringstyle=\color{magenta},
   numbers=left,
   numberstyle=\tiny\color{light-gray},
   stepnumber=1,
   numbersep=10pt,
   backgroundcolor=\color{white},
   tabsize=2,
   showspaces=false,
   showstringspaces=false,
   breaklines=true,
   xleftmargin=13pt,
   frame=single
} 

%% Epigraph settings
\setlength{\epigraphwidth}{.8\textwidth}

%%% new command definiti per inserire i dati del frontespizio
%%%
\newcommand{\TitoloTesi}[1]{\gdef\TitoloTesi{#1}}%
\newcommand{\CorsoDiLaurea}[1]{\gdef\CorsoDiLaurea{#1}}%
\newcommand{\Relatore}[1]{\gdef\Relatore{#1}}%
\newcommand{\Correlatore}[1]{\gdef\Correlatore{#1}}%
\newcommand{\Candidato}[1]{\gdef\Candidato{#1}}%
\newcommand{\Matricola}[1]{\gdef\Matricola{#1}}%
\newcommand{\AnnoAccademico}[1]{\gdef\AnnoAccademico{#1}}%

\if@informatica \CorsoDiLaurea{Informatica (Crema)} \else \fi
\if@sicurezza \CorsoDiLaurea{Sicurezza dei Sistemi e delle Reti Informatiche} \else \fi
\if@ts \CorsoDiLaurea{Tecnologie per la Societ\`a dell'Informazione} \else \fi
\if@magistrale \CorsoDiLaurea{Scienze e Tecnologie dell'Informazione} \else \fi

%%% sectioning renaming
%%%
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}

\renewcommand{\chaptermark}[1]{\markboth{\chaptername \ \thechapter. \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. \hspace{2mm} #1}}

%%% settaggi profondita numerazione sezioni e TOC
%%%
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}


%%% Impostazione dimensioni della pagina %textheight=29.7-3.5-2.0 = 24.2 cm
%%%
%\geometry{a4paper, includeheadfoot, twoside=true, nomarginpar, hmargin={3.0cm,2.0cm}, vmargin=2.0cm, 
%					headheight=.6cm, headsep=1.0cm, textheight=24.2cm}
\geometry{a4paper, includeheadfoot, twoside=true, nomarginpar, hmargin={3.0cm,2.0cm}, vmargin=2.0cm, 
					headheight=.6cm, headsep=1.0cm}%, footnotesep=1.0cm}

% Aggiungo comando mail
\newcommand{\mail}[1]{\href{mailto:#1}{\texttt{#1}}}

%%% definizione del frontespizio
%%%
\renewcommand{\maketitle}[1][]{
	\begin{center}
		\vspace*{-1.3cm}
		{\includegraphics{minerva} \par }
        {\Huge{\textsc{Universit\`a degli Studi di Milano}}  \par}
        {\Large{Facolt\`a di Scienze Matematiche, Fisiche e Naturali} \par}
        {\large{Corso di Laurea in \CorsoDiLaurea} \par}
        % TITOLO DELLA TESI
        \vskip 9em
        {\LARGE{\bfseries{\TitoloTesi}} \par}
        \vskip 9em
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}lcl}
			\large{RELATORE}: &  \\ 
			\noalign{\vskip2pt}
			\large{\Relatore} &  \\ 
			\noalign{\vskip8pt}
			\if@correlatore \large{CORRELATORE} \else \fi &  & \large{TESI DI LAUREA DI:} \\ 
			\noalign{\vskip2pt}
			\if@correlatore\large{\Correlatore} \else \fi & & \large{\Candidato} \\ 
			\noalign{\vskip2pt}
			& & \large{\Matricola}  
%			\\ 	\noalign{\vskip 9em} \\
%			\multicolumn{3}{c}{\large{\AnnoAccademico}}
		\end{tabular*}
		\vfill
		\large{\AnnoAccademico}
      \end{center}
  \setcounter{footnote}{0}%
}


%%% headers della pagina con fancyhdr
%%%

\addtolength{\headheight}{3pt}
\fancyhf{}                                %Clears all header and footer fields, in preparation.
\fancyhead[LE,RO]{\textbf{\thepage}}      %Displays the page number in bold in the header,
                                          % to the left on even pages and to the right on odd pages.
\fancyhead[RE]{\nouppercase{\leftmark}}   %Displays the upper-level (chapter) information---
                                          % as determined above---in non-upper case in the header, to the right on even pages.
\fancyhead[LO]{\nouppercase{\rightmark}}  %Displays the lower-level (section) information---as
                                          % determined above---in the header, to the left on odd pages.
\if@linea
	\renewcommand{\headrulewidth}{0.3pt}      
	\renewcommand{\footrulewidth}{0.3pt}      
\else
	\renewcommand{\headrulewidth}{0.0pt}      
	\renewcommand{\footrulewidth}{0.0pt}      
\fi

%%% opzione "titoliSinistra"
%%%
\if@titoliSinistra
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedleft \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedleft
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}
\else \fi

%%% avvio documento
%%%

\AtBeginDocument{%
	%% frontespizio
	\pagestyle{empty}
	\maketitle
	\cleardoublepage
	%% prefazione se prevista
	\pagenumbering{roman}
	\if@prefazione 
		\chapter*{Prefazione}
		\input{prefazione} 
		%\addcontentsline{toc}{chapter}{Prefazione} 
	\else \fi
	\if@ringraziamenti 
		\chapter*{Ringraziamenti}
		\input{ringraziamenti} 
		%\addcontentsline{toc}{chapter}{Ringraziamenti} 
	\else \fi
	%% TOC
	\tableofcontents
	%% LOF se prevista
	\if@listaFigureInizio 
		\listoffigures 
		\addcontentsline{toc}{chapter}{Elenco delle Figure} 
	\else \fi
	%% LOT se prevista
	\if@listaTabelleInizio 
		\listoftables 
		\addcontentsline{toc}{chapter}{Elenco delle Tabelle} 
	\else \fi
	\cleardoublepage
	%% testo della tesi
	\pagestyle{fancy}
	\pagenumbering{arabic}
	\if@righeNumerate \linenumbers \else \fi
	\if@righeNumeratePerPagina \pagewiselinenumbers \else \fi
}

\AtEndDocument{
	%% LOF se prevista
	\if@listaFigureFine 
		\listoffigures 
		\addcontentsline{toc}{chapter}{Elenco delle Figure} 
		\cleardoublepage
	\else \fi
	%% LOT se prevista
	\if@listaTabelleFine 
		\listoftables 
		\addcontentsline{toc}{chapter}{Elenco delle Tabelle} 
		\cleardoublepage
	\else \fi
}
