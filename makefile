# GMF
# @author:echosoar
# @site: https://github.com/echosoar/autoGit
# @version: 0.0.1
# 
# The best way to use:
# curl -o makefile https://raw.githubusercontent.com/echosoar/gmf/master/makefile

.PHONY: all ci ad ps npmbuild build
.IGNORE: init

BUILDID = $(shell date +%Y/%m/%d-%H:%M:%S)
NOWBRANCH = $(shell git rev-parse --abbrev-ref HEAD)
NPMFILE = ./package.json
ECHOSOAR = "https://raw.githubusercontent.com/echosoar/"
CCONF = "$(ECHOSOAR)cconf/master/"

all:
	make up
	make ps

autoGit:
	@echo GMF by echosoar

# check can execute orders npm run build
npmbuild:
ifeq ($(shell test -e $(NPMFILE) && echo -n yes), yes)
ifeq ("$(shell grep scripts $(NPMFILE))", "scripts")
ifeq ("$(shell grep build $(NPMFILE))", "build")
		npm run build
endif
endif
endif

# git add
ad: autoGit npmbuild
	git add --all

# git commit
ci: ad
	git commit -m 'commit at $(BUILDID) by echosoar/gmf'

# git push
ps: ci
	git push origin ${NOWBRANCH}

build: npmbuild

# 初始化项目，生成src、build、doc、test、libs、demo文件夹和生成.gitignore
init:
	@mkdir src build doc test libs demo

# 初始化js项目，生成package.json、src/index.js、demo/index.html、.babelrc、.eslintrc
initjs: init
	rm -f package.json .babelrc .eslintrc.js
	@curl -O $(CCONF)js/package.json
	@curl -O $(CCONF)js/.babelrc
	@curl -O $(CCONF)js/.eslintrc.js
	@curl -O $(CCONF)js/webpack.config.js
	@curl -O $(CCONF)js/.gitignore
	@curl -o ./demo/index.html $(CCONF)js/demo.html
	touch ./src/index.js

# update makefile
up:
	@curl -O $(ECHOSOAR)gmf/master/makefile

