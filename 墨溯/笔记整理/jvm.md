# custom IntelliJ IDEA VM options

    -Xms6000m
    -Xmx6000m
    -XX:ReservedCodeCacheSize=1024m
    -XX:+UseCompressedOops
    -Dfile.encoding=UTF-8
    -Dsun.io.useCanonCaches=false
    -Dsun.awt.keepWorkingSetOnMinimize=true
    -Djava.net.preferIPv4Stack=true
    -Djsse.enableSNIExtension=false
    -XX:+UseCodeCacheFlushing
    -XX:+UseG1GC
    -XX:MaxGCPauseMillis=200
    -XX:InitiatingHeapOccupancyPercent=70
    -XX:NewRatio=1
    -XX:SurvivorRatio=4
    -XX:+UseConcMarkSweepGC
    -XX:SoftRefLRUPolicyMSPerMB=50

    -XX:+CMSParallelRemarkEnabled

    -XX:ConcGCThreads=8

    -XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
    -XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof
    -Xbootclasspath/a:../lib/boot.jar