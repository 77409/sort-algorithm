## 几种常见的排序算法
# 
bubble_sort.sh 					-> 冒泡排序
# 
cocktail_sort.sh 				-> 鸡尾排序
# 
insertion_sort.sh				-> 插入排序
# 
insertion_sort_dichotomy.sh		-> 二分法插入排序
# 
merge_sort.sh					-> 合并排序
# 
selection_sort.sh				-> 选择排序
# 
shell_sort.sh					-> 希尔排序
# 
mac上会出现date命令执行失败的情况，可以将commond.sh中的一下代码注释掉，然后用time命令自行统计。
```shell
# 精确到毫秒的时间戳
function timestamp(){
    # echo `date +%s`$(printf "%03d" $((10#`date +%N`/1000000)))
}

```
```
for file in ./*.sh ; do time $file; done
```
