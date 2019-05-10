%union{
    char* ident;
    int number;
}
%token BREAK IF INT ELSE RETURN VOID WHILE SCANF PRINTF
%token <ident> ID <number> NUM INPUT OUTPUTN OUTPUTT
%left ','
%right '=' ADDA SUBA MULA DIVA MODA
%left OR
%left AND
%left EQ NEQ
%left '<' '>' LEQ GEQ
%left '+' '-'
// 途中