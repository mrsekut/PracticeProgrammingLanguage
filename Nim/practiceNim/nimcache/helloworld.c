/* Generated by Nim Compiler v0.17.2 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: MacOSX, amd64, clang */
/* Command for C compiler:
   clang -c  -w  -I/usr/local/Cellar/nim/0.17.2/nim/lib -o /Users/cloudspider/Desktop/prapra/pracNim/nimcache/helloworld.o /Users/cloudspider/Desktop/prapra/pracNim/nimcache/helloworld.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#include <stdio.h>
#include <string.h>
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef powerpc
#undef unix
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef struct {
N_NIMCALL_PTR(void, ClP_0) (NI x, void* ClE_0);
void* ClE_0;
} tyProc_kElEuvYkhDcTHhB3d89aMYA;
typedef NI tyArray_GcdOWLUvBXK4hDWgSrMGKA[5];
typedef N_CLOSURE_PTR(void, TM_dXO2cnGOaoQkOelZZLCV1Q_2) (NI x);
typedef N_CLOSURE_PTR(void, TM_dXO2cnGOaoQkOelZZLCV1Q_4) (NI x, void* ClE_0);
N_NIMCALL(void, echoItem_AE0mmShqUjG5kv6VH7WejQ)(NI x);
N_NIMCALL(NimStringDesc*, nimIntToStr)(NI x);
static N_INLINE(void, nimFrame)(TFrame* s);
N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
N_NIMCALL(void, forEach_eW0SPyBT9bs68AUiDXLgLJA)(tyProc_kElEuvYkhDcTHhB3d89aMYA action);
static N_INLINE(NI, addInt)(NI a, NI b);
N_NOINLINE(void, raiseOverflow)(void);
static N_INLINE(void, initStackBottomWith)(void* locals);
N_NOINLINE(void, setStackBottom)(void* theStackBottom);
NIM_EXTERNC N_NOINLINE(void, systemInit000)(void);
NIM_EXTERNC N_NOINLINE(void, systemDatInit000)(void);
NIM_EXTERNC N_NOINLINE(void, NimMainModule)(void);
NIM_EXTERNC N_NOINLINE(void, helloworldDatInit000)(void);
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
NIM_CONST tyArray_GcdOWLUvBXK4hDWgSrMGKA data_U29bZlxg0DqZ9bRC1ToHBz9bA = {((NI) 2),
((NI) 3),
((NI) 5),
((NI) 7),
((NI) 11)}
;

static N_INLINE(void, nimFrame)(TFrame* s) {
	NI T1_;
	T1_ = (NI)0;
	{
		if (!(framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw == NIM_NIL)) goto LA4_;
		T1_ = ((NI) 0);
	}
	goto LA2_;
	LA4_: ;
	{
		T1_ = ((NI) ((NI16)((*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1))));
	}
	LA2_: ;
	(*s).calldepth = ((NI16) (T1_));
	(*s).prev = framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA9_;
		stackOverflow_II46IjNZztN9bmbxUD8dt8g();
	}
	LA9_: ;
}

static N_INLINE(void, popFrame)(void) {
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}

N_NIMCALL(void, echoItem_AE0mmShqUjG5kv6VH7WejQ)(NI x) {
	NimStringDesc* T1_;
	nimfr_("echoItem", "helloworld.nim");
	nimln_(225, "helloworld.nim");
	T1_ = (NimStringDesc*)0;
	T1_ = nimIntToStr(x);
	printf("%s\012", T1_? (T1_)->data:"nil");
	fflush(stdout);
	popFrame();
}

static N_INLINE(NI, addInt)(NI a, NI b) {
	NI result;
{	result = (NI)0;
	result = (NI)((NU64)(a) + (NU64)(b));
	{
		NIM_BOOL T3_;
		T3_ = (NIM_BOOL)0;
		T3_ = (((NI) 0) <= (NI)(result ^ a));
		if (T3_) goto LA4_;
		T3_ = (((NI) 0) <= (NI)(result ^ b));
		LA4_: ;
		if (!T3_) goto LA5_;
		goto BeforeRet_;
	}
	LA5_: ;
	raiseOverflow();
	}BeforeRet_: ;
	return result;
}

N_NIMCALL(void, forEach_eW0SPyBT9bs68AUiDXLgLJA)(tyProc_kElEuvYkhDcTHhB3d89aMYA action) {
	nimfr_("forEach", "helloworld.nim");
	{
		NI d;
		NI i;
		d = (NI)0;
		nimln_(2092, "system.nim");
		i = ((NI) 0);
		nimln_(2093, "system.nim");
		{
			if (!(((NI) (i)) <= ((NI) 4))) goto LA4_;
			{
				nimln_(2094, "system.nim");
				while (1) {
					NI TM_dXO2cnGOaoQkOelZZLCV1Q_3;
					nimln_(2095, "system.nim");
					d = data_U29bZlxg0DqZ9bRC1ToHBz9bA[(i)- 0];
					nimln_(231, "helloworld.nim");
					action.ClE_0? action.ClP_0(d, action.ClE_0):((TM_dXO2cnGOaoQkOelZZLCV1Q_2)(action.ClP_0))(d);
					nimln_(2096, "system.nim");
					{
						if (!(((NI) 4) <= ((NI) (i)))) goto LA10_;
						goto LA6;
					}
					LA10_: ;
					nimln_(2097, "system.nim");
					TM_dXO2cnGOaoQkOelZZLCV1Q_3 = addInt(i, ((NI) 1));
					if (TM_dXO2cnGOaoQkOelZZLCV1Q_3 < 0 || TM_dXO2cnGOaoQkOelZZLCV1Q_3 > 4) raiseOverflow();
					i = (NI)(TM_dXO2cnGOaoQkOelZZLCV1Q_3);
				}
			} LA6: ;
		}
		LA4_: ;
	}
	popFrame();
}

static N_INLINE(void, initStackBottomWith)(void* locals) {
	setStackBottom(locals);
}
void PreMainInner(void) {
	systemInit000();
	helloworldDatInit000();
}

void PreMain(void) {
	void (*volatile inner)(void);
	systemDatInit000();
	inner = PreMainInner;
	initStackBottomWith((void *)&inner);
	(*inner)();
}

int cmdCount;
char** cmdLine;
char** gEnv;
N_CDECL(void, NimMainInner)(void) {
	NimMainModule();
}

N_CDECL(void, NimMain)(void) {
	void (*volatile inner)(void);
	PreMain();
	inner = NimMainInner;
	initStackBottomWith((void *)&inner);
	(*inner)();
}

int main(int argc, char** args, char** env) {
	cmdLine = args;
	cmdCount = argc;
	gEnv = env;
	NimMain();
	return nim_program_result;
}

NIM_EXTERNC N_NOINLINE(void, NimMainModule)(void) {
	tyProc_kElEuvYkhDcTHhB3d89aMYA T1_;
	nimfr_("helloworld", "helloworld.nim");
	nimln_(233, "helloworld.nim");
	memset((void*)(&T1_), 0, sizeof(T1_));
	T1_.ClP_0 = ((TM_dXO2cnGOaoQkOelZZLCV1Q_4) (echoItem_AE0mmShqUjG5kv6VH7WejQ)); T1_.ClE_0 = NIM_NIL;
	forEach_eW0SPyBT9bs68AUiDXLgLJA(T1_);
	popFrame();
}

NIM_EXTERNC N_NOINLINE(void, helloworldDatInit000)(void) {
}
