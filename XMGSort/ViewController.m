//
//  ViewController.m
//  XMGSort
//
//  Created by machao on 2017/8/10.
//  Copyright © 2017年 machao. All rights reserved.
//

#import "ViewController.h"
#define MAX_LENGTH_INSERT_SORT 7

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@3,@1,@4,@2,@8,@5,@6,@7,@9];
//    NSArray *array = @[@9,@8,@7,@6,@5,@4,@3,@2,@1];
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:array];
//    希尔排序
//    [self shellSort:muArray];
//    

    /// 快速排序
    
//    [self qSort:muArray lowIndex:0 highIndex:array.count -1];
    /// 插入排序
//    [self insertSort:muArray];
    /// 简单选择排序
//    [self selectedSort:muArray];
    /// 冒泡排序
    [self bubbleSort:muArray];
    
    NSLog(@"%@",muArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/// 希尔排序
- (void)shellSort:(NSMutableArray *)array {
    
    NSInteger i,j,gap;
    NSInteger n = array.count;
    for (gap = n/2; gap > 0; gap/=2) {
        for (i=gap; i<n; i++) {
            
            for (j = i-gap; j>=0 && [array[j] integerValue] > [array[j +gap] integerValue]; j -= gap) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+gap];
            }
        }
    }
}

/// 快速排序

- (void)qSort:(NSMutableArray *)array lowIndex:(NSInteger)low highIndex:(NSInteger)high{

    NSInteger pivot;
    while (low < high) {
        pivot = [self partition:array lowIndex:low highIndex:high];
        [self qSort:array lowIndex:low highIndex:pivot -1];
        low = pivot +1;
    }

}

- (NSInteger)partition:(NSMutableArray *)array lowIndex:(NSInteger)low highIndex:(NSInteger)high{
    NSInteger pivotKey;
    pivotKey = [array[low] integerValue];
    while (low < high) {
        while (low < high && [array[high] integerValue] >= pivotKey) {
            high -- ;
        }
        array[low] = array[high];
        while (low < high && [array[low] integerValue] <= pivotKey) {
            low ++ ;
        }
        array[high] = array[low];

    }
        array[low] = @(pivotKey);
    return low;
}

/// 直接插入排序

- (void)insertSort:(NSMutableArray *)array{
    NSInteger i,j,temp;
    NSInteger n = array.count;
    for (i = 1; i<n; i++) {
        if ([array[i] integerValue] < [array[i-1] integerValue]) {
            temp = [array[i] integerValue];
            for (j = i-1; j>=0&&[array[j] integerValue] > temp; j--) {
                array[j +1] = array[j];
            }
            array[j+1] = @(temp);
        }
    }
}

/// 简单选择排序
- (void)selectedSort:(NSMutableArray *)array{

    NSInteger i,j,min;
    NSInteger n = array.count;
    for (i=0; i<n; i++) {
        min = i;
        for (j = i+1; j<n; j++) {
            if ([array[j] integerValue]< [array[min] integerValue]) {
                min = j;
            }
        }
        if (min != i) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:min];
        }
    }
}

/// 冒泡排序

- (void)bubbleSort:(NSMutableArray *)array{
    NSInteger i,j;
    NSInteger n = array.count;
    BOOL flag = YES;
    for (i = 0; i<n&&flag; i++) {
        flag = NO;
        for (j = n -1; j>i; j--) {
            if ([array[j] integerValue] < [array[j-1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j-1];
                flag = YES;
            }
        }
    }
}


@end
