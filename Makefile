all:
	@echo "Usage:"
	@echo ""
	@echo "  make init - "
	@echo ""
init: check
	@sbin/init.sh
build:
	@sbin/build.sh
test: init build
	@sbin/test.sh
stop:
	@sbin/stop.sh
down:
	@sbin/down.sh
check:
	@sbin/check.sh
clean:
	@sbin/clean.sh
distclean:
	@sbin/distclean.sh
