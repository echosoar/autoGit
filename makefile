.PHONY: all commit

BUILDID=$(shell date +%Y%m%d-%H:%M:%S)
NOWBRANCH=$(shell git rev-parse --abbrev-ref HEAD)

all: push

add:
	git add --all

commit: add
	git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'

push: commit
	git push origin ${NOWBRANCH}
