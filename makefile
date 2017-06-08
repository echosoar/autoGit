.PHONY: all commit

BUILDID=$(shell date +%Y%m%d-%H:%M:%S)
NOWBRANCH=$(shell git rev-parse --abbrev-ref HEAD)

all: push

autoGit:
	@echo AutoGit by echosoar

add: autoGit
	@git add --all
	@echo add success

commit: add
	@git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'
	@echo commit success

push: commit
	@git push origin ${NOWBRANCH}
	@echo push ${NOWBRANCH} success

