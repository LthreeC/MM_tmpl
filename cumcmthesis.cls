\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cumcmthesis}[2024/07/01 Template for CUMCM, improved from elsewhere]
%% Loading Class
\LoadClass[a4paper,12pt]{article}
%% Loading Package

\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
  \ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
    Just choose `xelatex', no `pdflatex' or `latex' and so on.}

\fi
% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
%\RequirePackage{titletoc}
% 设置颜色
\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
\RequirePackage{float}
% 表格
\RequirePackage{array}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs,tabularx}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
\RequirePackage{xcolor}
% 插入链接
\RequirePackage{url}   % 网页链接
\RequirePackage{subcaption} % 子标题


%% !ADD_New
\RequirePackage{lipsum}
\RequirePackage{enumerate} % 为使用(1)等序号的
\RequirePackage{colortbl} % 渲染表格颜色
\RequirePackage[ruled,linesnumbered]{algorithm2e} % 伪代码环境
\RequirePackage{pdfpages}
\RequirePackage{tcolorbox} % 给颜色的背景框

% 首行缩进
\RequirePackage{indentfirst}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
% \RequirePackage{enumitem}
% 下划线
\RequirePackage{ulem}
% 尺寸计算
\RequirePackage{calc}
\RequirePackage[titletoc,title]{appendix}
\RequirePackage{etoolbox}
% 超链接 hyperref 的设置
\RequirePackage{hyperref}
% 智能自动化交叉引用
\RequirePackage{cleveref}


% 字图与子标题
\RequirePackage[titles]{tocloft}
%\renewcommand{\cftdot}{$\cdot$}
%\renewcommand{\cftsecdotsep}{1.5}
\renewcommand{\cftsecdotsep}{4.5}
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
%\setlength{\cftbeforesubsecskip}{5pt}
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}\heiti}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}



\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%!! 代码样式
\lstdefinestyle{lstset}{
  basicstyle      =   \zihao{5}\ttfamily,         % 基本代码风格
  keywordstyle    =   \color{blue},       % 关键字风格
  keywordstyle    =   [2] \color{purple},
  keywordstyle    =   [3] \color{cyan},
  stringstyle     =   \color{magenta},
  commentstyle    =   \color[RGB]{0, 128, 0}\ttfamily,
  flexiblecolumns,                % 别问为什么，加上这个
  numbers             =   left,   % 行号的位置在左边
  numbersep = 1em,
  % 自动换行
  breaklines          =   true,
  showspaces          =   false,  % 是否显示空格，显示了有点乱，所以不现实了
  numberstyle         =   \zihao{5}\ttfamily,    % 行号的样式，小五号，tt等宽字体
  showstringspaces    =   false,
  captionpos          =   t,      % 这段代码的名字所呈现的位置，t指的是top上面
  frame               =   single,   % 显示边框
}

\lstdefinestyle{Python}{
  style=lstset,
  language        =   Python, % 语言选Python
  backgroundcolor=\color{gray!10} %指定了代码块的背景颜色为浅灰色。
}

\lstdefinestyle{C++}{
  style=lstset,
  language        =   C++, % 语言选C++
  backgroundcolor=\color{gray!10} %指定了代码块的背景颜色为浅灰色。
}

\lstdefinestyle{Java}{
  style=lstset,
  language        =   Java, % 语言选Java
  backgroundcolor=\color{gray!10} %指定了代码块的背景颜色为浅灰色。
}

\lstdefinestyle{Matlab}{
  style=lstset,
  language        =   Matlab, % 语言选Java
  backgroundcolor=\color{gray!10} %指定了代码块的背景颜色为浅灰色。
}

\lstdefinestyle{Style}{
  style=lstset,
  backgroundcolor=\color{gray!10} %指定了代码块的背景颜色为浅灰色。
}


% 其他语言的样式同理


%%! 排版间距设置
% 页面布局
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}
% 1.38行间距约等于word的1.5倍行间距
\renewcommand*{\baselinestretch}{1.38}
% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
{\bgroup%
  \renewcommand{\arraystretch}{1.38}%
  \mcm@oldtabular}%
{\mcm@endoldtabular\egroup}

% 每行缩进两个汉字
\setlength\parindent{2em}
% 设置字体
\setmainfont{Times New Roman}
% 设置字体大小和间距
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12.05}{14.45}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}


% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放
% 得下. 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 分别设置顶端和底端的浮
% 动环境的最大比例.
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
\renewcommand*{\floatpagefraction}{0.85}


% 关于图片 graphicx
% 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
    {picture/}{pic/}{pics/}{image/}{images/}}
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
\captionsetup[figure]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,minusfour,bf}, % 图的字体, 宋体小四
  position=bottom % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}
\captionsetup[table]{%
  format=hang,   % 标题从第二行开始都有缩进, 应该和 justification=raggedright 的效果一样.
  labelsep=quad, % 分隔符是一个空格
  font={song,minusfour,bf}, % 表的字体, 宋体小四
  position=top % position=bottom, 不代表标题放在下面, 标题仍放在你放\caption的位置.
}


