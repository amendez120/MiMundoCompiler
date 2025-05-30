/* 1) Sección de código de usuario: sólo imports y helpers */
%{
  package analizadores;
  import java_cup.runtime.Symbol;
  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline, yycolumn, value);
  }
  private Symbol symbol(int type) {
    return new Symbol(type, yyline, yycolumn);
  }
%}

/* --------------- */
%%  /* fin de sección de usuario; comienza sección de declaraciones */
/* 2) Sección de declaraciones: directivas y macros */  
%class Lexico
%unicode
%cup
%line
%column

DIGITO=[0-9]
LETRA=[A-Za-z]
IDENT={LETRA}({LETRA}|{DIGITO})*
WHITESPACE=[ \t\f]+

/* --------------- */
%%  /* fin de sección de declaraciones; comienza sección de reglas */
/* 3) Reglas léxicas */
{WHITESPACE}      { /* nada */ }
\r|\n|\r\n        { /* nada */ }
"\$"               { return symbol(sym.APERTURA); }
"#"                { return symbol(sym.CIERRE); }
"/"                { return symbol(sym.DIAGONAL); }
"="                { return symbol(sym.IGUAL); }
\"[^\"]*\"         { return symbol(sym.ATTR_VALUE, yytext()); }
{IDENT}            { return symbol(sym.IDENT, yytext()); }
[^$\n#]+           { return symbol(sym.TEXT, yytext().trim()); }
.                  {
                     System.err.printf(
                       "Error léxico [%d,%d]: '%s'%n",
                       yyline+1, yycolumn+1, yytext()
                     );
                   }
