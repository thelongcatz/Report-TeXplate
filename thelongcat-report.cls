% thelongcat-report.cls
% A custom report class for producing a lab report

\NeedsTeXFormat{LaTeX2e} % Latest LaTeX format
\ProvidesClass{thelongcat-report}[2023/03/21] % Class name and version

% Read in parameters and load the article class
\DeclareOption{10pt}{\def\customfontsize{10pt}}
\DeclareOption{11pt}{\def\customfontsize{11pt}}
\DeclareOption{12pt}{\def\customfontsize{12pt}}
\DeclareOption{defaultAuthor}{
\def\whoami{NAME (ABCDXXXX)}
\def\spaceReduction{}
}
\DeclareOption{noDefaultAuthor}{
\def\whoami{}
\def\spaceReduction{\vspace{-2em}}
}

% Default: 12pt font
% Reference: https://stackoverflow.com/a/55002538
\ExecuteOptions{12pt}
\ExecuteOptions{defaultAuthor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\PassOptionsToClass{\customfontsize}{article}
\LoadClass{article} % Use article as base class

%%% Load packages %%%
\RequirePackage{geometry} % Modifies the geometry of the paper
\RequirePackage[UKenglish]{isodate} % Gives date in British format
\RequirePackage{fancyhdr} % Provides custom header/footer
\RequirePackage{amsmath} % Provides various environments for maths (e.g. equation)
\RequirePackage{amsthm} % Provides theorem structure
\RequirePackage{amssymb} % Provides mathematical symbols
\RequirePackage{graphicx} % Provides image embedding
\RequirePackage{minted} % Provides code-formatting functionality
\RequirePackage{hyperref} % Just hyperlink
\RequirePackage[parfill]{parskip} % No indent for new paragraphs
\RequirePackage{float} % Gives absolute float option in figure environment
\RequirePackage{mathtools} % Quality-of-life improvement for amsmath (introduces \xRightarrow etc.)
\RequirePackage{caption} % Gives caption
\RequirePackage{subcaption} % Gives sub-figure and sub-caption environments
\RequirePackage{gensymb} % Gives symbols such as degree symbol (º)
\RequirePackage{siunitx} % Provides unit annotation
%%%

%% Set geometry of the class
\geometry{a4paper, portrait, left=2.5cm, right=2.5cm, bottom=2.5cm}

\newcommand{\reporttitle}[2]{
  \pagestyle{fancy}
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \lhead{#1 Report}
  \rhead{\today}
  \cfoot{\thepage}
  \title{#1: #2\spaceReduction}
  \author{\whoami}
  \date{Date: \today}
}
