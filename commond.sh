#!/bin/bash

# 交换函数
function swap(){
    local i=$1
    local j=$2
    local temp=${A[i]}
    A[$i]=${A[j]}
    A[$j]=$temp
}

# 精确到毫秒的时间戳
function timestamp(){
    echo `date +%s`$(printf "%03d" $((10#`date +%N`/1000000)))
}

A=(`cat random.txt`)
len=${#A[@]}