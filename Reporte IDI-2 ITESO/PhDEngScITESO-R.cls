%%
%% PhDEngSCITESO-R.cls 2018/01/04 version 1.0.4

%%
%
%Available class options
%eg., \documentclass[XXXX]{PhDEngScITESO-R}
%
%  holdfloat - determines if all the floats are hold at their position 
%      or moved to the end of the document.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDEngScITESO-R}[2017/11/01 PhD Engineering Science ITESO Internal Research Report]

\LoadClass[letterpaper,12pt,twoside]{article}

\RequirePackage{etoolbox}

%Espacio de Ecuaciones. 
\usepackage{amsmath}
\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize
    \setlength\abovedisplayskip{1mm}
    \setlength\belowdisplayskip{1mm}
    \setlength\abovedisplayshortskip{0em}
    \setlength\belowdisplayshortskip{0em}
}

\RequirePackage{ifthen}

% color
\RequirePackage{xcolor}

% graphics
\RequirePackage{graphicx}

\RequirePackage{changepage}

% Estilos Generales Documento
\renewcommand{\baselinestretch}{1.5}
\setlength\parindent{1.25cm}
\setlength\parskip{0em}

%algorithms
\usepackage[ruled,vlined]{algorithm2e}
\usepackage{algpseudocode}

%captions packet
\RequirePackage{caption}

%Bibliography
\RequirePackage{cite}
\bibliographystyle{IEEEtran}

