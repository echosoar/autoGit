.PHONY: all commit

BUILDID = $(shell date +%Y%m%d-%H:%M:%S)
NOWBRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NPMFILE = ./package.json

all: push

autoGit:
	@echo AutoGit by echosoar

npmbuild:
ifeq ($(shell test -e $(NPMFILE) && echo -n yes), yes)
ifeq ("$(shell grep build $(NPMFILE))", "build")
		npm run build
endif
endif

add: autoGit npmbuild
	@git add --all

commit: add
	@git commit -m 'Auto commit at $(BUILDID) by echosoar/autoGit'

push: commit
	@git push origin ${NOWBRANCH}
	@echo success

