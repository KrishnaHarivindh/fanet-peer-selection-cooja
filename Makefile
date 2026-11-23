CONTIKI_PROJECT = fanet_disaster_peer_selection
all: $(CONTIKI_PROJECT)

CONTIKI = ../..
MAKE_NET = MAKE_NET_NULLNET
include $(CONTIKI)/Makefile.include
