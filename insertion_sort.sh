#!/bin/bash
# 　插入排序算法的运作如下：
#
# 1. 从第一个元素开始，该元素可以认为已经被排序
# 2. 取出下一个元素，在已经排序的元素序列中从后向前扫描
# 3. 如果该元素（已排序）大于新元素，将该元素移到下一位置
# 4. 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
# 5. 将新元素插入到该位置后
# 6. 重复步骤2~5

source commond.sh

function insertion_sort(){
    n=$1
    for (( i = 1; i < n; i++))         # 类似抓扑克牌排序
    {
        get=${A[i]}                     # 右手抓到一张扑克牌
        j=$((i - 1))                    # 拿在左手上的牌总是排序好的
        while (($j >= 0 && ${A[j]} > $get))    # 将抓到的牌与手牌从右向左进行比较
        do
            A[$((j+1))]=${A[j]}            # 如果该手牌比抓到的牌大，就将其右移
            ((j--))
        done
        A[$((j + 1))]=$get; # 直到该手牌比抓到的牌小(或二者相等)，将抓到的牌插入到该手牌右边(相等元素的相对次序未变，所以插入排序是稳定的)
    }
}

function main(){
    start=$(timestamp)
    insertion_sort $len
    end=$(timestamp)
    printf "共%d个元素，插入排序（%d ms）结果：" $len $(($end-$start))
    # for (( i = 0; i < len; i++))
    # {
    #         echo -n " "${A[i]}
    # }
    # printf "\n"
}
main
