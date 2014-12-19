all: stamp

stamp:
	touch $(CURDIR)/stamp

clean:
	rm -f $(CURDIR)/stamp

install:
	install -d $(DESTDIR)/usr/sbin
	install $(CURDIR)/poweriso $(DESTDIR)/usr/sbin
	install $(CURDIR)/PowerISO $(DESTDIR)/usr/sbin
	cp -r $(CURDIR)/usr/share $(DESTDIR)/usr/share

uninstall:
	rm $(DESTDIR)/usr/sbin/poweriso
	rm $(DESTDIR)/usr/sbin/PowerISO