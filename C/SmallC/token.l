NDIGIT [_a-zA-Z]
DIGIT [0-9]
NZDIGIT [1-9]
%%

"break" {return BREAK;}
"if" {return IF;}
"int" {return INT;}
"else" {return RETURN;}
"void" {return VOID;}
"while" {return WHILE;}
"scanf" {return SCANF;}
"printf" {return PRINTF;}

{NDIGIT}({NDIGIT}|{DIGIT})* {yylval.ident =
                                (char*)malloc(strlen(yytext)+1);
                                strcpy(yylval.ident,yytext);
                                return ID;}

{NDIGIT}-{DIGIT}* {yylval.number=atoi(yytext);return NUM;}

\""%d"\" {return INPUT;}
\""%d\n"\" {return OUTPUTN;}
\""%d\t"\" {return OUTPUTN;}

[\[\]\(\)\{\}&\*\+\-!\/\%\<\>;=,] {return (int)yytext[0];}
"++" {return INC;}
"--" {return DEC;}
"<=" {return LEQ;}
">=" {return GEQ;}
"==" {return EQ;}
"!=" {return NEQ;}
"&&" {return AND;}
"||" {return OR;}
"+=" {return ADDA;}
"-=" {return SUBA;}
"*=" {return MULA;}
"/=" {return DIVA;}
"%=" {return MODA;}

[ \t\n] + {}