% This example document class is based on the Typesetting your
% academic CV in LaTeX by Dario Taraborelli.  The original article
% is avaiable at http://nitens.org/taraborelli/cvtex
%
% Additional modifications made by Robert Oakes.  Copyright 2009.

%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xetexCVhtml}[2009/11/15 - Modern looking resume which
uses the xetex typesetting system.]

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}
% \RequirePackage{xunicode}
% \RequirePackage{xltxtra}

\RequirePackage{graphicx}
\RequirePackage[colorlinks]{hyperref}
\hypersetup{linkcolor=blue,citecolor=blue,filecolor=black,urlcolor=blue} 

% Fonts
%\defaultfontfeatures{Mapping=tex-text}
%\setromanfont [Ligatures={Common},  ]{Linux Libertine O}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{%
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par}

\pagestyle{plain}
\hyphenpenalty=5000
\tolerance=1000

% CV and Contact Information
\def\@cvname{\relax}
\newcommand{\cvname}[1]{\gdef\@cvname{#1}}

\def\@cvimage{\relax}
\newcommand{\cvimage}[1]{\gdef\@cvimage{#1}}

\def\@institution{\relax}
\newcommand{\institution}[1]{\gdef\@institution{#1}}

\def\@contactaddress{\relax}
\newcommand{\contactaddress}[1]{\gdef\@contactaddress{#1}}

\def\@phonenumber{\relax}
\newcommand{\phonenumber}[1]{\gdef\@phonenumber{#1}}

\def\@faxnumber{\relax}
\newcommand{\faxnumber}[1]{\gdef\@faxnumber{#1}}

\def\@email{\relax}
\newcommand{\email}[1]{\gdef\@email{#1}}

\newcommand\@website{\relax}
\newcommand{\website}[1]{\gdef\@website{#1}}

\def\@homephonenumber{\relax}
\newcommand{\homephonenumber}[1]{\gdef\@homephonenumber{#1}}

\def\@personalemail{\relax}
\newcommand{\personalemail}[1]{\gdef\@personalemail{#1}}

% Set the Paper Size and Margins
\RequirePackage{geometry} 
\geometry{letterpaper, textwidth=5.5in, textheight=8.5in, marginparsep=1.0pt, marginparwidth=2.0in, margin=1.0in}
\setlength\parindent{0in}

% Spcial Commands for Fancy Characters and Years
%\newcommand{\amper}{{\fontspec[Scale=.95]{Hoefler Text}\selectfont\itshape\&}}
\newcommand{\years}[1]{(\emph{#1})}
\newcommand{\category}[1]{\textbf{#1}}

% Headings and Heading Fonts
\RequirePackage[normalem]{ulem}
\renewcommand\section{\@startsection{section}{1}{\z@}%
	{0pt}%
	{2em}%
	{\large\bfseries}}

\renewcommand\subsection{\@startsection{subsection}{1}{\z@}%
	{0pt}%
	{1em}%
	{\mdseries\bfseries}}

\newcommand{\cvsection}[1]{\section*{#1}\decorativeline}

\newcommand{\cvsubsection}[1]{\subsection*{#1}}

\reversemarginpar

\newcommand\makecvtitle{
	\ifthenelse{\equal{\@cvname}{\relax}}{}
	{\textsf{\LARGE\bfseries \@cvname}\decorativeline}
	\begin{minipage}{6in}
		\begin{minipage}[t]{3.5in}
			\ifthenelse{\equal{\@institution}{\relax}}{}{\bfseries\@institution\\}
			\mdseries\@contactaddress\\[0.2cm]
			\ifthenelse{\equal{\@phonenumber}{\relax}}{}{Phone: \texttt{\@phonenumber}\\}
			\ifthenelse{\equal{\@faxnumber}{\relax}}{}{Fax: \texttt{\@faxnumber}\\[0.2cm]}
			\ifthenelse{\equal{\@email}{\relax}}{}{Email: \href{mailto:\@email}{\@email}\\}
			\ifthenelse{\equal{\@website}{\relax}}{}{Website: \href{\@website}{\@website}\\}
		\end{minipage}
		\begin{minipage}[t]{2.5in}
			{\bfseries Additional contact information \\}
			\raggedright \ifthenelse{\equal{\@personalemail}{\relax}}{}{Personal email: \href{mailto:\@personalemail}{\@personalemail}\\}
			\ifthenelse{\equal{\@homephonenumber}{\relax}}{}{Home phone: \texttt{\@homephonenumber}\\}
		\end{minipage}
	\end{minipage}
	}
