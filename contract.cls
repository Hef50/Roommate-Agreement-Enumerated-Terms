\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{contract}[2025/03/04 Contract Template]
\LoadClass{article}

% Core packages
\usepackage{hyperref}
\usepackage{sectsty, parskip}
\usepackage{amssymb, enumitem}
\usepackage{chngcntr}

% Tighter paragraph spacing
\setlength{\parskip}{0.4em}
\setlength{\parindent}{0pt}

% Make references hyperlinks
\AtBeginDocument{\renewcommand{\ref}[1]{\hyperlink{#1}{#1}}}

% Custom checkboxes
\renewcommand{\check}{\makebox[0pt][l]{$\square$}\raisebox{.15ex}{\hspace{0.1em}$\checkmark$}}
\newcommand{\emptybox}{\makebox[0pt][l]{$\square$}\hspace{0.9em}}

% --------------------------------------------------------
% Signature block
% --------------------------------------------------------
\newcommand{\signature}[1]{%
\noindent \textbf{#1} \\[0.5cm]%
\noindent\begin{tabular}{@{}p{1.5in}p{3in}@{}}%
    Signature \& Date & \hrulefill \\[0.3cm]%
    Print Name & \hrulefill \\[0.3cm]%
    Physical Address & \hrulefill \\[0.3cm]%
    Contact Information & \hrulefill \\[0.3cm]%
\end{tabular}%
\vspace{1em}\\%
}

% --------------------------------------------------------
% Definitions
% --------------------------------------------------------
\newcommand{\inlinedef}[1]{\hypertarget{#1}{(the ``\textbf{#1}")}}
\newcommand{\definition}[1]{\indent \hypertarget{#1}{``\underline{#1},"}}
\newcommand{\pluraldef}[1]{\indent \hypertarget{#1}{``\underline{#1},"} and plurally \hypertarget{#1s}{``\underline{#1s},"}}

% --------------------------------------------------------
% Article numbering
% --------------------------------------------------------
\newcounter{articlecounter}
\newcommand{\article}[1]{%
    \vspace{1.25em}%
    \refstepcounter{articlecounter}%
    \textbf{%
        \Large\fontfamily{phv}\selectfont%
        \hypertarget{#1}{\arabic{articlecounter}\ \ \ #1}%
    }\\[0.75em]%
}

% --------------------------------------------------------
% Section numbering
% --------------------------------------------------------
\newcounter{sectioncounter}
\counterwithin*{sectioncounter}{articlecounter}
\renewcommand{\section}[1]{%
    \vspace{0.75em}%
    \refstepcounter{sectioncounter}%
    \hypertarget{#1}{\noindent\arabic{articlecounter}.\arabic{sectioncounter}\ \ \underline{#1}.\ }%
}

% --------------------------------------------------------
% Subsection (letters, hanging indent)
% --------------------------------------------------------
\newcounter{subsectioncounter}
\counterwithin*{subsectioncounter}{sectioncounter}
\renewcommand{\subsection}{%
    \vspace{0.5em}
    \refstepcounter{subsectioncounter}%
    \noindent\hangindent=2em\hangafter=0
    \hypertarget{\arabic{articlecounter}.\arabic{sectioncounter}(\alph{subsectioncounter})}{%
        (\alph{subsectioncounter})\hspace{0.5em}%
    }%
}

% --------------------------------------------------------
% Subsubsection (roman numerals, deeper indent)
% --------------------------------------------------------
\newcounter{subsubsectioncounter}
\counterwithin*{subsubsectioncounter}{subsectioncounter}
\renewcommand{\subsubsection}{%
    \vspace{0.5em}
    \refstepcounter{subsubsectioncounter}%
    \noindent\hangindent=4em\hangafter=0
    \hypertarget{\arabic{articlecounter}.\arabic{sectioncounter}(\alph{subsectioncounter})(\roman{subsubsectioncounter})}{%
        (\roman{subsubsectioncounter})\hspace{0.5em}%
    }%
}

% --------------------------------------------------------
% Clause (uppercase letters, deepest indent)
% --------------------------------------------------------
\newcounter{clausecounter}
\counterwithin*{clausecounter}{subsubsectioncounter}
\newcommand{\clause}{%
    \refstepcounter{clausecounter}%
    \noindent\hangindent=6em\hangafter=0
    \hypertarget{\arabic{articlecounter}.\arabic{sectioncounter}(\alph{subsectioncounter})(\roman{subsubsectioncounter})(\Alph{clausecounter})}{%
        (\Alph{clausecounter})\hspace{0.5em}%
    }%
}