% 超链接
\hypersetup{%
  %         xetex,
  % unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项.
  pdfstartview=FitH,
  CJKbookmarks=true,
  bookmarksnumbered=true,
  bookmarksopen=true,
  colorlinks, %注释掉此项则交叉引用为彩色边框(将colorlinks和pdfborder同时注释掉)
  pdfborder=001,   %注释掉此项则交叉引用为彩色边框
  allcolors=black,
  breaklinks=true}%
% \if@mcm@bwprint
% \AtBeginDocument{\hypersetup{hidelinks}}
% \else\relax\fi


%! 这里是禁用了leavemode和kern，好像可以除掉警告
\pdfstringdefDisableCommands{%
  \def\leavevmode@ifvmode{ }%
  % \def\kern{ }%
  \def\cftdotfill{ }%
}
\lstnewenvironment{tcode}
{
  \lstset{basicstyle = \small\ttfamily,
    language=TeX,
    tabsize = 4,
    frame = single,
    escapechar = `,
    breaklines = true,
    breakatwhitespace = true,
    frameround = tttt,
  }
}
{}

% tokens definition
\newcommand\mcm@tokens@keywords{}
%%%数学定理相关的常量
\newcommand*{\mcm@cap@definition}{定义}
\newcommand*{\mcm@cap@theorem}{定理}
\newcommand*{\mcm@cap@lemma}{引理}
\newcommand*{\mcm@cap@corollary}{推论}
\newcommand*{\mcm@cap@assumption}{假设}
\newcommand*{\mcm@cap@conjecture}{猜想}
\newcommand*{\mcm@cap@axiom}{公理}
\newcommand*{\mcm@cap@principle}{定律}
\newcommand*{\mcm@cap@problem}{问题}
\newcommand*{\mcm@cap@example}{例}
\newcommand*{\mcm@cap@proof}{证明}
\newcommand*{\mcm@cap@solution}{解}
%%%  中文标题名称
\newcommand*{\mcm@cap@contentsname}{目录}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘要}
%%%  中文关键字
\newcommand*{\mcm@cap@keywordsname}{关键词}


%%! 进入页面
%% 在这里生成标题
\renewcommand{\maketitle}{\par
  \begingroup
  \setcounter{page}{1}
  \centering
  \zihao{3}\heiti\bfseries \@title
  \par
  \vskip1ex
  \endgroup
}

%%! 定义标题，标题自动加上数字
\setcounter{secnumdepth}{3}
% 节标题格式, 居中, 使用\chinese命令修改计数器
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}.\hspace{0.35em}\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\hspace{0.35em}\arabic{subsubsection}}

% 标题样式调整
\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-3ex \@plus -1ex \@minus -.2ex} % 上间距
  {2.5ex \@plus.2ex}               % 下间距
  {\centering\heiti\zihao{-3}\bfseries}} % 小三加粗黑体

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-2.5ex \@plus -0.8ex \@minus -.1ex}%
  {1.5ex \@plus.2ex}%
  {\heiti\zihao{4}\bfseries}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
  {-2ex \@plus -0.8ex \@minus -.1ex}%
  {1ex \@plus.2ex}%
  {\heiti\zihao{-4}\bfseries}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\parindent}%
  {1ex \@plus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
  {1ex \@plus.2ex}%
  {-1em}%
  {\normalfont\normalsize\bfseries}}


%%! 定义摘要环境
\renewenvironment{abstract}{%
  \begin{center}%
    {\zihao{4}\heiti\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
  \end{center}%
  \quotation
}
{\if@twocolumn\else\endquotation\null\fi}

\renewenvironment{quotation} {\list{}{\listparindent 2em%
    \itemindent \listparindent
    \rightmargin\z@
    \leftmargin\z@
    \parsep \z@ \@plus\p@}%
  \item\relax}
{\endlist}

\newcommand\keywords[1] {%
\renewcommand{\mcm@tokens@keywords}{#1}
\par
\vskip1ex
{\noindent\zihao{-4}\heiti\mcm@cap@keywordsname：}~{\mcm@tokens@keywords}
}


%%! 调整参考文献格式
\renewenvironment{thebibliography}[1]{%
  \section{\refname
    \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \itemsep\z@skip   
    \parsep\z@skip    
    \@openbib@code
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy\clubpenalty4000\widowpenalty4000%
  \sfcode`\.\@m}
{\def\@noitemerr
  {\@latex@warning{Empty `thebibliography' environment}}%
  \endlist}


% 上标文献
\newcommand{\upcite}[1]{$^{\mbox{\scriptsize \cite{#1}}}$}
\newcommand{\supercite}[1]{\textsuperscript{\textsuperscript{\cite{#1}}}}
\endinput
