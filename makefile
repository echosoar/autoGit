# GMF
# @author:echosoar
# @site: https://github.com/echosoar/autoGit

.PHONY: all ci ad ps npmbuild

BUILDID = $(shell date +%Y%m%d-%H:%M:%S)
NOWBRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NPMFILE = ./package.json

all: ps

autoGit:
	@echo GMF by echosoar

# check can execute orders npm run build
npmbuild:
ifeq ($(shell test -e $(NPMFILE) && echo -n yes), yes)
ifeq ("$(shell grep scripts $(NPMFILE))", "build")
ifeq ("$(shell grep build $(NPMFILE))", "build")
		npm run build
endif
endif
endif

# git add
ad: autoGit npmbuild
	@git add --all

# git commit
ci: ad
	@git commit -m '🚀 commit at $(BUILDID) by echosoar/gmf'

# git push
ps: ci
	@git push origin ${NOWBRANCH}
	@echo success

