/java -XX:+PrintFlagsFinal -version| grep PretenureSizeThreshold 查询某个JVM参数的正确值

1、JVM对于大对象的分配策略JVM参数查找

2、JVM对于大对象即使survivor回收都无法存放的担保分配策略-绿色通道https://blog.csdn.net/en\_joker/article/details/79787961

3、JVM对于对象从survivor晋升old区的动态年龄判定https://my.oschina.net/xpbob/blog/2221709

4、GC到底影响了什么？RT以及吞吐量https://tech.meituan.com/jvm\_optimize.html

5、常见的基础垃圾回收算法，什么时候minorGC会退化成full GC，CMS的普通GC对JVM的停顿大吗？

6、后端拥有的资源是哪些？如何合理的调配。

7、目前应用的cpu很高，查看热点方法

8、如何解决，应用吞吐量极高

1、查看应用本身响应情况 没有发现异常，包括依赖的中间件服务

2、上周同比应用的调用量，发现预售期向正式期过渡流量涨了一倍，但是按照机器数来说，不应该会有如此明显的GC

3、dump负载比较高的应用，怀疑是内存泄漏导致

4、内存泄漏问题排除，查看线程堆栈，发现切图方法引用的内存很大。超过其余的常规方法。同时应用的CPU占用也比较高。

5、抓取热点方法，发现确实切图相关引用占据CPU热点前三。

6、可以确定是切图方法导致的问题。查看代码，发现问题所在，频繁分配字节数组大对象等。需要连续内存。

7、分析问题原因：切图流量很大，在eden区频繁的生成大对象，至少1M以上。

eden区很快被撑满，导致频繁的minor GC.

minorGc进行的过程中，或有两种情况：

W通过担保分配机制，此时本来要放到eden区的内存对象直接晋升到老年代。

这也是导致频繁的full GC的元凶。

2、survivor区可以存放eden区过来的对象，此时正常minorGC

因为切图需要从远端下载完整图片的流到本地内存，导致eden去增长非常快。

8、查看单台机器的GC情况，佐证猜测。

9、如何优化？

CMSGC 虽然响应速度很快，但是会导致

分析出问题的dump

http://zprofiler.alibaba-inc.com/heap/leak\_reports.htm?file\_name=11.8.107.86-20181101110121013-jmap.log-fulei.yfl-6721682.bin

还有如何解决eden区域增长太快的问题！

确认是切图方法导致的增长过快：http://zprofiler.alibaba-inc.com/heap/thread\_overview.htm?file\_name=11.186.137.101-20181101172804838-jmap.log-fulei.yfl-6736104.bin