.PHONY: all commit

BUILDID=$(shell date +%Y%m%d-%H:%M:%S)

all: commit

commit:
	git add --all
	git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'

