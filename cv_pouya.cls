%!TEX TS-program = xelatex
%!TEX encoding = UTF-8 Unicode
% Pouya's CV Latex class
% Copyright (C) 2022 Pouya Abbasi <me@pouyacode.net>
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

\author{Pouya Abbasi}
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv_pouya}[2025/06/18 Pouya's CV Class]
\RequirePackage[a4paper, left=1cm,top=0.75cm,right=1cm,bottom=1cm]{geometry}
\RequirePackage[default,light,semibold]{sourcesanspro}
\setsansfont{Source Sans Pro}
\RequirePackage{fontawesome5}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{paracol}
\RequirePackage{multicol}
\RequirePackage{moresize}
\RequirePackage{tcolorbox}
\RequirePackage[top]{background}

%Setup
\SetBgContents{\includegraphics{images/header}}
\SetBgScale{0.475}

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setjobtitle}[1]{\def\@jobtitle{#1}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setwebsite}[1]{\def\@website{#1}}
\newcommand*{\setgit}[1]{\def\@git{#1}}

%Header columns
\newcommand{\lratio}{0.8}
\newlength{\leftcolwidth}
\setlength{\leftcolwidth}{\lratio\textwidth}
\newcommand{\rratio}{0.2}
\newlength{\rightcolwidth}
\setlength{\rightcolwidth}{\rratio\textwidth}

\definecolor{color1}{HTML}{23221f}
\definecolor{color2}{HTML}{fff7e6}
\definecolor{color3}{HTML}{008800}
\definecolor{color4}{HTML}{888888}
\colorlet{bodycolor}{color1}
\colorlet{headercolor}{color2}
\colorlet{primarycolor}{color3}
\colorlet{secondarycolor}{color4}

\pagenumbering{gobble}

% Header
\newcommand\headerview{
  \hspace{-2.2em}
  \vspace{-0.5cm}{
    \color{headercolor}
    \setlength{\columnsep}{0pt}
    \columnratio{\lratio}
    \begin{paracol}{2}
      \begin{leftcolumn}
        \hspace{-2.2em}
        \begin{minipage}[r]{\leftcolwidth}
          \name{}
          \summary{
            \bfseries
            Expert full stack software engineer, passionate about cutting edge technologies and a huge fan of Free-Software and Security.\\\\
            Successfully designed and managed a Patent Approved service using image processing technologies.\\
            Have experience in startups and established organizations, turning business requirements to product. Developing and maintaining medium-sized software with small and medium-size groups of high-functioning engineers while mentoring less-experienced ones in different industries, each with their unique customers and their demands.\\\\
            I love LISP and Functional Programming, and have diverse experience in various languages, paradigms and always strive to deepen my understanding of computer science, STEM or any other interesting topic.
          }
        \end{minipage}
      \end{leftcolumn}
      \begin{rightcolumn}
        \mbox{
          \begin{minipage}[r]{\rightcolwidth}
            \bfseries
            \begin{minipage}{0.5\linewidth}
              \profpic{1}{images/avatar}
            \end{minipage}
            \begin{minipage}{1\linewidth}
              \vspace{-0.25cm}
              \contact{}
            \end{minipage}
          \end{minipage}
        }
      \end{rightcolumn}
    \end{paracol}
  }
}

\newcommand{\name}{
  \begin{minipage}{0.4\linewidth}
    {\HUGE \@firstname{} \@lastname{}} \\[0cm]
    {\large \@jobtitle} \\
  \end{minipage}
}

\newsavebox{\picbox}
\newcommand{\profpic}[2]{
  \savebox{\picbox}{
    \hspace{-3pt}
    \includegraphics[scale=#1]{#2}}
  \tikz\node [draw, circle,
    line width=3pt, color=secondarycolor,
    minimum width=\wd\picbox,minimum height=\ht\picbox,
    path picture={
      \node at (path picture bounding box.center)
            {\usebox{\picbox}};
    }
  ]
             {};
}

\newcommand{\contact}{
  {\color{headercolor} \scriptsize \faIcon{map-marker-alt} \@address} \\
  {\color{headercolor} \scriptsize \faIcon{phone-alt} \href{tel:\@mobile}{\@mobile}} \\
  {\color{headercolor} \scriptsize \faIcon{envelope} \href{\@mail}{\@mail}} \\
  {\color{headercolor} \scriptsize \faIcon{link} \href{https://\@website}{\@website}} \\
  {\color{headercolor} \scriptsize \faIcon{github} \href{https://\@git}{\@git}}
}


\newcommand{\summary}[1]{
  \headlesssection{Summary}
  \sectiondesc{#1}
}

\newcommand{\sectiondesc}[1]{
  \scriptsize{#1} \\[0.1cm]
}

\newcommand{\jobdesc}[1]{
  \mbox{\hspace{1.2em} \scriptsize \desc{#1}}\\[0.2cm]
}

\newcommand{\headlesssection}[1]{
  \par
  \refstepcounter{section}
  \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
}

\newcommand{\roletitle}[1]{
  \vbox{
    \begin{large}
      {\noindent \hspace{1em} \textbf {\color{primarycolor} #1}}
    \end{large}
  }
}

\newcommand{\role}[4]{
  \roletitle{#1}
  \vbox{
    \jobtitle{#2}
    \hfill
    \datetext{#3}\\[0.1cm]
    \begin{small}
      #4
    \end{small}
  }
}

\newcommand{\jobtitle}[1]{
  \vspace{0.1cm}
  {\textbf \scriptsize \color{secondarycolor} #1}
}

\newcommand{\datetext}[1]{
  {\textit{\scriptsize \mdseries \textbf{\color{primarycolor} #1} }}
}

\newcommand{\desc}[1]{
  \begin{minipage}{0.96\linewidth} \scriptsize #1 \end{minipage} \\[0.1cm]
}

\newcommand{\hl}[1]{
  {\color{primarycolor} \texttt{#1}}
}

\newcommand{\responsibility}[1]{
  {{\color{primarycolor} \faIcon{circle}}~\textbf{#1}}
}

\newcommand{\responsibilities}[1]{
  {\color{primarycolor} \textit{Responsibilities:}} \\
  \foreach \r in {#1} {
    \responsibility{\r} \\
  }
  \vspace{-1em}
}

\newcommand\ruleafter[1]{#1~{\color{primarycolor}\hrulefill}}

\newcommand{\icon}[2]{{\scriptsize\color{primarycolor}\color{#1}\faIcon{#2}}\hspace{0.1em}}

\newcommand{\pictofraction}[1]{
  \pgfmathparse{#1}\foreach \n in {1,...,\pgfmathresult}{\icon{primarycolor}{circle}}
  \ifnum#1<5
  \hspace{-0.4em}
  \pgfmathparse{5-#1}\foreach \n in {1,...,\pgfmathresult}{\icon{secondarycolor}{dot-circle}}
  \fi
}

\newcommand{\skill}[2]{
  \texttt {#1} & \pictofraction{#2}\\
}

\newcommand{\volunteer}[4]{
  \vbox{
    \jobtitle{#2}
    \hfill
    \datetext{#3}\\[0.2cm]
    \begin{small}
      #4
    \end{small}
  }
}

\newtcbox{\mybox}{on line, colframe=secondarycolor, left=6pt,right=6pt,top=2pt,bottom=2pt}

% Edit section styles
% Customise the \section command
\titleformat{\section}
            {\LARGE\bfseries\raggedright\color{primarycolor}} % Make the \section headers large (\Large),
            % small capitals (\scshape) and left aligned (\raggedright)
            {}{0em}   % Can be used to give a prefix to all sections, like 'Section ...'
            {\ruleafter} % Can be used to insert code before the heading
            \titlespacing*{\section}{-1pt}{0pt}{0pt}
            %%
