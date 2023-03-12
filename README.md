# 插入代码

插入代码的操作主要是由`lstlisting`宏包实现的。在这段时间内，我尝试输入了不同样式的代码文件，包括了python（计算机视觉，机器学习等课程）,verilog（计算机组成原理）,cpp（OS）,matlab（数模）等，不同代码语言内容有相似之处，但是使用方法还是略有不同,下面进行逐一介绍。

首先鉴于代码中的注释文件可能含有中文，此时需要全局设置字符编码为`utf-8`。在文档的开头进行全局样式设置。这些样式设置是全局的，也就是说，无论你后续使用的是何种设置，这一全局的结构都会进行覆盖。

```latex
\lstset{
    inputencoding=utf8,
    extendedchars=false,
    breaklines=true
}
```

## matlab

数学建模中使用最多的其实还是matlab，虽然前面几次是用python完成的任务，但是还是matlab的功能更为强大,适合解决专业的的数学问题。插入此代码分为两类情况。

1. 插入少量代码

   插入少量代码，一般是用指令`lstlisting`来实现，直接输入指令即可。

   ```latex
   \begin{lstlisting}[style=Matlab-editor]
       function GAdsa 
       %% 这个部分放点代码
   \end{lstlisting}
   ```

   对于少量代码而言，这样搞还是比较方便的，但是如果代码太多了又该如何处理？此时就需要插入文件来解决。

2. 插入大量代码

   插入代码文件不仅能够免去复制黏贴的痛苦，还可以使`tex`文件变得简洁。如果说有个叫`a.m`的文件，那么可以这样插入里边的代码。

   ```latex
   \lstinputlisting[style=Matlab-editor,linewidth=\textwidth]{a.m}
   ```

## python 

就是一些实验课可能会用到，尤其是写实验报告的时候放代码可太方便了。还是有两种方式：

首先需要在全局设置`python_style`环境：

```latex
\lstdefinestyle{python_style}{
 columns=fixed,
 numbers=left,                                        % 在左侧显示行号
 numberstyle=\tiny\color{gray},                       % 设定行号格式
 frame=trbl,                                        % 单线背景边框
 breaklines=true,                                     % 设定LaTeX对过长的代码行进行自动换行
 keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
 numberstyle=\footnotesize\color{darkgray},
 commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
 stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
 showstringspaces=false,                              % 不显示字符串中的空格
 language=python,                                        % 设置语言
 basicstyle=\linespread{1.0}\fontsize{10bp}{10bp}\selectfont\ttfamily,                      % 字体字号
 %lineskip=10bp,
 %baselinestretch=1,
 inputencoding=utf8,
 extendedchars=false  %对编码字符进行修改
}
```

1. 行内

   ```latex
   \begin{lstlisting}[style=python_style]
       from PIL import Image
       from numpy import asarray
   \end{lstlisting}
   ```

2. 文件

   ```latex
   \lstinputlisting[style=python_style,linewidth=\textwidth]{main.py}
   ```

## verilog 代码示例

