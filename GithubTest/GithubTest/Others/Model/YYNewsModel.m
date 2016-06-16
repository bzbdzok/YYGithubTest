//
//  YYNewsModel.m
//  网易新闻
//
//  Created by mac on 16/6/15.
//  Copyright © 2016年 WYW. All rights reserved.
//

#import "YYNewsModel.h"

@implementation YYNewsModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"])
    {
        self.descript=value;
    }
}

@end



