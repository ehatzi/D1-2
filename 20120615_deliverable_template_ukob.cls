\NeedsTeXFormat{LaTeX2e}[2003/12/01]
\ProvidesClass{LiveGov}[2012/06/15 v01 Live+Gov deliverables and documents]


\RequirePackage{ifpdf}

\newif\ifInternalDeliverable\InternalDeliverabletrue
\newif\ifOtherDocument\OtherDocumentfalse

\newcommand{\LiveGovTwentyTitleFonts}{\fontsize{20}{24}\selectfont}
\newcommand{\LiveGovThirtyTitleFonts}{\fontsize{30}{34}\selectfont}

\DeclareOption{external}{\InternalDeliverablefalse\OtherDocumentfalse}
\DeclareOption{internal}{\InternalDeliverabletrue\OtherDocumentfalse}
\DeclareOption{other}{\OtherDocumenttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% this class is based on report.cls
\LoadClass[12pt,a4paper]{report}

%\listfiles

% do not indent footnotes
\RequirePackage[hang]{footmisc}[2003/01/27]
\renewcommand{\footnotemargin}{0pt}

% from report.cls (modify section header)
\renewenvironment{thebibliography}[1]
     {\chapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}


% for pdflatex
\newif\ifpdf\ifx\pdfoutput\undefined\pdffalse\else\pdftrue\fi



\RequirePackage{graphicx} % for png, jpg etc
\ifpdf
 \DeclareGraphicsExtensions{.pdf,.png,.jpg} % default extensions

 \RequirePackage[pdftex,
  a4paper=true,
  colorlinks=true,
  urlcolor=urlcol, % URL: http://
  citecolor=bibcol, % bibTeX
  linkcolor=linkcol, % sections, footnotes, ...
  pagecolor=linkcol, % links to other pages
  filecolor=filecol, % URL: file:/
  setpagesize=false,
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={},
  pagebackref=false,
  pdfpagemode=UseOutlines,
  pdfstartview={XYZ 1000},
  bookmarksopen=false]{hyperref}

\RequirePackage{color}
 %\definecolor{linkcol}{rgb}{0.75,0,0}
 \definecolor{linkcol}{rgb}{0,0,0}
 %\definecolor{bibcol}{rgb}{0,0.5,0}
 \definecolor{bibcol}{rgb}{0,0,0}
 \definecolor{urlcol}{rgb}{0,0,0.75}
 \definecolor{filecol}{rgb}{0,0,0.75}
 \definecolor{LGblue}{rgb}{0.79,0.89,1}
 \definecolor{LGgrey}{rgb}{0.90,0.90,0.90}


\RequirePackage{colortbl}


\else
 \DeclareGraphicsExtensions{.eps,.ps}
\fi


% using PS fonts instead of cmr
\RequirePackage{times}[2004/01/26]
% PS fonts also for mathematic formulas
\RequirePackage{mathptmx}[2004/01/26]

% modifying the page headers and footers
\RequirePackage{fancyhdr}

\RequirePackage{alltt} [1997/06/16]
\RequirePackage{url}\urlstyle{same}

% we need the number of pages for the title page
\RequirePackage{lastpage}[1994/06/25]

\setlength{\textwidth}{161mm}
\setlength{\oddsidemargin}{0mm} % 25.4 + 2.8 = 28.2
\if@twoside
 \setlength{\evensidemargin}{0mm}
\fi
\setlength{\textheight}{247mm}
\setlength{\topmargin}{-12mm}

\def\contentsname{\centerline{Table of Contents}}


% no paragraph indentation
\RequirePackage{parskip}[2001/04/09]

\ifpdf
 \RequirePackage{pdflscape}[2001/02/04]
\else
 \RequirePackage{lscape}[2000/10/22]
\fi


% we modify the layout of the TOC
\RequirePackage{titletoc}[2002/03/27]

% Code inclusion
%\RequirePackage{fancyvrb}[2000/03/21]
\RequirePackage{fancyvrb}[1998/07/17]
\fvset{fontsize=\scriptsize,xleftmargin=5mm}


% layout of TOC entries
\titlecontents{chapter} [6mm] % indent
    {} %
    {\sf\bfseries\contentslabel{6mm}} % before with label
    {\hspace*{6mm}} % before without label
    {\titlerule*[5pt]{\bf .}\sf\bfseries\contentspage}[\addvspace{3mm}]

\titlecontents{section} [16mm] % indent
    {} %
    {\small\contentslabel{8mm}} % before with label
    {\hspace*{-8mm}} % before without label
    {\titlerule*[5pt]{.}\small\contentspage}[\addvspace{2mm}]

\titlecontents{subsection} [24mm] % indent
    {} %
    {\small\contentslabel{10mm}} % before with label
    {\hspace*{-10em}} % before without label
    {\titlerule*[5pt]{.}\small\contentspage}[\addvspace{2mm}]

\titlecontents{subsubsection} [32mm] % indent
    {} %
    {\small\contentslabel{14mm}} % before with label
    {\hspace*{-14mm}} % before without label
    {\titlerule*[5pt]{.}\small\contentspage}[\addvspace{2mm}]

\titlecontents{paragraph} [40mm] % indent
    {} %
    {\small\contentslabel{17mm}} % before with label
    {\hspace*{-40mm}} % before without label
    {\titlerule*[5pt]{.}\small\contentspage}[\addvspace{2mm}]

\titlecontents{subparagraph} [48mm] % indent
    {} %
    {\small\contentslabel{20mm}} % before with label
    {\hspace*{-40mm}} % before without label
    {\titlerule*[5pt]{.}\small\contentspage}[\addvspace{2mm}]

\setcounter{secnumdepth}{7} % number all section levels
\setcounter{tocdepth}{7} % also in the table of contents


% layout of section headers
\renewcommand\chapter{\@startsection {chapter}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {1ex \@plus.2ex}%
                                   {\large\sffamily\bfseries}}

\renewcommand\section{\@startsection {section}{2}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     %{\normalsize\itshape}}
                                      {\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{4}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize}}
