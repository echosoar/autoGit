.PHONY: all commit

BUILDID=$(shell date +%Y%m%d-%H:%M:%S)

all: commit

commit:
	git add -A .
	git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'

