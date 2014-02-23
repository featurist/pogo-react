all: test

test:
	./node_modules/.bin/mocha test/*test.pogo

.PHONY: test