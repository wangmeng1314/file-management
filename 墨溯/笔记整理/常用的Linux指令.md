![IMAGE](resources/3AFA823030157EBA5DEEE3FB4373D19D.jpg =1824x626)
目前系统的情况

cat fliggyshopcdn.m.taobao.com_2018_10_30_180000_190000 | awk '{print $8}'| sort | uniq -c | sort -r -n | head -n 100



./jmap -histo   1706|more 查看目前JVM的对象的instance数以及占用的内存大小

sudo dmesg|grep -i kill|less
查找有无OOM KILLER发生