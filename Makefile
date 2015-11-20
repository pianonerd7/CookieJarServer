C = clang
# -g : allows use of GNU Debugger
# -Wall : show all warnings
CFLAGS = -g -Wall -Wno-unused-variable
LIBS = # None yet...
CSOURCE1 = Judy.c Cookie_clnt.c Cookie_xdr.c
CSOURCE2 = Tina.c Cookie_clnt.c Cookie_xdr.c
SSOURCE = Mother.c Cookie_svc.c Cookie_xdr.c
RPCSRC = Cookie.x
RPCGEN = Cookie.h Cookie_clnt.c Cookie_svc.c Cookie_xdr.c
CLIENT1 = Judy
CLIENT2 = Tina
SERVER = Mother

all: $(CLIENT1) $(CLIENT2) $(SERVER)

$(CLIENT1): $(CSOURCE1) $(RPCGEN)
	$(CC) $(LIBS) $(CFLAGS) -o $(CLIENT1) $(CSOURCE1)

$(CLIENT2): $(CSOURCE2) $(RPCGEN)
	$(CC) $(LIBS) $(CFLAGS) -o $(CLIENT2) $(CSOURCE2)

$(SERVER): $(SSOURCE) $(RPCGEN)
	$(CC) $(LIBS) $(CFLAGS) -o $(SERVER) $(SSOURCE)

$(RPCGEN): $(RPCSRC)
	rpcgen $(RPCSRC)

# 'clean' rule for remove non-source files
# To use, call 'make clean'
# Note: you don't have to call this in between every
# compilation, it's only in case you need to
# clean out your directory for some reason.
clean:
	@# Using the '@' sign suppresses echoing
	@# the line while the command is run
	rm -f $(CLIENT1) $(CLIENT2) $(SERVER) $(RPCGEN)