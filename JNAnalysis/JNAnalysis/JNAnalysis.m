//
//  JNAnalysis.m
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import "JNAnalysis.h"
@interface JNAnalysis ()
@property (nonatomic, assign) NSTimeInterval totalAppUsedTime;
@property (nonatomic, strong) NSString *appKey;
@property (nonatomic, strong) NSString *channel;
@end

@implementation JNAnalysis
+ (instancetype)shareInstace
{
    static JNAnalysis *jnAnalysis = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        jnAnalysis = [[JNAnalysis alloc] init];
    });
    return jnAnalysis;
}

+ (void)initWithAppKey:(NSString *)appKey channel:(NSString *)channel
{
    JNAnalysis *an = [self shareInstace];
    an.appKey = appKey;
    an.channel = channel;
}
@end
