1、启动TelnetServer，监听对应的Telnet发来的消息

2、交给handler，然后直接新建job，处理并回写

3、实际上使用了termd的consumer的回调
com.taobao.arthas.core.shell.handlers.term.RequestHandler#accept
进行数据的获取
获取之后新建process以及command，得到命令执行之后回写等。


4、数据如何会写
新建job的时候，新建回写的handler，进行回写，每一次的command请求都是一个Process的实体。
进行相关数据的回写。持有一个term的实例进行回写。

基本设置的初始化以及运行时候的链路，我们大致可以分为这两块部分


TermImpl 这个是和termd这个jar做交互的最重要的类

arthas
druid
fastjson

- 引导入口
- 架构
	- agent初始化,attath 到目标pid，加载自己的类，如何干预系统原有的类，进行增强等等。
	- client初始化
		- HTTP 
		- TELNET
	- 用户交互
		- Term
		- 收集用户指令
		- 执行指令
		- 回写指令
- 消息通知
	- 收集 回写 redirect 以及 grep 的 支持等 
	- 多个角色之间的通信 
		- 用户 控制台 实际的command执行者等等
		- command如何实现复杂指令支持，比如TT
		- watch等等

	- 指令的寻找等，如何找到合适的指令，基于指令的扩展架构，比如增强型的trace应该如何做？
- 优化
	- 如果让你设计架构，你如何设计？交互式的设计等等，
	- 都值得我们思考？
	 	 


