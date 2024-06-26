%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
%
% This class has been downloaded from:
% https://github.com/posquit0/Awesome-CV
%
% Author:
% Claud D. Park <posquit0.bj@gmail.com>
% http://www.posquit0.com
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage[dvipsnames]{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Needed to make tables span multiple pages
\RequirePackage{longtable}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode,pdfusetitle]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date.
\let\FA\relax
\newfontfamily\FA[Path=\@fontdir]{FontAwesome}
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newfontfamily\headerfontB[
  Path=\@fontdir,
  UprightFont=*-Light,
  ItalicFont=*-LightItalic,
  BoldFont=*-Regular,
  BoldItalicFont=*-Italic,
]{Montserrat}

\newfontfamily\headerfontlightB[
  Path=\@fontdir,
  UprightFont=*-ExtraLight,
  ItalicFont=*-ExtraLightItalic,
  BoldFont=*-Light,
  BoldItalicFont=*-LightItalic,
]{Montserrat}

\newfontfamily\timesnewromanfont{Times New Roman}

\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{28pt}{1.2em}\headerfontlightB\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1.2em}\headerfontB\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{16pt}{1.4em}\headerfontB\bfseries\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{9pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{10pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{18pt}{1.32em}\headerfontB\bfseries\scshape\color{awesome}\MakeLowercase{#1}}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\scshape{\MakeLowercase{#1}}}}
\newcommand*{\paragraphstyle}{\fontsize{12pt}{1.32em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{13.2pt}{1.32em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\scshape\color{graytext} \MakeLowercase{#1}}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{12.4pt}{1.2em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\scshape\color{awesome} \MakeLowercase{#1}}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{12pt}{1.32em}\bodyfontlight\upshape\color{text} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{10pt}{1.05em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\color{text} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{12pt}{1.2em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{11pt}{1.6em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letterfirstnamestyle}[1]{{\fontsize{12pt}{1.2em}\bodyfontlight\color{graytext} #1}}
\newcommand*{\letterlastnamestyle}[1]{{\fontsize{11.5pt}{1em}\bodyfontlight\bfseries\color{graytext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{12pt}{1.2em}\bodyfontlight\slshape\color{lighttext} #1}}

\newcommand*{\textBF}[1]{{\fontsize{13.6pt}{1.2em}\bodyfont\scshape\color{graytext}\MakeLowercase{#1}}}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's second mobile (optional)
% Usage: \mobileB{<mobileB number>}
\newcommand*{\mobileB}[1]{\def\@mobileB{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's second email (optional)
% Usage: \emailB{<emailB adress>}
\newcommand*{\emailB}[1]{\def\@emailB{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's google scholar (optional)
% Usage: \scholar{<user-scholar-id>}
\newcommand*{\scholar}[1]{\def\@scholar{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's twitter (optional)
% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}{<recipient name B>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
% Usage: \recipientnameB{<recipient nameB>}
\newcommand*{\recipient}[3]{\def\@recipientname{#1}\def\@recipientgroup{#2}\def\@recipientnameB{#3}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientgroup}[1]{\def\@recipientgroup{#1}}
\newcommand*{\recipientnameB}[1]{\def\@recipientnameB{#1}}

% Defines letter's addressee (optional)
% Usage: \letteraddressee{<letteraddressee>}
\newcommand*{\letteraddressee}[1]{\def\@letteraddressee{#1}}

% Defines current address for the coverletter
% Usage: \letteraddress{<letteraddressA>}{<letteraddressB>}{<letteraddressC>}
% Usage: \letteraddressA{<letteraddressA>}
% Usage: \letteraddressB{<letteraddressB>}
% Usage: \letteraddressC{<letteraddressC>}
\newcommand*{\letteraddress}[3]{\def\@letteraddressA{#1}\def\@letteraddressB{#2}\def\@letteraddressC{#3}}
\newcommand*{\letteraddressA}[1]{\def\@letteraddressA{#1}}
\newcommand*{\letteraddressB}[1]{\def\@letteraddressB{#1}}
\newcommand*{\letteraddressC}[1]{\def\@letteraddressC{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \letterposition{<title>}
\newcommand*{\letterposition}[1]{\def\@letterposition{#1}}

% Defines the department for letter (cover letter only)
% Usage: \letterdepartment{<department>}
\newcommand*{\letterdepartment}[2]{\def\@letterdepartment{#1}\def\@letterdepartmentB{#2}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{2mm}
\newcommand{\acvHeaderAfterPositionSkip}{1mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{2.4mm}
\newcommand{\acvSectionContentTopSkip}{1.2mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

% Used to remove line breaks
\newcommand{\removelinebreaks}[1]{\begingroup\def\\{}#1\endgroup}

% Used to remove spaces
\newcommand{\removespaces}[1]{\begingroup\spaceskip=1sp\xspaceskip=1sp#1\endgroup}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
  \newcommand*{\drawphoto}{%
    \ifthenelse{\isundefined{\@photo}}{}{%
      \newlength{\photodim}
      \ifthenelse{\equal{\@photoshape}{circle}}%
        {\setlength{\photodim}{1.3cm}}%
        {\setlength{\photodim}{2.2cm}}%
      \ifthenelse{\equal{\@photoedge}{edge}}%
        {\def\@photoborder{darkgray}}%
        {\def\@photoborder{none}}%
      \begin{tikzpicture}%
        \node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
      \end{tikzpicture}
    }%
  }
  \newlength{\headertextwidth}
  \newlength{\headerphotowidth}
  \ifthenelse{\isundefined{\@photo}}{
    \setlength{\headertextwidth}{\textwidth}
    \setlength{\headerphotowidth}{0cm}
  }{%
    \setlength{\headertextwidth}{0.76\textwidth}
    \setlength{\headerphotowidth}{0.24\textwidth}
    \begin{minipage}[c]{\headerphotowidth}%
      \ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
    \end{minipage}
  }%
  \begin{minipage}[c]{\headertextwidth}
    \ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@email}}%
        {}%
        {%
          \href{mailto:\@email}{\color{text}\faEnvelope\acvHeaderIconSep\@email}%
          \ifthenelse{\isundefined{\@emailB}}%
            {}%
            {
              \href{mailto:\@emailB}{\color{text}{\cdotp}\acvHeaderIconSep\@emailB}%
            }%
          \setbool{isstart}{false}%
        }%
      \ifthenelse{\isundefined{\@homepage}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://\@homepage}{\color{text}\faHome\acvHeaderIconSep\@homepage}%
        }%
      \ifthenelse{\isundefined{\@github}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://github.com/\@github}{\color{text}\faGithubAlt\acvHeaderIconSep\@github}%
        }%
      \ifthenelse{\isundefined{\@gitlab}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
        }%
      \ifthenelse{\isundefined{\@stackoverflowid}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
        }%
      \ifthenelse{\isundefined{\@linkedin}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.linkedin.com/in/\@linkedin}{\color{text}\faLinkedinSquare\acvHeaderIconSep\@linkedin}%
        }%
      \ifthenelse{\isundefined{\@mobile}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \faPhone\acvHeaderIconSep\@mobile%
          \ifthenelse{\isundefined{\@mobileB}}%
            {}%
            {
              {\cdotp}\acvHeaderIconSep\@mobileB%
            }%
        }%
      \ifthenelse{\isundefined{\@twitter}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://twitter.com/\@twitter}{\color{text}\faTwitter\acvHeaderIconSep\@twitter}%
        }%
      \ifthenelse{\isundefined{\@scholar}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://scholar.google.com/citations?user=\@scholar}{\color{text}\faGraduationCap\acvHeaderIconSep{GScholar}}%
        }%
      \ifthenelse{\isundefined{\@skype}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \faSkype\acvHeaderIconSep\@skype%
        }%
      \ifthenelse{\isundefined{\@reddit}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
        }%
      \ifthenelse{\isundefined{\@xing}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}
        }%
      \ifthenelse{\isundefined{\@extrainfo}}%
        {}%
        {%
          \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
          \@extrainfo%
        }%
    } \\[\acvHeaderAfterSocialSkip]%
    \ifthenelse{\isundefined{\@quote}}%
      {}%
      {\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
  \end{minipage}%
  \begin{minipage}[c]{\headerphotowidth}%
    \ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
  \end{minipage}
}

\newcommand*{\makereferencecontact}[1]{%
  \begin{minipage}[c]{\linewidth}%
    \sectionstyle{Reference Contact:} \paragraphstyle{\bfseries #1}%
    \vspace{\acvHeaderAfterQuoteSkip}%
  \end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Usage: \cvsection{<section-title>}
\newcommand{\cvsection}[1]{%
  \vspace{\acvSectionTopSkip}
  \hspace{-0.5mm}\sectionstyle{#1}
  \phantomsection
  \color{awesome}\vhrulefill{1pt}
  \vspace{-0.8mm}
}

\newcommand{\cvsectionpar}[1]{%
  \vspace{\acvSectionTopSkip}
  \hspace{-1mm}\sectionstyle{#1}
  \phantomsection\hspace{4mm}
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \subsectionstyle{#1}
  \vspace{-0.6mm}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-1mm}
  \paragraphstyle
}{%
  \par
  % \vspace{2mm}
}


% Similar to ifempty but it checks also if the variable contains an empty group
\newcommand{\ifnotext}[3]{%
  \sbox0{#1}%
  \ifdim\wd0=0pt {#2}% if #1 is empty
  \else {#3}% if #1 is not empty
  \fi
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  % \vspace{1.5mm}
  \begin{center}
}{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  % \vspace{-2.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  %\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
  \begin{longtable}{lr}
    \ifempty{#2#3}
      {\entrypositionstyle{#2} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#1} \ \entrypositionstyle{#2} &
      \entrylocationstyle{#3} \ \entrydatestyle{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\justify\vspace{-1em}\descriptionstyle{#5}}
    % \multicolumn{2}{L{\textwidth}}{\justify\vspace{-1em}\descriptionstyle{#5}}
  %\end{tabular*}%
  \end{longtable}%
  \vspace{-4.0mm}
  % \ifnotext{#5}{\vspace*{-8.0mm}}{\vspace{-4.0mm}}
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
  \begin{center}
}{%
  \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \setlength\leftskip{0.2cm}
    \subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
      {\subentrydatestyle{#3}}{}
    \ifthenelse{\equal{#1}{}}
      {}
      {\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
    \ifthenelse{\equal{#4}{}}
      {}
      {\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
  \end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2mm}
  \begin{center}
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1.5cm} L{\textwidth - 4.0cm} R{2.5cm}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<position>}{<title>}{<location>}{<date>}
\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvskill
\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-2.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}
% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<skillset>}
\newcommand*{\cvskill}[2]{%
  \skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Define an environment for cvskillB
\newcommand*{\cvskillB}[1]{%
  \vspace{-1.0mm}
  \descriptionstyle{#1}
  \vspace{4.0mm}
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
  % \vspace{-4.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=1.2ex, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
    \renewcommand{\labelitemii}{$\circ$}
    % \renewcommand{\labelitemi}{\scriptsize$\blacksquare$}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-4.0mm}
}

%-------------------------------------------------------------------------------
%                Commands for elements of Bio
%-------------------------------------------------------------------------------

\newenvironment{cvbio}{%
  \newcommand{\desiredposition}{\@letterposition}
  \newcommand{\desiredcompany}{\@recipientname}
  \newcommand{\desiredcompanyB}{\@recipientnameB}
  \newcommand{\currentposition}{\@position}
  \newcommand{\currentaddressA}{\@letteraddressA}
  \newcommand{\currentaddressB}{\@letteraddressB}
  \newcommand{\currentaddressC}{\@letteraddressC}
  \newcommand{\website}{\@homepage}
  \lettertextstyle
  \vspace{1cm}
}{%
}

%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
  \newcommand{\desiredposition}{\@letterposition}
  \newcommand{\desireddepartment}{\@letterdepartment}
  \newcommand{\desireddepartmentB}{\@letterdepartmentB}
  \newcommand{\desiredcompany}{\@recipientname}
  \newcommand{\desiredcompanyB}{\@recipientnameB}
  \newcommand{\currentposition}{\@position}
  \newcommand{\currentaddressA}{\@letteraddressA}
  \newcommand{\currentaddressB}{\@letteraddressB}
  \newcommand{\currentaddressC}{\@letteraddressC}
  \newcommand{\website}{\@homepage}
  \lettertextstyle
}{%
}

% Define a section for the cover letter
% Usage: \lettersection{<section-title>}
\newcommand{\lettersection}[1]{%
  \par\addvspace{2.5ex}
  \phantomsection{}
  \lettersectionstyle{#1}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}[1][0pt]{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{flushright}
  \lettertextstyle{\@letterdate }\vspace{2mm}
  \end{flushright}\vspace{#1}
  \ifthenelse{\isundefined{\@letteraddressee}}%
  {\lettertextstyle \@letteropening\ \@recipientname\ \@recipientgroup,}%
  {\lettertextstyle \@letteropening\ \@letteraddressee,}%
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vskip 10pt
  \lettertextstyle{\@letterclosing}
  \vskip 10pt
  \letterfirstnamestyle{\@firstname}\ \letterlastnamestyle{\@lastname}\\
  \@position, \@letteraddressA,\\
  \@letteraddressB, \@letteraddressC\\
  \href{mailto:\@email}{\color{awesome}\faEnvelope\acvHeaderIconSep\ \@email}%
  \ifthenelse{\isundefined{\@emailB}}%
    {}%
    {%
      \acvHeaderIconSep{\cdotp}\acvHeaderIconSep\href{mailto:\@emailB}{\color{awesome}\ \@emailB}
    }
  \ifthenelse{\isundefined{\@mobile}}%
    {}%
    {%
      \color{graytext}\acvHeaderSocialSep\color{awesome}\faPhone\acvHeaderIconSep\ \@mobile%
    }\\
  \href{https://\@homepage}{\color{awesome}\faHome\acvHeaderIconSep\ \@homepage}%
  \ifthenelse{\isundefined{\@github}}%
    {}%
    {%
      \color{graytext}\acvHeaderSocialSep\href{https://github.com/\@github}{\color{awesome}\faGithubAlt\acvHeaderIconSep\ \@github}%
    }%
  \ifthenelse{\isundefined{\@scholar}}%
    {}%
    {%
      \color{graytext}\acvHeaderSocialSep\href{https://scholar.google.com/citations?user=\@scholar}{\faGraduationCap\ {google scholar}}%
    }%
}