\renewcommand\paragraph{\@startsection{paragraph}{5}{\z@}%
                                    {- 3.00ex\@plus -0.5ex \@minus -.15ex}%
                                    {1.2ex \@plus .1ex}%
                                    {\normalfont\normalsize\itshape}}
\renewcommand\subparagraph{\@startsection{subparagraph}{6}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\itshape}}


% tables and figures are counted for the whole document,
% not only for the current chapter

%Date: Sat, 30 Jul 1994 17:58:55 PST
%From: Donald Arseneau <asnd@erich.triumf.ca>
%
%  \@removefromreset{FOO}{BAR} : Removes counter FOO from the list of
%                       counters \cl@BAR to be reset when counter BAR
%                       is stepped.  The opposite of \@addtoreset.

\def\@removefromreset#1#2{\let\@tempb\@elt
   \expandafter\let\expandafter\@tempa\csname c@#1\endcsname
   \def\@elt##1{\expandafter\ifx\csname c@##1\endcsname\@tempa\else
         \noexpand\@elt{##1}\fi}%
   \expandafter\edef\csname cl@#2\endcsname{\csname cl@#2\endcsname}%
   \let\@elt\@tempb}

\@removefromreset{figure}{chapter}
\@removefromreset{table}{chapter}

% redefining as well the figure and table caption command
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}

%\renewcommand{\fnum@figure}{\emph{Figure~\thefigure}}

\@removefromreset{footnote}{chapter}

% provide the Live+Gov commands (and defining default values)
\def\@LGcontractdate{(as specified in the contract)}
\def\LGcontractdate#1{\def\@LGcontractdate{#1}}

\def\@LGactualdate{}
\def\LGactualdate#1{\def\@LGactualdate{#1}}

\def\@LGstaffmonths{}
\def\LGstaffmonths#1{\def\@LGstaffmonths{#1}}

\def\@LGdissemination{(Public / Restricted to other programme
participants (including the Commission Services) / Restricted to a
group specified by the consortium (including the Commission Services)
/ Confidential, only for members of the consortium (including the
Commission Services).)

(If Confidential then also add: The information contained in this deliverable is confidential and may be used only for information purposes by Community Institutions to whom the Commission of the European Communities has supplied it.)
}
\def\LGdissemination#1{\def\@LGdissemination{#1}}


\def\@LGnumber{WP.NR}
\def\LGnumber#1{\def\@LGnumber{#1}}

