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

%init{
    yyline = 1;
    yycolumn = 1;
%init}

BLANCOS = [ \r\t]+
D       = [0-9]+
DD      = [0-9]+("."[0-9]+)?

%%

// Palabras clave o etiquetas especiales
"$!DOCTYPE html#"            { return new Symbol(sym.DOCTYPE_DECLARATION, yyline, yycolumn, yytext()); }

// Estructura HTML básica
"$html#"                     { return new Symbol(sym.HTML_OPEN, yyline, yycolumn, yytext()); }
"$/html#"                   { return new Symbol(sym.HTML_CLOSE, yyline, yycolumn, yytext()); }
"$head#"                     { return new Symbol(sym.HEAD_OPEN, yyline, yycolumn, yytext()); }
"$/head#"                   { return new Symbol(sym.HEAD_CLOSE, yyline, yycolumn, yytext()); }
"$title#"                    { return new Symbol(sym.TITLE_OPEN, yyline, yycolumn, yytext()); }
"$/title#"                  { return new Symbol(sym.TITLE_CLOSE, yyline, yycolumn, yytext()); }
"$body#"                     { return new Symbol(sym.BODY_OPEN, yyline, yycolumn, yytext()); }
"$/body#"                   { return new Symbol(sym.BODY_CLOSE, yyline, yycolumn, yytext()); }

// Div con align
"$div align=\"left\"#"       { return new Symbol(sym.DIV_ALIGN_LEFT, yyline, yycolumn, yytext()); }
"$div align=\"right\"#"      { return new Symbol(sym.DIV_ALIGN_RIGHT, yyline, yycolumn, yytext()); }
"$div align=\"center\"#"     { return new Symbol(sym.DIV_ALIGN_CENTER, yyline, yycolumn, yytext()); }
"$div align=\"justify\"#"    { return new Symbol(sym.DIV_ALIGN_JUSTIFY, yyline, yycolumn, yytext()); }
"$/div#"                     { return new Symbol(sym.DIV_CLOSE, yyline, yycolumn, yytext()); }

// Imagen con atributos
"$img src=\"[^\"]+\" alt=\"[^\"]+\" align=\"middle\" /#" {
    return new Symbol(sym.IMG_ALIGN_MIDDLE, yyline, yycolumn, yytext());
}
"$img src=\"[^\"]+\" alt=\"[^\"]+\" width=\"100\" /#" {
    return new Symbol(sym.IMG_WIDTH_100, yyline, yycolumn, yytext());
}

// Etiqueta p
"$p#"                        { return new Symbol(sym.P_OPEN, yyline, yycolumn, yytext()); }
"$/p#"                      { return new Symbol(sym.P_CLOSE, yyline, yycolumn, yytext()); }

// Atributo lang
"lang=\"en\""                 { return new Symbol(sym.LANG_ATTR, yyline, yycolumn, yytext()); }

// Contenido textual (cualquier cosa que no comience con $)
[^\$\r\n]+                   { return new Symbol(sym.TEXT_CONTENT, yyline, yycolumn, yytext()); }

// Espacios
{BLANCOS}                    { yycolumn += yylength(); }

// Saltos de línea
\n                           { yycolumn = 1; yyline++; }

// Números
{D}                          { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
{DD}                         { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }

. {
    System.out.println("Este es un error léxico: " + yytext() +
                       ", en la línea: " + yyline + ", en la columna: " + yycolumn);
    return new Symbol(sym.ERROR, yyline, yycolumn, yytext());
}
