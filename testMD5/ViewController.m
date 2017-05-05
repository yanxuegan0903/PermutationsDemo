//
//  ViewController.m
//  testMD5
//
//  Created by vsKing on 2017/5/4.
//  Copyright © 2017年 vsKing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<NSString *> *charArray;

@property (nonatomic, strong) NSMutableArray<NSString *> *MD5Array;

@end

@implementation ViewController

- (NSArray<NSString *> *)charArray{
    if (!_charArray) {
        _charArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    }
    return _charArray;
}


- (NSMutableArray<NSString *> *)MD5Array{
    if (!_MD5Array) {
        _MD5Array = [NSMutableArray arrayWithArray:self.charArray];
    }
    return _MD5Array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    NSMutableArray * array = [NSMutableArray arrayWithArray:self.charArray];
    int bit = 8;
    int start = 0;
    int charCount = (int)self.charArray.count;
    NSString * str ;
    NSMutableString * str1;
    for (int c = 0; c < bit - 1; c ++) {
        start = c>=1?  (charCount)*((1-pow(charCount, c))/(1-charCount)) : 0;
        for (int i = start; i < self.MD5Array.count; i++) {
            str = self.MD5Array[i];
            for (int j = 0; j < self.charArray.count; j++) {
                str1 = [NSMutableString stringWithString:self.charArray[j]];
                [str1 appendString:str];
                [array addObject:str1];
            }
        }
        [self.MD5Array removeAllObjects];
        [self.MD5Array addObjectsFromArray:array];
    }
    NSLog(@"final MD5Array.count = %lu",(unsigned long)self.MD5Array.count);


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
