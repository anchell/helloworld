ALL_CFLAGS = $(CFLAGS)

prefix     ?= /usr
bindir     ?= $(exec_prefix)/bin
includedir ?= $(prefix)/include

.PHONY: all install clean

all: helloworld

helloworld: helloworld.o
	$(CXX) $(ALL_CFLAGS) $(CXXFLAGS) $(INCLUDES) $^ -o $@

install:
	install -d $(DESTDIR)$(bindir)
	install -d $(DESTDIR)$(includedir)/helloworld
	install -m 755 helloworld $(DESTDIR)$(bindir)/helloworld
	install -m 644 helloworld.h $(DESTDIR)$(includedir)/helloworld/helloworld.h

clean:
	rm -rf helloworld *.o

%.o : %.cpp
	$(CXX) $(ALL_CFLAGS) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

