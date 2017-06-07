.PHONY: all commit

BUILDID=$(shell date +%Y%m%d-%H:%M:%S)

all: commit

add:
	git add --all

commit: add
	git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'

