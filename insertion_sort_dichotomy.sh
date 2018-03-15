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

function insertion_sort_dichotomy(){
    n=$1
    for (int i = 1; i < n; i++)
    {
        int get = A[i];                    // 右手抓到一张扑克牌
        int left = 0;                    // 拿在左手上的牌总是排序好的，所以可以用二分法
        int right = i - 1;                // 手牌左右边界进行初始化
        while (left <= right)            // 采用二分法定位新牌的位置
        {
            int mid = (left + right) / 2;
            if (A[mid] > get)
                right = mid - 1;
            else
                left = mid + 1;
        }
        for (int j = i - 1; j >= left; j--)    // 将欲插入新牌位置右边的牌整体向右移动一个单位
        {
            A[j + 1] = A[j];
        }
        A[left] = get;                    // 将抓到的牌插入手牌
    }
}

function main(){
    A=(`cat random.txt`)
    len=${#A[@]}
    insertion_sort_dichotomy $len
    printf "共%d个元素，冒泡排序结果：" $len
    for (( i = 0; i < len; i++))
    {
            echo -n " "${A[i]}
        }
        printf "\n"
}
main
