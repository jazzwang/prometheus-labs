all:
	@echo "Usage:"
	@echo ""
	@echo "  make init - "
	@echo ""
init: check
	@sbin/init.sh
	@sbin/build.sh
test:
	@sbin/test.sh
stop:
	@sbin/stop.sh
down:
	@sbin/down.sh
check:
	@sbin/check.sh
clean:
	@sbin/clean.sh
distclean: clean
	@sbin/distclean.sh
