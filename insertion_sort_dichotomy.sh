#!/bin/bash
# 　二分插入排序算法的运作如下：
#
# 采用二分查找法来减少比较操作的次数，我们称为二分插入排序

A=()
len=0

function swap(){
    local i=$1
    local j=$2
    local temp=${A[i]}
    A[$i]=${A[j]}
    A[$j]=$temp

}

function insertion_sort_dichotomy(){
    n=$1
    for (( i = 1; i < n; i++))
    {
        get=${A[i]}                    # 右手抓到一张扑克牌
        left=0                    # 拿在左手上的牌总是排序好的，所以可以用二分法
        ((right = i - 1))                # 手牌左右边界进行初始化
        while ((left <= right))            # 采用二分法定位新牌的位置
        do
            (( mid = (left + right) / 2))
            if ((${A[$mid]} > $get))
            then
                ((right = mid - 1))
            else
                ((left = mid + 1))
            fi
        done
        for (( j = i - 1; j >= left; j--))    # 将欲插入新牌位置右边的牌整体向右移动一个单位
        {
            A[$((j + 1))]=${A[j]}
        }
        A[$left]=$get                    # 将抓到的牌插入手牌
    }
}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    insertion_sort_dichotomy $len
    printf "共%d个元素，二分插入排序结果：" $len
    for (( i = 0; i < len; i++))
    {
            echo -n " "${A[i]}
        }
        printf "\n"
}
main
