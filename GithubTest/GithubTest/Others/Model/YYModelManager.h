//
//  YYModelManager.h
//  网易新闻
//
//  Created by apple on 16/6/15.
//  Copyright © 2016年 WYW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYNewsModel.h"

@interface YYModelManager : NSObject

+(NSArray*)parseNewsListWith:(NSArray*)listArray;

@end
