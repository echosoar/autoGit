# GMF
项目初始化、构建、提交、发布等操作一键即可！

### GMF是什么？
GMF基于makefile，提供了项目初期开发环境的初始化（譬如ES6、React生态等），一键就可完成构建、提交和发布流程，简化了开发时的操作，让你更专注于项目的开发。

### GMF如何使用？
```
# 最佳使用方式（例如开发一个基于es6的前端项目）：
# 首先将GMF的makefile文件放入你的项目目录中
curl -O https://raw.githubusercontent.com/echosoar/gmf/master/makefile
# 然后执行 
make initjs
# 你就会发现项目目录、webpack、babel、eslint等等都已经生成并且配置OK了

# 项目开发完成后，执行
make
# 那么GMF就会自动触发npm build、git add、git commit、git push等等操作
```
### GMF目前的能力（命令）：
1. make
触发make的远程升级、构建、提交和发布一系列流程。
2. make ps
一键执行构建、提交和发布（git add、git commit、git push）。
3. make init type=js
初始化基于es6+的前端开发环境。
4. make init type=preactRollup
初始化基于preact + rollup的前端开发环境。

更多支持的初始化内容请参阅 CConf https://github.com/echosoar/cconf
 
© GMF by echosoar
