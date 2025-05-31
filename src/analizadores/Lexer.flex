package analizadores;

import java_cup.runtime.Symbol;

%%

%class Lexico
%public
%line
%char
%cup
%unicode
%ignorecase



/* Definición básica de “espacio en blanco” (solo espacios y tabs, sin CR/LF) */
BLANCOS = [ \t\r\n]+

%%

//
// 1) DOCTYPE completo, hasta el “#”
//    Coincide exactamente con “$!DOCTYPE html#”
//
"\$!DOCTYPE html#" {
    return new Symbol(sym.DOCTYPE_DECLARATION, yyline, yycolumn, yytext());
}

//
// 2) <html lang="...">#
//    Permitir uno o más espacios/tab entre $html y lang="..."#
//    Ejemplo que debe capturar:  $html lang="en"#
//
"\$html lang=\"en\"#" {
    return new Symbol(sym.HTML_OPEN_WITH_LANG, yyline, yycolumn, yytext());
}

//
// 3) Cierre de html: “$/html#”
//
"\$/html#" {
    return new Symbol(sym.HTML_CLOSE, yyline, yycolumn, yytext());
}

//
// 4) <head>#  y </head>#
//
"\$head#" {
    return new Symbol(sym.HEAD_OPEN, yyline, yycolumn, yytext());
}
"\$/head#" {
    return new Symbol(sym.HEAD_CLOSE, yyline, yycolumn, yytext());
}

//
// 5) <title>#  y </title>#
//
"\$title#" {
    return new Symbol(sym.TITLE_OPEN, yyline, yycolumn, yytext());
}
"\$/title#" {
    return new Symbol(sym.TITLE_CLOSE, yyline, yycolumn, yytext());
}

//
// 6) <body>#  y </body>#
//
"\$body#" {
    return new Symbol(sym.BODY_OPEN, yyline, yycolumn, yytext());
}
"\$/body#" {
    return new Symbol(sym.BODY_CLOSE, yyline, yycolumn, yytext());
}

//
// 7) <div align="...">#  y </div>#
//    (aunque tu ejemplo no lo usa, queda aquí por si lo necesitas)
//
"\$div[ \t]+align=\"(left|right|center|justify)\"#" {
    return new Symbol(sym.DIV_OPEN_WITH_ALIGN, yyline, yycolumn, yytext());
}
"\$/div#" {
    return new Symbol(sym.DIV_CLOSE, yyline, yycolumn, yytext());
}

//
// 8) <p>#  y </p>#
//
"\$p#" {
    return new Symbol(sym.P_OPEN, yyline, yycolumn, yytext());
}
"\$/p#" {
    return new Symbol(sym.P_CLOSE, yyline, yycolumn, yytext());
}

//
// 9) <img src="..." alt="..." align="middle" />#
//    Coincide con algo como:
//      $img src="image.png" alt="Image" align="middle" /#
//    Permite espacios/tab entre cada parte.
//
"\$img" {
    return new Symbol(sym.IMG_OPEN, yyline, yycolumn, yytext());
}
/* src="cualquier_cadena_sin_comillas" */
"src=\"[^\"]*\"" {
    return new Symbol(sym.SRC_ATTR, yyline, yycolumn, yytext());
}

/* alt="cualquier_cadena_sin_comillas" */
"alt=\"[^\"]*\"" {
    return new Symbol(sym.ALT_ATTR, yyline, yycolumn, yytext());
}

/* align="middle" (siempre middle en tu ejemplo) */
"align=\"middle\"" {
    return new Symbol(sym.ALIGN_ATTR, yyline, yycolumn, yytext());
}

/* width="100" (siempre 100 en tu ejemplo) */
"width=\"100\"" {
    return new Symbol(sym.WIDTH_ATTR, yyline, yycolumn, yytext());
}


//
// 10) <img src="..." alt="..." width="100" />#
//     Coincide con algo como:
//       $img src="image.png" alt="Image" width="100" /#
//
"\$img[ \t]+src=\"[^\"]+\"[ \t]+alt=\"[^\"]+\"[ \t]+width=\"100\"[ \t]*\/#" {
    return new Symbol(sym.IMG_OPEN_WIDTH_100, yyline, yycolumn, yytext());
}

//
// 11) Espacios en blanco (sin generar token, solo avanzamos la columna)
//
{BLANCOS} {
    yycolumn += yylength();
}

//
// 12) Saltos de línea: manejamos CRLF (\r\n), solo CR (\r) y solo LF (\n )
//     De esta forma no queda ningún '\r' “colgado”
//
"\r\n" {
    yycolumn = 1;
    yyline++;
}
"\r" {
    yycolumn = 1;
    yyline++;
}
"\n" {
    yycolumn = 1;
    yyline++;
}

//
// 13) Contenido textual: “cualquier secuencia de uno o más caracteres
//     que NO incluya $, no incluya #, y no incluya CR o LF”
//     Así capturamos texto plano como “This is an example. ”, “ More text right here”, etc.
//
//     Importante: \r y \n han sido excluidos arriba, y $/# quedan excluidos aquí.
//
[^\$\r\n#]+ {
    return new Symbol(sym.TEXT_CONTENT, yyline, yycolumn, yytext());
}

//
// 14) Cualquier otro carácter: error léxico
//
. {
    System.out.println("Error léxico: `" + yytext() +
                       "` en la línea " + yyline +
                       ", columna " + yycolumn);
    return new Symbol(sym.ERROR, yyline, yycolumn, yytext());
}
