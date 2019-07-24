# 载波侦听

##	物理载波侦听
- 由物理层提供（e.g., 通过检测信号能量），取决于所使用的媒介和调制方式。

##  虚拟载波侦听
-  网络分配矢量NAV (Network Allocation Vector)，表示媒介空闲剩余
时间值。
-  802.11帧包含duration段，预定媒介使用时间。
-  NAV有一个相关计时器，单位微秒，计时器0，认为空闲。
-  工作站持续监听该字段，基于持续时间信息来推迟发送。
只要两个中任一个侦听显示媒介处于忙态，就认定为是忙态。

#### clear channel assessment (PHY-CCA)
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image009.jpg)
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image012.jpg)
 

#### 信道参数影响
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image013.jpg)
 
 
#### 案例示意图
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image015.jpg)
 
 
##参数调整说明
-	调整信道参数到-70dBm
-	对比调整前后各一周AP吞吐量和信道繁忙率变化情况

##	宁波试点
- 宁波大红鹰学院26号楼，145个AP
- 从9:00~23:00每个时段采集1次，调整前后各采集一周
##	衢州试点
- 衢州学院4号楼热点，46个AP
- 从12:00~23:00每个时段采集1次，调整前后各采集一周
 
#### 参数调整前速率
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image019.jpg)
 
 
#### 调整前信道繁忙率
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image021.jpg)
 
 
#### 流量-信道繁忙率关系
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image023.jpg)
 
 
#### 试点热点流量-繁忙率横向比较
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image025.jpg)
 
 
#### 调整前后AP速率对比
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image027.jpg)
 
 
#### 调整前后信道繁忙率对比
![image](https://github.com/douboer/netoptimize/blob/master/docs/imgs/image029.jpg)
 
## 结论
-	通过大量数据的统计分析结果可以看出，调整后AP平均速率和信道繁忙率提高。
-	通过后续跟踪测试和调整前体验相对较差宿舍用户的反馈情况看，在忙时终端用户的感受有明显提升。
