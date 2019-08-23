重新加载

放入component continer

直接取出instance，instance没有状态的，新建classLoader进行装配并生成实例，即可

这也是metaSpace空间不足的原因了

为啥metaSpace没有卸载掉，这是因为什么？

ModuleHolder是一个Map，也正因为此，当生成新的实例的时候，只是没有地方引用到老的实例了

* 该类所有的实例都已经被GC。
* 加载该类的ClassLoader实例已经被GC。
* 该类的java.lang.Class对象没有在任何地方被引用。

jad指令发现ClassLoader所加载的Class是被卸载的了。

jad指令实现的机制是？

热部署的机制

    SpringFactoriesLoader 在部分版本可能存在缓存

    jstat -class 确认可以查找到classloader的相关信息，包含卸载及增加等的信息

    同时观察metaspace的容量占用以及占用比例，确认是可以进行卸载的

    同时arthas的jad指令，也是能够证明这个问题的

    附上<http://www.cellei.com/blog/2018/06231> 

    jstat的用法。

    - 实际对于java开发而言，JVM的两种行为最难琢磨

    1、内存垃圾回收等

    2、编译信息，比如JIT等信息的获取

    比如我们再重启机器或者扩容的时候经常会遇到估算容量不准确的问题，这就是比较尴尬的。

    Java agent是在编译期加载东西