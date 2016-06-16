//
//  ViewController.m
//  GithubTest
//
//  Created by apple on 16/6/13.
//  Copyright © 2016年 best. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)NSURLSession* session;
@property(nonatomic,strong)NSMutableURLRequest* request;

@property(nonatomic,strong)NSMutableArray* allNews;

@end

@implementation ViewController
-(NSURLSession *)session
{
    if (_session==nil)
    {
        _session=[NSURLSession sharedSession];
    }
    return _session;
}

-(NSMutableArray *)allNews
{
    if (_allNews==nil)
    {
        _allNews=[NSMutableArray new];
    }
    return _allNews;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    
    NSString *httpUrl = @"http://apis.baidu.com/txapi/social/social";
    NSString *httpArg = @"num=10&page=1";
    
    [self request:httpUrl withHttpArg:httpArg];
    
}

-(void)request:(NSString*)httpUrl withHttpArg:(NSString*)HttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    
    NSURL *url = [NSURL URLWithString: urlStr];
    
    self.request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [self.request setHTTPMethod: @"GET"];
    [self.request addValue: @"2d2d629116ca29b1c2b46e59dd6865e7" forHTTPHeaderField: @"apikey"];
    
    NSURLSessionDataTask* task=[self.session dataTaskWithRequest:self.request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSInteger responseCode=[(NSHTTPURLResponse*)response statusCode];
        
        if (responseCode==200)
        {
            //            NSString* responseString=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            //            NSLog(@"HttpResponseBody %@",responseString);
            
            NSError* error=nil;
            NSDictionary* dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error==nil)
            {
//                NSArray* array = [YYModelManager parseNewsListWith:dic[@"newslist"]];
                
                //                [self.allNews addObject:array];
                
                NSLog(@"%@",dic[@"newslist"][0][@"title"]);
                NSLog(@"%@",dic[@"newslist"]);
            }
            else
            {
                NSLog(@"解析失败:%@",error.userInfo);
            }
            //            NSLog(@"HttpResponseCode:%ld", responseCode);
        }
        else
        {
            NSLog(@"Httperror: %@,%ld,%@", error.localizedDescription, error.code,error.userInfo);
        }
    }];
    [task resume];
}


@end