\let\oldthebibliography\thebibliography
\renewenvironment{thebibliography}[1]{
   \begin{oldthebibliography}{#1}
    \setlength{\parskip}{6pt}
    \setstretch{1}\fontsize{11.0}{11.0}\selectfont\vspace{1em}
  }
 {
  \end{oldthebibliography}
 }

\def\bibindent{1em}
\let\old@biblabel\@biblabel
\def\@biblabel#1{\old@biblabel{#1}\kern\bibindent}


%definitions
\def\abstractname{Abstract}

%Diseño de la pagina
\usepackage[T1]{fontenc}
\usepackage[letterpaper, tmargin=24.4mm,bmargin=27.4mm,lmargin=1in,rmargin=1in,footskip=2em]{geometry}  %https://es.sharelatex.com/learn/Page_size_and_margins#Paper_size.2C_orientation_and_margins 
%\usepackage{showframe} %Dibujar los margenes.
\usepackage{setspace}
\usepackage{ragged2e}
\usepackage{indentfirst}

% headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

%\fancyheadoffset{1mm}
%\fancyfootoffset{1mm}

\fancyheadoffset[L]{3mm}
\fancyheadoffset[R]{-3mm}
\fancyfootoffset[L]{3mm}
\fancyfootoffset[R]{-3mm}


\renewcommand{\headrulewidth}{0.4pt} % grosor línea del header
\renewcommand{\footrulewidth}{0.4pt} % grosor línea del pie de página

\fancyfoot{}

\fancyhead[COE]{\fontsize{10}{8}\selectfont \textls[-65]{\textsc{Doctoral Program in Engineering Sciences at} ITESO}}
\setlength{\skip\footins}{0pt}
\fancyfoot[LO]{\fontsize{10}{1}\selectfont ITESO}
\fancyfoot[CO]{\fontsize{10}{1}\selectfont\thepage}
\fancyfoot[RO]{\fontsize{10}{1}\selectfont\@reportid}

\fancyfoot[RE]{\fontsize{10}{1}\selectfont ITESO}
\fancyfoot[CE]{\fontsize{10}{1}\selectfont\thepage}
\fancyfoot[LE]{\fontsize{10}{1}\selectfont\@reportid}

\fancypagestyle{cover}{%
	\fancyhf{} % clear all header and footer fields
	\lfoot{}
	\cfoot{}
	\rfoot{}
}

\fancypagestyle{firstpage}{%
	\fancyhf{} % clear all header and footer fields
    \fancyfoot[L]{\fontsize{10}{1}\selectfont ITESO}
    \fancyfoot[C]{\fontsize{10}{1}\selectfont\thepage}
    \fancyfoot[R]{\fontsize{10}{1}\selectfont\@reportid}	
	\renewcommand{\headrulewidth}{0pt}
}



\usepackage{mathptmx} %Agregamos para la letra Time New Roma
\usepackage{lipsum} %Solo añade texto para pruebas usando \lipsum[1]

%Appendix of Files
\usepackage{newfloat}
\DeclareFloatingEnvironment[placement={!hb},name=AppendixFile]{appendixfile}


%Mover Imagenes al final
\providetoggle{holdfloat}
\settoggle{holdfloat}{false}
	
\DeclareOption{holdfloat}{
	\settoggle{holdfloat}{true}
}
\ProcessOptions\relax

\iftoggle{holdfloat}{}{
	\usepackage[nolists,nomarkers,tablesfirst]{endfloat}
	\renewcommand{\efloatseparator}{\mbox{}}
	\DeclareDelayedFloat{algorithm}{Algorithm}
	\DeclareDelayedFloat{appendixfile}{AppendixFiles}
	\SetupDelayedFloat{appendixfile}{nolist,nohead}
}


%BlankPage 
\def\blankpage{%
      \clearpage%
      \thispagestyle{empty}%
      \addtocounter{page}{-1}%
      \null%
      \clearpage}


%href for email
\usepackage[colorlinks=true,linkcolor=black,urlcolor=blue,citecolor=black]{hyperref}

%reduce space between letters and lines
\usepackage{microtype}

% Fields definition
\renewcommand*{\author}[1]{\def\@author{#1}}
\renewcommand*{\title}[1]{\def\@title{#1}}
\newcommand*{\reportid}[1]{\def\@reportid{#1}}
\newcommand*{\reportDate}[1]{\def\@reportDate{#1}}
\newcommand*{\reportYear}[1]{\def\@reportYear{#1}}
\newcommand*{\city}[1]{\def\@city{#1}}
\newcommand*{\country}[1]{\def\@country{#1}}
\newcommand*{\zipcode}[1]{\def\@zipcode{#1}}
\newcommand*{\tel}[1]{\def\@tel{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\itesoshield}[1]{\def\@itesoshield{#1}}
\newcommand*{\reportkeywords}[1]{\def\@reportkeywords{#1}}
\renewcommand*{\thanks}[1]{\def\@thanks{#1}}

%Thanks
\renewcommand\footnoterule{}
\newcommand\blfootnote[1]{%
	\begingroup
	\renewcommand\thefootnote{}\footnote{#1}%
	\addtocounter{footnote}{-1}%
	\endgroup
}
\patchcmd{\@footnotetext}{\footnotesize}{\small\sffamily}{}{}


%Setting section
\renewcommand{\thesection}{\Roman{section}.}
\renewcommand\section{%
  \@startsection{section}  % Name
  				{1}        % Level
                {\z@}      % Ident
                {6pt}    % Before Skip
                {6pt}    % After Skip
                {\centering\normalfont\normalsize\MakeUppercase}% Style
}

%Setting subsection
\renewcommand{\thesubsection}{\Alph{subsection}.}
\renewcommand\subsection{%
  \@startsection{subsection}
                {1}
                {\z@}%
                {1.0ex}%
				{1.0ex}%
                {\normalfont\normalsize\textit}% normal size, boldface
}

\renewcommand{\thesubsubsection}{\Alph{subsection}.\arabic{subsubsection}}
\renewcommand\subsubsection{%
  \@startsection{subsubsection}
                {1}
                {\z@}%
                {1.0ex}%
				{1.0ex}%
                {\normalfont\normalsize\textit}% normal size, boldface
}

%tables style
\renewcommand*\thetable{\Roman{table}}
\DeclareCaptionFormat{tableCap}{#1\\\uppercase{#3}\par}
\captionsetup[table]{name=TABLE , format=tableCap}
\AtBeginEnvironment{tabular}{\setstretch{1.3}\selectfont}

\DeclareCaptionFormat{appendixTable}{\\\uppercase{#3}\par}
\captionsetup[appendixfile]{name=Appendix , format=appendixTable}

%Img style
\DeclareCaptionFormat{figCap}{\vspace{-10mm}\justify\hspace{1.0cm}#1#2\hspace{3mm}#3\par}
\captionsetup[figure]{name=Fig., format=figCap, labelsep = period}
\captionsetup[subfigure]{format=plain, labelformat=brace}


% Cover Page
\newcommand{\makeitesocoverpage}[0]{
	\thispagestyle{cover}
	%\addtocounter{page}{-1}
	\setstretch{1.0}
	\begin{center}
	{\fontsize{12}{18}\selectfont 
	\textls[-65]{\textbf{\textsc{Doctoral Program in Engineering Sciences at} ITESO}}}
	\\[18pt]
	{\fontsize{12}{18}\selectfont \textls*[10]{\MakeUppercase{\@title}}}
	\\[12pt]
	{\fontsize{12}{18}\selectfont \@author}
	\\[12pt]
	{\fontsize{12}{18}\selectfont \@reportid}
	\\[12pt]
	{\fontsize{12}{18}\selectfont \@reportDate}	
	\\
	{\fontsize{12}{18}\selectfont Tlaquepaque, Mexico 45604}
	\\[12pt]
	{\fontsize{12}{18}\selectfont Doctoral Program in Engineering Sciences}
	\\
	{\fontsize{12}{18}\selectfont ITESO (\textit{Instituto Tecnol\'{o}gico y de Estudios Superiores de Occidente})}
	\\[13pt]
		%\begin{figure*}[h!]
		\centering
  		\includegraphics[width=1.67in, height=1.67in]{\@itesoshield}
		%\end{figure}

	\vfill
%	\vfill
 	{\fontsize{12}{18}\selectfont \textcopyright\ \@author\ \@reportYear}
	\end{center}
	\vspace{0pt} %*** cambio realizado (de 4->0)
	\setstretch{0.8}
	\justify
	{\fontsize{9}{18}\selectfont
	\fontdimen2\font=0.5ex% inter word space %***cambio solicitado
    \fontdimen3\font=0.4em% inter word stretch %***cambio solicitado
	No part of this document may be copied, translated, transcribed or entered in any form into any machine without written permission. Address inquires in this regard to the authors or to the Chair of the Doctoral Program in Engineering Sciences at  \ ITESO \ (\href{mailto:dci@iteso.mx}{dci@iteso.mx}). Excerpts may be quoted for scholarly purposes with full acknowledgment of source. This document may not be lent or circulated without this cover page.}
	\thispagestyle{empty}
	\blankpage
}

% Report header
\newcommand{\makeitesotitle}[0]{
    \thispagestyle{empty}
	\addtocounter{page}{-1}
	\newpage
	\thispagestyle{firstpage}
	\setstretch{1.0}
	\begin{center}
	{\fontsize{12}{18}\selectfont \textls*[10]{\MakeUppercase{\@title}}}
	\\[12pt]
	{\fontsize{12}{18}\selectfont \@author}
	\\[12pt]
	{\fontsize{12}{18}\selectfont \@reportDate}
	\\[12pt]
	{\fontsize{12}{18}\selectfont Doctoral Program in Engineering Sciences}
	\\
	{\fontsize{12}{18}\selectfont ITESO (\textit{Instituto Tecnol\'{o}gico y de Estudios Superiores de Occidente})}
	\\[12pt]
	{\fontsize{12}{18}\selectfont Tlaquepaque, Mexico}{\fontsize{12}{18} 45604}
	\\
	{\fontsize{12}{18}\selectfont Tel: +52 33 3669 3598}
	\\
	{\fontsize{12}{18}\selectfont E-mail: \href{mailto:dci@iteso.mx}{dci@iteso.mx}}
	\\[12pt]
	\end{center}
	\blfootnote{\justify\normalfont\fontsize{10}{12}\selectfont\setstretch{1.0}\@thanks}
}

\renewcommand{\maketitle}[0]{
	\makeitesocoverpage
	%\blankpage
	\makeitesotitle
    \vspace{-15mm}
	\setstretch{1.45}  
	%\onehalfspacing
	\justify
	\vspace{4mm}
    %\par\addvspace{\baselineskip} % *** añadí esta linea
    %\addvspace{16pt} %*** añadí esta linea
}

%Keywords
\newenvironment{keywordsEnv}{\vspace{-5mm}\begin{adjustwidth}{2.5cm}{}\begin{itshape}}{\end{itshape}\end{adjustwidth}}

\def\IEEEkeywords{\vspace{0mm}\textit{Keywords}\setstretch{1.0}\begin{keywordsEnv}}
\def\endIEEEkeywords{\end{keywordsEnv}\relax\normalfont\normalsize \vspace{2mm}}

%Abstract
\def\abstract{\centering\normalfont{\vspace{0mm}\abstractname}\justify\normalfont\normalsize\vspace{-1mm}}
\def\endabstract{\relax\normalfont\normalsize\vspace{2mm}} 


%Appendix of Files used Command
\usepackage{array}
\usepackage{boldline}
\newcommand{\makeappendixfilesused}[1]{
        \caption{APPENDIX OF FILES USED}
	    \centering
	    \def\arraystretch{0.5}%
	    \begin{tabular}{|>{\fontsize{10}{9}\selectfont}p{5cm}|>{\fontsize{10}{9}\selectfont}p{2cm}|>{\fontsize{10}{9}\selectfont}p{7cm}|}
    		\hlineB{4} 
		    \fontsize{12}{11}\selectfont Filename & \fontsize{12}{11}\selectfont Author & \fontsize{12}{11}\selectfont Short Description \\ 
		    \hlineB{4}
		        #1
		    \hline
	    \end{tabular}	
}

