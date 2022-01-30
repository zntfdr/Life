prefix ?= /usr/local
bindir = $(prefix)/bin

install:
	swift build -c release
	install ".build/release/life-cli" "$(bindir)/life"

uninstall:
	rm -rf "$(bindir)/life"
