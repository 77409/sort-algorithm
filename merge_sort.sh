#!/bin/bash
# 　归并排序算法的运作如下：
#
# 基本思路就是将数组分成二组A，B，如果这二组组内的数据都是有序的，那么就可以很方便的将这二组数据进行排序。如何让这二组组内数据有序了？
# 可以将A，B组各自再分成二组。
# 依次类推，当分出来的小组只有一个数据时，可以认为这个小组组内已经达到了有序;
# 然后再合并相邻的二个小组就可以了。
# 这样通过先递归的分解数列，再合并数列就完成了归并排序。


source ./commond.sh

function merge()   # 合并两个已排好序的数组A[left...mid]和A[mid+1...right]
{
    local left=$1
    local mid=$2
    local right=$3
    local len=$(($right - $left + 1))
    local temp=()        # 辅助空间O(n)
    local index=0
    local i=$left        # 前一数组的起始元素
    local j=$(($mid + 1)) # 后一数组的起始元素
    # echo $i" "$mid" "$j" "$right
    while ((i <= mid && j <= right))
    do
        # echo "$i="${A[$i]} " $j="${A[$j]}
        if (( ${A[$i]} <= ${A[$j]} )) ;then
            temp[$index]=${A[$((i))]}
            ((i++))
        else
            temp[$index]=${A[$((j))]}
            ((j++))
        fi
        # (( temp[$index] = ${A[$i]} <= ${A[$j]} ? ${A[$((i++))]} : ${A[$((j++))]} ))  # 带等号保证归并排序的稳定性
        ((index++))
        # echo $index
    done
    while ((i <= mid))
    do
        temp[$index]=${A[$((i))]}
        ((i++))
        ((index++))
    done
    while ((j <= right))
    do
        temp[$index]=${A[$((j))]}
        ((j++))
        ((index++))
    done
    # echo $index " "${temp[*]}
    for (( k = 0; k < index; k++, left++))
    {
        #echo $k"="${temp[$k]}
        A[$left]=${temp[$k]}
    }
}

# 有两个实现思路，递归和迭代，先用递归试试，目测递归用在shell里面够呛
function merge_sort(){
    local head=$1
    local tail=$2
    if (( head < tail )) ;then
        local mid=$(( (tail + head) / 2 ))
        # echo  $head' '$mid" "$tail
        merge_sort $head $mid
        merge_sort $((mid + 1)) $tail
        merge $head $mid $tail
    fi
    # n=$1
    # for (( i = 1; i < len; i *= 2))        # 子数组的大小i初始为1，每轮翻倍
    # {

    #     left=0
    #     while ((left + i < len))              # 后一个子数组存在(需要归并)
    #     do
    #         ((mid = left + i - 1))
    #         ((right = mid + i < len ? mid + i : len - 1)) # 后一个子数组大小可能不够
    #         merge $left $mid $right
    #         ((left = right + 1))               # 前一个子数组索引向后移动
    #     done
    # }
}

function main(){
    start=$(timestamp)
    merge_sort 0 $(($len - 1))
    end=$(timestamp)
    printf "共%d个元素，归并排序（%d ms）结果：" $len $(($end-$start))
    # for (( i = 0; i < len; i++))
    # {
    #     echo -n " "${A[i]}
    # }
    # printf "\n"
}
main
