

<document> ::= DOCTYPE_DECLARATION HTML_OPEN <head> <body> HTML_CLOSE

<head>     ::= HEAD_OPEN <title> HEAD_CLOSE

<title>    ::= TITLE_OPEN TEXT_CONTENT TITLE_CLOSE

<body>     ::= BODY_OPEN <contents> BODY_CLOSE

<contents> ::= ε
             | <contents> <element>

<element>  ::= DIV_ALIGN_LEFT <contents> DIV_CLOSE
             | DIV_ALIGN_RIGHT <contents> DIV_CLOSE
             | DIV_ALIGN_CENTER <contents> DIV_CLOSE
             | DIV_ALIGN_JUSTIFY <contents> DIV_CLOSE
             | P_OPEN <contents> P_CLOSE
             | IMG_ALIGN_MIDDLE
             | IMG_WIDTH_100
             | TEXT_CONTENT
             ; 

