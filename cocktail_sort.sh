#!/bin/bash
# 　鸡尾酒排序算法的运作如下：
#
# 也叫定向冒泡排序，是冒泡排序的一种改进。此算法与冒泡排序的不同处在于从低到高然后从高到低，而冒泡排序则仅从低到高去比较序列里的每个元素


A=()
len=0

function swap(){
    local i=$1
    local j=$2
    local temp=${A[i]}
    A[$i]=${A[j]}
    A[$j]=$temp

}

function cocktail_sort(){
    left=0
    n=$1
    right=$((n-1))
    while ((left < right))
    do
        for (( i = left; i < right; i++))   # 前半轮,将最大元素放到后面
        {
			if ((${A[i]} > ${A[i + 1]}))
            then
                swap $i $((i + 1))
            fi
        }
        ((right--))
        for (( i = right; i > left; i--))   # 后半轮,将最小元素放到前面
        {
            if ((${A[i - 1]} > ${A[i]}))
            then
                swap $((i - 1)) $i
            fi
        }
        ((left++))
    done
}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    cocktail_sort $len
    printf "共%d个元素，鸡尾酒排序结果：" $len
    for (( i = 0; i < len; i++))
    {
        echo -n " "${A[i]}
    }
    printf "\n"
}
main
