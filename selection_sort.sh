#!/bin/bash
# 　选择排序(Selection Sort)算法的运作如下：
#
# 初始时在序列中找到最小（大）元素，放到序列的起始位置作为已排序序列；
# 然后，再从剩余未排序元素中继续寻找最小（大）元素，放到已排序序列的末尾。
# 以此类推，直到所有元素均排序完毕。

source commond.sh

function selection_sort(){
    n=$1
    for (( i = 0; i < n - 1; i++))         # i为已排序序列的末尾
    {
        min=$i
        for (( j = i + 1; j < n; j++))     # 未排序序列
        {
            if ((${A[j]} < ${A[min]}))              # 找出未排序序列中的最小值
            then
                min=$j
            fi
        }
        if ((min != i))
        then
            swap $min $i    # 放到已排序序列的末尾，该操作很有可能把稳定性打乱，所以选择排序是不稳定的排序算法
        fi
    }
}

function main(){
    start=$(timestamp)
    selection_sort $len
    end=$(timestamp)
    printf "共%d个元素，选择排序（%d ms）结果：" $len $(($end-$start))
    # for (( i = 0; i < len; i++))
    # {
    #     echo -n " "${A[i]}
    # }
    # printf "\n"
}
main
