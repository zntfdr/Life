prefix ?= /usr/local
bindir = $(prefix)/bin
libdir = $(prefix)/lib

install:
	swift build -c release
	install ".build/release/life-cli" "$(bindir)/life"
	install ".build/release/libSwiftToolsSupport.dylib" "$(libdir)"
	install_name_tool -change \
		".build/x86_64-apple-macosx10.10/release/libSwiftToolsSupport.dylib" \
		"$(libdir)/libSwiftToolsSupport.dylib" \
		"$(bindir)/life"

uninstall:
	rm -rf "$(bindir)/life"
	rm -rf "$(libdir)/libSwiftToolsSupport.dylib"