\def\@LGtitle{Give a title}
\def\LGtitle#1{\def\@LGtitle{#1}
\ifpdf
 \hypersetup{pdftitle={#1}}
\fi
}


\def\@LGwp{WPx Nnn}
\def\LGwp#1{\def\@LGwp{#1}}

\def\@LGsubtask{Sx.y.z Nnnn}
\def\LGsubtask#1{\def\@LGsubtask{#1}}

\def\@LGtask{}
\def\LGtask#1{\def\@LGtask{#1}}
\def\@LGtype{}
\def\LGtype#1{\def\@LGtype{#1}}

\def\@LGnature{Software/Report/\dots}
\def\LGnature#1{\def\@LGnature{#1}}

\def\@LGstatus{$<$ Draft $|$ PMB Final Draft $|$ Approved $>$}
\def\LGapproved{\def\@LGstatus{Approved}}
\def\LGfinal{\def\@LGstatus{PMB Final Draft}}


\def\@LGversion{00}
\def\LGversion#1{\def\@LGversion{#1}}

\def\@LGdistribution{}
\def\LGdistribution#1{\def\@LGdistribution{#1}}

\def\@LGkeywords{}
\def\LGkeywords#1{\def\@LGkeywords{#1}
\ifpdf
 \hypersetup{pdfkeywords={#1}}
\fi
}


\def\@LGabstract{}
\newcommand\LGabstract[1]{\def\@LGabstract{#1}}



%\def\@LGhistory{}
%\def\LGhistory#1#2#3#4{\let\@tmphist=\@LGhistory
%   \edef\@LGhistory{\@tmphist \hline #1 & #2 & #3 & #4 \\ } }
%\def\LGhistory#1{\edef\@tmphist{\@LGhistory}
%   \def\@LGhistory{\@tmphist \hline #1 \\ } }
%\newcommand{\@LGhistory}{}
%\newcommand{\LGhistory}[1]{\edef\@tmphist{\@LGhistory}
%   \renewcommand\@LGhistory{\@tmphist \hline #1 \\ } }


% Version history table
\newenvironment{LGhistory}{%
 \chapter*{History}
 \begin{tabular}{|p{15mm} | p{21mm} | p{63mm} | p{38mm} | }
 \hline
 \bf Version & \bf Date & \bf Reason & \bf Revised by \\
 \hline
}
{\hline\end{tabular}}

\newcommand{\LGaddhistory}[4]{\hline #1 & #2 & #3 & #4 \\ }



% Author table
\newenvironment{LGauthors}{%
 \chapter*{Author list}
 \begin{tabular}{|p{26mm} | p{40mm} | p{76mm}  | }
 \hline
 \bf Organization & \bf Name & \bf Contact Information \\
 \hline
}
{\hline\end{tabular}}

\newcommand{\LGaddauthor}[5]{\hline  #1 &  #2 & %
   \parbox{3em}{Phone:} #3 \newline %
   \parbox{3em}{Fax:} #4 \newline %
   \parbox{3em}{E-mail:} \small #5 \\
}



\newenvironment{LGExecutiveSummary}{%
 \clearpage\chapter*{Executive Summary}\label{summary}
 }
 {}

\newenvironment{LGAbbreviations}{%
 \clearpage\chapter*{Abbreviations and Acronyms}\label{abbrlist}%
 \begin{tabular}{l l}%
 }
 {\end{tabular}}

\newcommand{\LGaddabbreviation}[2]{#1 & #2 \\}

%\newcommand{\LGTOC}{\clearpage\tableofcontents\clearpage\listoffigures}
\newcommand{\LGTOC}{\clearpage\tableofcontents\clearpage\listoffigures\listoftables}


%\newenvironment{LGGlossary}{%
% \clearpage\chapter{Glossary}\label{glossary}}{\clearpage}

\newcommand{\LGaddterm}[2]{\emph{#1}\par  #2 \par\medskip}

\ifInternalDeliverable
 \newcommand{\@LGdoctype}{\bf{ID}}
\else
 \newcommand{\@LGdoctype}{\bf{D}}
\fi

% for TitlePage!
\ifInternalDeliverable
 \newcommand{\@LGtitledoctype}{\Huge \bf{ID}}
\else
 \newcommand{\@LGtitledoctype}{\Huge \bf{D}}
\fi


% to be used only if there is no bibtex-file
\newenvironment{LGreferences}{%
 \begin{thebibliography}{99}%
}{\end{thebibliography}}

% 1 bibtex code
% 2 author(s)
% 3 title
% 4 publisher, city
% 5 year
\newcommand{\LGbook}[5]{
  \bibitem{#1}
  \ifx #2\@empty\else#2.\fi
  \newblock {\em {#3}}. #4\ifx #5\@empty\else, #5\fi.

}

% 1 bibtex code
% 2 author(s)
% 3 title
% 4 journal, number & volume
% 5 year
% 6 pages
\newcommand{\LGjournalarticle}[6]{
  \bibitem{#1}
  #2.
  \newblock #3. In {\em {#4}}. #5, pp #6.

}


% 1 bibtex code
% 2 author(s)
% 3 title
% 4 editor
% 5 booktitle
% 6 publisher, city
% 7 year
% 8 pages
\newcommand{\LGbookarticle}[8]{
  \bibitem{#1}
  #2.
  \newblock #3. In #4 (ed.) {\em {#5}}. #6, #7, pp #8.

}



\newcommand{\LiveGov}{\bf{Live+Gov}}
\newcommand{\LiveGovLogo}{\includegraphics[height=3ex]{LiveGovLogo}}

% Titlepage etc
\AtBeginDocument{
\thispagestyle{TPstyle}
\begin{center}
\begin{tabular}{@{\hspace{0.9cm}}m{2cm}@{\hspace{0.5cm}}m{2cm}@{\hspace{0.5cm}}}
\centering
 &
\end{tabular}
\end{center}
\begin{center}
\includegraphics[width=10.09cm]{LiveGovLogo}\\
\indent
\par
\indent
\fontfamily{verdana}\selectfont
\begin{large} %\bfseries {\LiveGovTwentyTitleFonts \bf{Live+Gov}}
\normalfont\\\normalsize Reality Sensing, Mining and Augmentation \\
for Mobile Citizen–Government Dialogue\\
FP7-288815 \normalsize \par
\begin{center}
\begin{tabular}{@{\hspace{0.9cm}}m{2cm}@{\hspace{0.5cm}}m{2cm}@{\hspace{0.5cm}}}
\centering
 & \\
 &
\end{tabular}
\end{center}
\indent
\ifOtherDocument
  \@LGwp
  \ifx\@LGsubtask\@empty\else\ (\@LGsubtask)\fi
  \par
\else
%  \@LGtitledoctype\@LGnumber\par
\fi
\@LGtitle\par
\end{large}
\end{center}

\bigskip

\ifpdf
 \ifOtherDocument
   \hypersetup{pdfsubject={FP7-288815 Live+Gov \@LGwp}}
 \else
   \hypersetup{pdfsubject={FP7-288815 Live+Gov \@LGdoctype\@LGnumber}}
 \fi
\fi


\ifOtherDocument
\else
\def\TBheight{\rule{0mm}{5mm}}
\def\EMPTY{\rule{0mm}{1ex}}
\noindent

\begin{tabular}{| >{\columncolor{LGblue}}p{.35\textwidth} | p{.58\textwidth} |}
\hline

\ifInternalDeliverable
 \TBheight\hfill\bf Dissemination level: & Internal Deliverable \\
 \hline
 \TBheight\hfill\bf Workpackage / Task / \newline \EMPTY\hfill Subtask:
  & \@LGwp \newline  \@LGsubtask \\
  \hline
\else
 \TBheight\hfill\bf Dissemination level: & \@LGdissemination \\
 \hline
 \TBheight\hfill\bf Contractual date of delivery: & \@LGcontractdate \\
 \hline
 \TBheight\hfill\bf Actual date of delivery: & \@LGactualdate \\
 \hline

 \TBheight\hfill\bf Workpackage: & \@LGwp \\
 \hline
% \TBheight\hfill\bf Estimated Staff Months: & \@LGstaffmonths \\

\fi

\TBheight\hfill\bf Task: & \@LGtask \\
\hline
\TBheight\hfill\bf Type: & \@LGtype \\
\hline
%\TBheight\hfill\bf Nature: & \@LGnature \\
\TBheight\hfill\bf Approval Status: & \@LGstatus \\
\hline
\TBheight\hfill\bf Version: & \@LGversion \\
\hline
% \TBheight\hfill\bf Distribution List: & \@LGdistribution \\
\TBheight\hfill\bf Number of pages: & \pageref{LastPage} \\
\hline
\TBheight\hfill\bf Filename: & \jobname.tex \\
% \TBheight\hfill\bf Keyword list: & \@LGkeywords \\
\hline
%\multicolumn{2}{| p{.96\textwidth} |}{{\bf Abstract}\par \@LGabstract} \\
\multicolumn{2}{| p{.96\textwidth} |}{{\bf Abstract} \newline \@LGabstract} \\
\hline
\ifInternalDeliverable\else
\multicolumn{2}{| p{.96\textwidth} |}{\footnotesize The information in this document reflects only the
author's views and the European Community is not liable for any use
that may be made of the information contained therein. The information
in this document is provided as is and no guarantee or warranty is
given that the information is fit for any particular purpose.  The
user thereof uses the information at its sole risk and liability.}\\
\hline
\fi
\end{tabular}

\bigskip


\begin{center}
\begin{tabular}{@{\hspace{0.9cm}}m{2cm}@{\hspace{0.5cm}}m{2cm}@{\hspace{0.5cm}}}
\centering
 & \\
 & \\
 \includegraphics[height=17.8mm]{FP7} & \includegraphics[height=11.2mm]{eu-flag}
\end{tabular}
\begin{center}
This work was supported by the EU 7th Framework Programme under grant number IST-FP7-288815 in project Live+Gov (\url{www.liveandgov.eu})
\end{center}
\end{center}


\vfill

Copyright 2013 Live+Gov Consortium consisting of:
\begin{itemize}
\item Universität Koblenz-Landau
\item Centre for Research and Technology Hellas
\item Yucat BV
\item Mattersoft OY
\item Fundacion BiscayTIK
\item EuroSoc GmbH
\end{itemize}

This document may not be copied, reproduced, or modified in whole or in part for any purpose without written permission from the Live+Gov Consortium. In addition to such written permission to copy, reproduce, or modify this document in whole or part, an acknowledgement of the authors of the document and all applicable portions of the copyright notice must be clearly referenced.

All rights reserved.


\newpage
\fi
}

\pagestyle{fancy}

% page style
\addtolength{\headheight}{3.2pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhead{} % emptying headers and footers
\fancyfoot{}

\ifOtherDocument
  \if@twoside
    \fancyhead[RE,LO]{\@LGtitle{}\ \ - V\@LGversion}
  \else
    \fancyhead[R]{\@LGtitle{}\ \ - V\@LGversion}
  \fi
\else
  \if@twoside
    \fancyhead[RE,LO]{\@LGdoctype\@LGnumber{}\ \ - V\@LGversion}
  \else
    \fancyhead[R]{\@LGdoctype\@LGnumber{}\ \ - V\@LGversion}
  \fi
\fi

\if@twoside
 \fancyhead[LE,RO]{Live+Gov}
\else
% \fancyhead[L]{Live+Gov}
\fancyhead[L]{\includegraphics[height=8.6mm]{LiveGovLogoSmall}}
\fi

\ifInternalDeliverable
 \if@twoside
  \fancyfoot[LE,RO]{Page \thepage}
 \else
  \fancyfoot[R]{Page \thepage}
 \fi
 \fancyfoot[C]{Live+Gov Internal Use Only}
\else
 \fancyfoot[C]{Page \thepage}
\fi

% Style of the title page
\fancypagestyle{TPstyle}{%
\fancyhead{} % clear all header and footer fields
\fancyfoot{}
\renewcommand{\footrulewidth}{0.4pt}
%\ifOtherDocument
  \fancyhead[R]{}
%\else
%  \if@twoside
%    \fancyhead[RE,LO]{\@LGdoctype\@LGnumber}
%  \else
%    \fancyhead[R]{\@LGdoctype\@LGnumber}
% \fi
%\fi

%\fancyhead[L]{Live+Gov}
\ifInternalDeliverable
 \fancyfoot[R]{Page \thepage}
 \fancyfoot[C]{Live+Gov Internal Use Only}
\else
 \fancyfoot[C]{Page \thepage}
\fi
}

\renewcommand{\bibname}{References}
\bibliographystyle{plain}
