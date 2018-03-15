#!/bin/bash
# 　希尔排序算法的运作如下：
#   
# 希尔排序是基于插入排序的以下两点性质而提出改进方法的：
# 1. 插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率
# 2. 但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位

A=()
len=0

function swap(){
    local i=$1
    local j=$2
    local temp=${A[i]}
    A[$i]=${A[j]}
    A[$j]=$temp

}

function shell_sort(){
    n=$1
    h=0
    while ((h <= n))                          # 生成初始增量
    do
        ((h = 3 * h + 1))
    done
    while ((h >= 1))
    do
        for (( i = h; i < n; i++))
        {
            ((j = i - h))
            get=${A[i]}
            while ((j >= 0 && A[j] > get))
            do
                ((A[$((j + h))] = ${A[j]}))
                ((j = j - h))
            done
            A[$((j + h))]=$get
        }
        ((h = (h - 1) / 3))                   # 递减增量
    done
}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    shell_sort $len
    printf "共%d个元素，希尔排序结果：" $len
    for (( i = 0; i < len; i++))
    {
        echo -n " "${A[i]}
    }
    printf "\n"
}
main
