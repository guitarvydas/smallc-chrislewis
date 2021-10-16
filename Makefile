CC=gcc

LIB = scclib.a

FE =	(kr_data.c) \
	(kr_error.c) \
	(kr_expr.c) \
	(kr_function.c) \
	(kr_gen.c) \
	(kr_io.c) \
	(kr_lex.c) \
	(kr_main.c) \
	(kr_preproc.c) \
	(kr_primary.c) \
	(kr_stmt.c) \
	(kr_sym.c) \
	(kr_while.c)

c99FE =	(c99_data.c) \
	(c99_error.c) \
	(c99_expr.c) \
	(c99_function.c) \
	(c99_gen.c) \
	(c99_io.c) \
	(c99_lex.c) \
	(c99_main.c) \
	(c99_preproc.c) \
	(c99_primary.c) \
	(c99_stmt.c) \
	(c99_sym.c) \
	(c99_while.c)

FE =	(c99_data.o) \
	(c99_error.o) \
	(c99_expr.o) \
	(c99_function.o) \
	(c99_gen.o) \
	(c99_io.o) \
	(c99_lex.o) \
	(c99_main.o) \
	(c99_preproc.o) \
	(c99_primary.o) \
	(c99_stmt.o) \
	(c99_sym.o) \
	(c99_while.o)

all : fe

fe: $(FE)

$(FE) code8080.o codeas09.o codevax.o codem68k.o: defs.h data.h

#Alternately, you may have to do an lorder
$(LIB):	$(FE)
	-ranlib $(LIB)
	-ucb ranlib $(LIB)

scc8080:	code8080.o $(LIB)
	$(CC) -o scc8080 $(CFLAGS) $(LIB) code8080.o

sccas09:	codeas09.o $(LIB)
	$(CC) -o sccas09 $(CFLAGS) $(LIB) codeas09.o

sccvax:		codevax.o $(LIB)
	$(CC) -o sccvax $(CFLAGS) $(LIB) codevax.o

sccm68k:	codem68k.o $(LIB)
	$(CC) -o sccm68k $(CFLAGS) $(LIB) codem68k.o

print:
	pr -n defs.h data.h data.c error.c expr.c function.c gen.c \
		io.c lex.c main.c preproc.c primary.c stmt.c \
		sym.c while.c code*.c | lp
clean:
	rm -f $(LIB) code8080.o codeas09.o codevax.o codem68k.o \
		     sccvax scc8080 sccas09 sccm68k
