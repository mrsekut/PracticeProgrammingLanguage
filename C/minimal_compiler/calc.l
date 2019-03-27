%%
"+"         return ADD;
"-"         return SUB;
"*"         return MUL;
"/"         return DIV;
"\n"        return NL;

([1-9][0-9]*)|0|([0-9]+\.[0-9]*) {
    double temp;
    sscanf(yytext, "%lf", &temp);
    yylval.double_value = temp;
    return NUM;
};

[ \t] ;

. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}
%%
