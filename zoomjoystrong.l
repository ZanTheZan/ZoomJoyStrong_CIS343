%{
#include "zoomjoystrong.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
%}

%option noyywrap
%option caseless  

extern YYSTYPE yylval;

%%

"end"           { return END; }
"point"         { return POINT; }
"line"          { return LINE; }
"circle"        { return CIRCLE; }
"rectangle"     { return RECTANGLE; }
"set_color"     { return SET_COLOR; }

";"             { return END_STATEMENT; }

[0-9]+          { yylval.ival = atoi(yytext); return INT; }

\$[a-zA-Z]      { yylval.var = yytext[1]; return VARIABLE; }

"="             { return EQUALS; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MULT; }
"/"             { return DIV; }

[ \t\n\r]+      { /* ignore */ }

.               { printf("Unknown character: %s\n", yytext); }

%%


