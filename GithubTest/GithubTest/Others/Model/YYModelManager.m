//
//  YYModelManager.m
//  网易新闻
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 WYW. All rights reserved.
//

#import "YYModelManager.h"

@implementation YYModelManager

+(NSArray *)parseNewsListWith:(NSArray *)listArray
{
    NSMutableArray* array=nil;
    for (NSDictionary* dic in listArray)
    {
        YYNewsModel* newsList=[YYNewsModel new];
        [newsList setValuesForKeysWithDictionary:dic];
        [array addObject:dic];
    }
    return [array copy];
}

@end
