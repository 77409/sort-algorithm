#!/bin/bash
# 　冒泡排序算法的运作如下：
#
# 1. 比较相邻的元素，如果前一个比后一个大，就把它们两个调换位置。
# 2. 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
# 3. 针对所有的元素重复以上的步骤，除了最后一个。
# 4. 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。

A=()
len=0

function swap(){
    local i=$1
    local j=$2
    local temp=${A[i]}
    A[$i]=${A[j]}
    A[$j]=$temp

}

function bubble_sort(){
    n=$1
    for (( j = 0; j<n; j++))             #  每次最大元素就像气泡一样"浮"到数组的最后
    {
        for (( i=0; i < n-1-j; i++)) # 依次比较相邻的两个元素,使较大的那个向后移
        {
            if (( ${A[i]} > ${A[i + 1]} ))
            then
                swap $i $((i+1))
            fi
        }
    }

}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    bubble_sort $len
    printf "共%d个元素，冒泡排序结果：" $len
    for (( i = 0; i < len; i++))
    {
        echo -n " "${A[i]}
    }
    printf "\n"
}
main
