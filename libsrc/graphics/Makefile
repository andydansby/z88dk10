#
# Wahey, a messed up makefile for building libraries!
#
# $Id: Makefile,v 1.28 2011/11/25 09:46:08 stefano Exp $


lx11:
	cd x11 ; $(MAKE) ; cd ..

lc128:
	cd c128 ; $(MAKE) ; cd ..
	cd c128_64k ; $(MAKE) ; cd ..

lenterprise:
	cd enterprise ; $(MAKE) ; cd ..

lenterprisehr:
	cd enterprise_hr ; $(MAKE) ; cd ..

clean:
	$(RM) *.o
	$(RM) 8080/*.o
	$(RM) abc80/*.o
	$(RM) ace/*.o
	$(RM) aquarius/*.o
	cd c128 ; $(MAKE) clean ; cd ..
	cd c128_64k ; $(MAKE) clean ; cd ..
	$(RM) cpc/*.o
	cd enterprise ; $(MAKE) clean ; cd ..
	cd enterprise_hr ; $(MAKE) clean ; cd ..
	$(RM) gal/*.o
	$(RM) gray/*.o
	$(RM) gray/ticalc/*.o
	$(RM) gray/cpc/*.o
	$(RM) gray/zx81/*.o
	$(RM) msx/*.o
	$(RM) msx/surface/*.o
	$(RM) mz/*.o
	$(RM) nascom/*.o
	$(RM) osca/*.o
	$(RM) oz/*.o
	$(RM) sam/*.o
	$(RM) spectrum/*.o
	$(RM) text/*.o
	$(RM) text6/*.o
	$(RM) ticalc/*.o
	$(RM) trs80/*.o
	$(RM) ts2068hr/*.o
	$(RM) vz200/*.o
	$(RM) z88/*.o
	$(RM) zx81/*.o
	$(RM) zx81/hr/*.o
	cd x11 ; $(MAKE) clean ; cd ..
