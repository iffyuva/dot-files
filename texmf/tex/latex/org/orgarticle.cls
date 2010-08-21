%% Extending `article' class
%% Ideas are taken from the following links:
%% * www.latex-project.org/guides/clsguide.pdf
%% * http://stackoverflow.com/questions/581916/how-do-you-extend-article-document-class-in-latex

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{orgarticle}[2010/08/21 Customize article class]
\LoadClassWithOptions{article}

\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{subfig}
\RequirePackage{tabularx}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{keyval}
\RequirePackage[colorlinks=true, linkcolor=black]{hyperref}

\renewcommand{\familydefault}{\sfdefault}

\renewcommand\maketitle{\begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    \vskip 60\p@
    \begin{center}%
      {\huge{\textbf{\@title}} \par}%
      \vskip 3em%
      \LARGE
      \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par%
      \vskip 1.5em%
      \LARGE \@date \par%       % Set date in \large size.
      \includegraphics{gnu-emacs-orgmode.png}
    \end{center}\par
    \@thanks
    \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\@orgauthor\@author
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\pagestyle{fancy}

%% \lhead{}
%% \chead{} 
%% \rhead{}

\lfoot{\today}
\cfoot{\@orgauthor}
\rfoot{\thepage}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