在计算机实验的实验使用了`Verilog`，代码高亮是由`prettyverilog`支持的。在这里是直接使用了[这里](https://tex.stackexchange.com/questions/377122/typesetting-for-a-verilog-lstinput#:~:text=style%0A%5Clstdefinestyle-,%7Bprettyverilog,-%7D%7B%0A%20%20%20language%20%20%20%20%20%20%20%20%20%20%20%3D%20Verilog%2C%0A%20%20%20commentstyle)的代码，将其放在开头即可。

```latex
\usepackage[lighttt]{lmodern}% 定义verilog相关语言支持
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verilog Code Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{verilogcommentcolor}{RGB}{104,180,104}
\definecolor{verilogkeywordcolor}{RGB}{49,49,255}
\definecolor{verilogsystemcolor}{RGB}{128,0,255}
\definecolor{verilognumbercolor}{RGB}{255,143,102}
\definecolor{verilogstringcolor}{RGB}{160,160,160}
\definecolor{verilogdefinecolor}{RGB}{128,64,0}
\definecolor{verilogoperatorcolor}{RGB}{0,0,128}

% Verilog style
\lstdefinestyle{prettyverilog}{
   language           = Verilog,
   commentstyle       = \color{verilogcommentcolor},
   alsoletter         = \$'0123456789\`,
   literate           = *{+}{{\verilogColorOperator{+}}}{1}%
                         {-}{{\verilogColorOperator{-}}}{1}%
                         {@}{{\verilogColorOperator{@}}}{1}%
                         {;}{{\verilogColorOperator{;}}}{1}%
                         {*}{{\verilogColorOperator{*}}}{1}%
                         {?}{{\verilogColorOperator{?}}}{1}%
                         {:}{{\verilogColorOperator{:}}}{1}%
                         {<}{{\verilogColorOperator{<}}}{1}%
                         {>}{{\verilogColorOperator{>}}}{1}%
                         {=}{{\verilogColorOperator{=}}}{1}%
                         {!}{{\verilogColorOperator{!}}}{1}%
                         {^}{{\verilogColorOperator{$\land$}}}{1}%
                         {|}{{\verilogColorOperator{|}}}{1}%
                         {=}{{\verilogColorOperator{=}}}{1}%
                         {[}{{\verilogColorOperator{[}}}{1}%
                         {]}{{\verilogColorOperator{]}}}{1}%
                         {(}{{\verilogColorOperator{(}}}{1}%
                         {)}{{\verilogColorOperator{)}}}{1}%
                         {,}{{\verilogColorOperator{,}}}{1}%
                         {.}{{\verilogColorOperator{.}}}{1}%
                         {~}{{\verilogColorOperator{$\sim$}}}{1}%
                         {\%}{{\verilogColorOperator{\%}}}{1}%
                         {\&}{{\verilogColorOperator{\&}}}{1}%
                         {\#}{{\verilogColorOperator{\#}}}{1}%
                         {\ /\ }{{\verilogColorOperator{\ /\ }}}{3}%
                         {\ _}{\ \_}{2}%
                        ,
   morestring         = [s][\color{verilogstringcolor}]{"}{"},%
   identifierstyle    = \color{black},
   vlogdefinestyle    = \color{verilogdefinecolor},
   vlogconstantstyle  = \color{verilognumbercolor},
   vlogsystemstyle    = \color{verilogsystemcolor},
   basicstyle         = \scriptsize\fontencoding{T1}\ttfamily,
   keywordstyle       = \bfseries\color{verilogkeywordcolor},
   numbers            = left,
   numbersep          = 10pt,
   tabsize            = 4,
   escapeinside       = {/*!}{!*/},
   upquote            = true,
   sensitive          = true,
   showstringspaces   = false, %without this there will be a symbol in the places where there is a space
   frame              = single
}


% This is shamelessly stolen and modified from:
% https://github.com/jubobs/sclang-prettifier/blob/master/sclang-prettifier.dtx
\makeatletter

% Language name
\newcommand\language@verilog{Verilog}
\expandafter\lst@NormedDef\expandafter\languageNormedDefd@verilog%
  \expandafter{\language@verilog}
  
% save definition of single quote for testing
\lst@SaveOutputDef{`'}\quotesngl@verilog
\lst@SaveOutputDef{``}\backtick@verilog
\lst@SaveOutputDef{`\$}\dollar@verilog

% Extract first character token in sequence and store in macro 
% firstchar@verilog, per http://tex.stackexchange.com/a/159267/21891
\newcommand\getfirstchar@verilog{}
\newcommand\getfirstchar@@verilog{}
\newcommand\firstchar@verilog{}
\def\getfirstchar@verilog#1{\getfirstchar@@verilog#1\relax}
\def\getfirstchar@@verilog#1#2\relax{\def\firstchar@verilog{#1}}

% Initially empty hook for lst
\newcommand\addedToOutput@verilog{}
\lst@AddToHook{Output}{\addedToOutput@verilog}

% The style used for constants as set in lstdefinestyle
\newcommand\constantstyle@verilog{}
\lst@Key{vlogconstantstyle}\relax%
   {\def\constantstyle@verilog{#1}}

% The style used for defines as set in lstdefinestyle
\newcommand\definestyle@verilog{}
\lst@Key{vlogdefinestyle}\relax%
   {\def\definestyle@verilog{#1}}

% The style used for defines as set in lstdefinestyle
\newcommand\systemstyle@verilog{}
\lst@Key{vlogsystemstyle}\relax%
   {\def\systemstyle@verilog{#1}}

% Counter used to check current character is a digit
\newcount\currentchar@verilog
  
% Processing macro
\newcommand\@ddedToOutput@verilog
{%
   % If we're in \lstpkg{}' processing mode...
   \ifnum\lst@mode=\lst@Pmode%
      % Save the first token in the current identifier to \@getfirstchar
      \expandafter\getfirstchar@verilog\expandafter{\the\lst@token}%
      % Check if the token is a backtick
      \expandafter\ifx\firstchar@verilog\backtick@verilog
         % If so, then this starts a define
         \let\lst@thestyle\definestyle@verilog%
      \else
         % Check if the token is a dollar
         \expandafter\ifx\firstchar@verilog\dollar@verilog
            % If so, then this starts a system command
            \let\lst@thestyle\systemstyle@verilog%
         \else
            % Check if the token starts with a single quote
            \expandafter\ifx\firstchar@verilog\quotesngl@verilog
               % If so, then this starts a constant without length
               \let\lst@thestyle\constantstyle@verilog%
            \else
               \currentchar@verilog=48
               \loop
                  \expandafter\ifnum%
                  \expandafter`\firstchar@verilog=\currentchar@verilog%
                     \let\lst@thestyle\constantstyle@verilog%
                     \let\iterate\relax%
                  \fi
                  \advance\currentchar@verilog by \@ne%
                  \unless\ifnum\currentchar@verilog>57%
               \repeat%
            \fi
         \fi
      \fi
      % ...but override by keyword style if a keyword is detected!
      %\lsthk@DetectKeywords% 
   \fi
}

% Add processing macro only if verilog
\lst@AddToHook{PreInit}{%
  \ifx\lst@language\languageNormedDefd@verilog%
    \let\addedToOutput@verilog\@ddedToOutput@verilog%
  \fi
}

% Colour operators in literate
\newcommand{\verilogColorOperator}[1]
{%
  \ifnum\lst@mode=\lst@Pmode\relax%
   {\bfseries\textcolor{verilogoperatorcolor}{#1}}%
  \else
    #1%
  \fi
}

\makeatother
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End Verilog Code Style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```

1. 行内

   ```latex
   \begin{lstlisting}[style={prettyverilog}]
     module trafic_light(
   		input switch0,switch1,
   		output R,G,Y
       );
   	 assign Y =  switch1;
   	 assign R =  switch0 & ~ switch1;
   	 assign G = ~switch0 & ~ switch1;
     endmodule
   \end{lstlisting}
   ```

2. 文件

   ```latex
   \lstinputlisting[style={prettyverilog}]{test.v}
   ```

### 代码片段设置

为了方便，设置了一些快捷的代码片段，设置方法请自行查阅。

| **指令**        | **含义**              |
| --------------- | --------------------- |
| `lst_qss`       | 插入代码的基础需求    |
| `lst_matlab`    | 插入`matlab`代码      |
| `lst_matlab_f`  | 插入`matlab`代码文件  |
| `lst_python`    | 插入`python`代码      |
| `lst_python_f`  | 插入`python`代码文件  |
| `lst_verilog`   | 插入`verilog`代码     |
| `lst_verilog_f` | 插入`verilog`代码文件 |

```json
// 这是所有相关的代码片段
	"Starting Gesture": {
		"description": "Insect code starting gesture",
		"prefix": "\\lst_qss",
		"scope": "latex,tex",
		"body": [
			"\\lstset{",
			"    inputencoding=utf8,",
			"    extendedchars=false, % 注释当作普通文本，不被当作LaTeX编译",
			"    breaklines=true % 过长注释换行",
			"}"
		]
	},
	"Starting Gesture of python": {
		"description": "Insect code starting gesture of python",
		"prefix": "\\lst_qss_python",
		"scope": "latex,tex",
		"body": [
			"\\lstdefinestyle{python_style}{",
			" columns=fixed,",
			" numbers=left,                                        % 在左侧显示行号",
			" numberstyle=\\tiny\\color{gray},                       % 设定行号格式",
			" frame=trbl,                                        % 单线背景边框",
			" breaklines=true,                                     % 设定LaTeX对过长的代码行进行自动换行",
			" keywordstyle=\\color[RGB]{40,40,255},                 % 设定关键字颜色",
			" numberstyle=\\footnotesize\\color{darkgray},",
			" commentstyle=\\it\\color[RGB]{0,96,96},                % 设置代码注释的格式",
			" stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},   % 设置字符串格式",
			" showstringspaces=false,                              % 不显示字符串中的空格",
			" language=python,                                        % 设置语言",
			" basicstyle=\\linespread{1.0}\\fontsize{10bp}{10bp}\\selectfont\\ttfamily,                      % 字体字号",
			" %lineskip=10bp,",
			" %baselinestretch=1,",
			" inputencoding=utf8,",
			" extendedchars=false  %对编码字符进行修改",
			"}"
		]
	},
	"Insert python code": {
		"description": "Insert python code",
		"prefix": "\\lst_python",
		"scope": "latex,tex",
		"body": [
			"\\begin{lstlisting}[style=python_style]",
			"$1",
			"\\end{lstlisting}"
		]
	},
	"Insert python file": {
		"description": "Insert python file",
		"prefix": "\\lst_python_f",
		"scope": "latex,tex",
		"body": [
			"\\lstinputlisting[style=python_style,linewidth=\\textwidth]{$1.py}"
		]
	},
	"Starting Gesture of matlab": {
		"description": "Insect code starting gesture of matlab",
		"prefix": "\\lst_qss_matlab",
		"scope": "latex,tex",
		"body": [
			"\\usepackage[numbered,framed]{matlab-prettifier}%matlab 代码高亮"
		]
	},
	"Insert matlab code": {
		"description": "Insert matlab code",
		"prefix": "\\lst_matlab",
		"scope": "latex,tex",
		"body": [
			"\\begin{lstlisting}[style=Matlab-editor]",
			"$1",
			"\\end{lstlisting}"
		]
	},
	"Insert matlab file": {
		"description": "Insert matlab file",
		"prefix": "\\lst_matlab_f",
		"scope": "latex,tex",
		"body": [
			"\\lstinputlisting[style=Matlab-editor,linewidth=\\textwidth]{$1.m}"
		]
	},
	"Starting Gesture of verilog": {
		"description": "Insect code starting gesture of verilog",
		"prefix": "\\lst_qss_verilog",
		"scope": "latex,tex",
		"body": [
			"\\usepackage[lighttt]{lmodern}% 定义verilog相关语言支持",
			"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
			"% Verilog Code Style",
			"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
			"\\definecolor{verilogcommentcolor}{RGB}{104,180,104}",
			"\\definecolor{verilogkeywordcolor}{RGB}{49,49,255}",
			"\\definecolor{verilogsystemcolor}{RGB}{128,0,255}",
			"\\definecolor{verilognumbercolor}{RGB}{255,143,102}",
			"\\definecolor{verilogstringcolor}{RGB}{160,160,160}",
			"\\definecolor{verilogdefinecolor}{RGB}{128,64,0}",
			"\\definecolor{verilogoperatorcolor}{RGB}{0,0,128}",
			"",
			"% Verilog style",
			"\\lstdefinestyle{prettyverilog}{",
			"   language           = Verilog,",
			"   commentstyle       = \\color{verilogcommentcolor},",
			"   alsoletter         = \\$'0123456789\\`,",
			"   literate           = *{+}{{\\verilogColorOperator{+}}}{1}%",
			"                         {-}{{\\verilogColorOperator{-}}}{1}%",
			"                         {@}{{\\verilogColorOperator{@}}}{1}%",
			"                         {;}{{\\verilogColorOperator{;}}}{1}%",
			"                         {*}{{\\verilogColorOperator{*}}}{1}%",
			"                         {?}{{\\verilogColorOperator{?}}}{1}%",
			"                         {:}{{\\verilogColorOperator{:}}}{1}%",
			"                         {<}{{\\verilogColorOperator{<}}}{1}%",
			"                         {>}{{\\verilogColorOperator{>}}}{1}%",
			"                         {=}{{\\verilogColorOperator{=}}}{1}%",
			"                         {!}{{\\verilogColorOperator{!}}}{1}%",
			"                         {^}{{\\verilogColorOperator{$\\land$}}}{1}%",
			"                         {|}{{\\verilogColorOperator{|}}}{1}%",
			"                         {=}{{\\verilogColorOperator{=}}}{1}%",
			"                         {[}{{\\verilogColorOperator{[}}}{1}%",
			"                         {]}{{\\verilogColorOperator{]}}}{1}%",
			"                         {(}{{\\verilogColorOperator{(}}}{1}%",
			"                         {)}{{\\verilogColorOperator{)}}}{1}%",
			"                         {,}{{\\verilogColorOperator{,}}}{1}%",
			"                         {.}{{\\verilogColorOperator{.}}}{1}%",
			"                         {~}{{\\verilogColorOperator{$\\sim$}}}{1}%",
			"                         {\\%}{{\\verilogColorOperator{\\%}}}{1}%",
			"                         {\\&}{{\\verilogColorOperator{\\&}}}{1}%",
			"                         {\\#}{{\\verilogColorOperator{\\#}}}{1}%",
			"                         {\\ /\\ }{{\\verilogColorOperator{\\ /\\ }}}{3}%",
			"                         {\\ _}{\\ \\_}{2}%",
			"                        ,",
			"   morestring         = [s][\\color{verilogstringcolor}]{\"}{\"},%",
			"   identifierstyle    = \\color{black},",
			"   vlogdefinestyle    = \\color{verilogdefinecolor},",
			"   vlogconstantstyle  = \\color{verilognumbercolor},",
			"   vlogsystemstyle    = \\color{verilogsystemcolor},",
			"   basicstyle         = \\scriptsize\\fontencoding{T1}\\ttfamily,",
			"   keywordstyle       = \\bfseries\\color{verilogkeywordcolor},",
			"   numbers            = left,",
			"   numbersep          = 10pt,",
			"   tabsize            = 4,",
			"   escapeinside       = {/*!}{!*/},",
			"   upquote            = true,",
			"   sensitive          = true,",
			"   showstringspaces   = false, %without this there will be a symbol in the places where there is a space",
			"   frame              = single",
			"}",
			"",
			"",
			"% This is shamelessly stolen and modified from:",
			"% https://github.com/jubobs/sclang-prettifier/blob/master/sclang-prettifier.dtx",
			"\\makeatletter",
			"",
			"% Language name",
			"\\newcommand\\language@verilog{Verilog}",
			"\\expandafter\\lst@NormedDef\\expandafter\\languageNormedDefd@verilog%",
			"  \\expandafter{\\language@verilog}",
			"  ",
			"% save definition of single quote for testing",
			"\\lst@SaveOutputDef{`'}\\quotesngl@verilog",
			"\\lst@SaveOutputDef{``}\\backtick@verilog",
			"\\lst@SaveOutputDef{`\\$}\\dollar@verilog",
			"",
			"% Extract first character token in sequence and store in macro ",
			"% firstchar@verilog, per http://tex.stackexchange.com/a/159267/21891",
			"\\newcommand\\getfirstchar@verilog{}",
			"\\newcommand\\getfirstchar@@verilog{}",
			"\\newcommand\\firstchar@verilog{}",
			"\\def\\getfirstchar@verilog#1{\\getfirstchar@@verilog#1\\relax}",
			"\\def\\getfirstchar@@verilog#1#2\\relax{\\def\\firstchar@verilog{#1}}",
			"",
			"% Initially empty hook for lst",
			"\\newcommand\\addedToOutput@verilog{}",
			"\\lst@AddToHook{Output}{\\addedToOutput@verilog}",
			"",
			"% The style used for constants as set in lstdefinestyle",
			"\\newcommand\\constantstyle@verilog{}",
			"\\lst@Key{vlogconstantstyle}\\relax%",
			"   {\\def\\constantstyle@verilog{#1}}",
			"",
			"% The style used for defines as set in lstdefinestyle",
			"\\newcommand\\definestyle@verilog{}",
			"\\lst@Key{vlogdefinestyle}\\relax%",
			"   {\\def\\definestyle@verilog{#1}}",
			"",
			"% The style used for defines as set in lstdefinestyle",
			"\\newcommand\\systemstyle@verilog{}",
			"\\lst@Key{vlogsystemstyle}\\relax%",
			"   {\\def\\systemstyle@verilog{#1}}",
			"",
			"% Counter used to check current character is a digit",
			"\\newcount\\currentchar@verilog",
			"  ",
			"% Processing macro",
			"\\newcommand\\@ddedToOutput@verilog",
			"{%",
			"   % If we're in \\lstpkg{}' processing mode...",
			"   \\ifnum\\lst@mode=\\lst@Pmode%",
			"      % Save the first token in the current identifier to \\@getfirstchar",
			"      \\expandafter\\getfirstchar@verilog\\expandafter{\\the\\lst@token}%",
			"      % Check if the token is a backtick",
			"      \\expandafter\\ifx\\firstchar@verilog\\backtick@verilog",
			"         % If so, then this starts a define",
			"         \\let\\lst@thestyle\\definestyle@verilog%",
			"      \\else",
			"         % Check if the token is a dollar",
			"         \\expandafter\\ifx\\firstchar@verilog\\dollar@verilog",
			"            % If so, then this starts a system command",
			"            \\let\\lst@thestyle\\systemstyle@verilog%",
			"         \\else",
			"            % Check if the token starts with a single quote",
			"            \\expandafter\\ifx\\firstchar@verilog\\quotesngl@verilog",
			"               % If so, then this starts a constant without length",
			"               \\let\\lst@thestyle\\constantstyle@verilog%",
			"            \\else",
			"               \\currentchar@verilog=48",
			"               \\loop",
			"                  \\expandafter\\ifnum%",
			"                  \\expandafter`\\firstchar@verilog=\\currentchar@verilog%",
			"                     \\let\\lst@thestyle\\constantstyle@verilog%",
			"                     \\let\\iterate\\relax%",
			"                  \\fi",
			"                  \\advance\\currentchar@verilog by \\@ne%",
			"                  \\unless\\ifnum\\currentchar@verilog>57%",
			"               \\repeat%",
			"            \\fi",
			"         \\fi",
			"      \\fi",
			"      % ...but override by keyword style if a keyword is detected!",
			"      %\\lsthk@DetectKeywords% ",
			"   \\fi",
			"}",
			"",
			"% Add processing macro only if verilog",
			"\\lst@AddToHook{PreInit}{%",
			"  \\ifx\\lst@language\\languageNormedDefd@verilog%",
			"    \\let\\addedToOutput@verilog\\@ddedToOutput@verilog%",
			"  \\fi",
			"}",
			"",
			"% Colour operators in literate",
			"\\newcommand{\\verilogColorOperator}[1]",
			"{%",
			"  \\ifnum\\lst@mode=\\lst@Pmode\\relax%",
			"   {\\bfseries\\textcolor{verilogoperatorcolor}{#1}}%",
			"  \\else",
			"    #1%",
			"  \\fi",
			"}",
			"",
			"\\makeatother",
			"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
			"% End Verilog Code Style",
			"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%",
		]
	},
	"Insert verilog code": {
		"description": "Insert verilog code",
		"prefix": "\\lst_verilog",
		"scope": "latex,tex",
		"body": [
			"\\begin{lstlisting}[style={prettyverilog}]",
			"$1",
			"\\end{lstlisting}"
		]
	},
	"Insert verilog file": {
		"description": "Insert verilog file",
		"prefix": "\\lst_verilog_f",
		"scope": "latex,tex",
		"body": [
			"\\lstinputlisting[style={prettyverilog},linewidth=\\textwidth]{$1.v}"
		]
	},
}
```