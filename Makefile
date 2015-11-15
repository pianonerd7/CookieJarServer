CC = clang
# -g : allows use of GNU Debugger
# -Wall : show all warnings
CFLAGS = -g -Wall
LIBS = # None yet...
CSOURCE = Judy.c Tina.c Cookie_clnt.c Cookie_xdr.c
SSOURCE = Mother.c Cookie_svc.c Cookie_xdr.c
RPCSRC = Cookie.x
RPCGEN = Cookie.h Cookie_clnt.c Cookie_svc.c Cookie_xdr.c
CLIENT = Judy Tina
SERVER = Mother

all: $(CLIENT) $(SERVER)

eater: $(CSOURCE) $(RPCGEN)
	$(CC) $(LIBS) $(CFLAGS) -o $(CLIENT) $(CSOURCE)

agent: $(SSOURCE) $(RPCGEN)
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
	rm -f $(CLIENT) $(SERVER) $(RPCGEN)