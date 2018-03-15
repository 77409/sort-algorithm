#!/bin/bash
# 　归并排序算法的运作如下：
#
# 1. 申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列
# 2. 设定两个指针，最初位置分别为两个已经排序序列的起始位置
# 3. 比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置
# 4. 重复步骤3直到某一指针到达序列尾
# 5. 将另一序列剩下的所有元素直接复制到合并序列尾

A=()
len=0

function merge()   # 合并两个已排好序的数组A[left...mid]和A[mid+1...right]
{
    local left=$1
    local mid=$2
    local right=$3
    local len=$((right - left + 1))
    local temp=()        # 辅助空间O(n)
    local index=0
    local i=$left        # 前一数组的起始元素
    local j=$((mid + 1)) # 后一数组的起始元素
    while ((i <= mid && j <= right))
    do
        #echo "$i="${A[$i]} " $j="${A[$j]}
        (( temp[$index]=${A[$i]}<=${A[$j]}?${A[$((i++))]}:${A[$((j++))]} ))  # 带等号保证归并排序的稳定性
        ((index++))
    done
    while ((i <= mid))
    do
        temp[$index]=${A[$((i++))]}
        ((index++))
    done
    while ((j <= right))
    do
        temp[$index]=${A[$((j++))]}
        ((index++))
    done
    echo $index " "${temp[*]}
    for (( k = 0; k < len; k++))
    {
        #echo $k"="${temp[$k]}
        A[$((left++))]=${temp[$k]}
    }
}


function merge_sort(){
    n=$1
    for (( i = 1; i < len; i *= 2))        # 子数组的大小i初始为1，每轮翻倍
    {
        left=0
        while ((left + i < len))              # 后一个子数组存在(需要归并)
        do
            ((mid = left + i - 1))
            ((right = mid + i < len ? mid + i : len - 1)) # 后一个子数组大小可能不够
            merge $left $mid $right
            ((left = right + 1))               # 前一个子数组索引向后移动
        done
    }
}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    merge_sort $len
    printf "共%d个元素，冒泡排序结果：" $len
    for (( i = 0; i < len; i++))
    {
        echo -n " "${A[i]}
    }
    printf "\n"
}
main
