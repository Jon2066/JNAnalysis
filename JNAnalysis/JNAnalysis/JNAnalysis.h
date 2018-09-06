//
//  JNAnalysis.h
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNAnalysis : NSObject


/**
 是否开启crash日志收集
 默认：NO
 @param enabled 是否打开收集
 */
+ (void)crashReportEnabled:(BOOL)enabled;


/**
 初始化工具
 @param appKey 应用key
 @param channel 渠道 AppStore
 */
+ (void)initWithAppKey:(NSString *)appKey channel:(NSString *)channel;


/**
 统计事件
 @param eventId 事件ID
 */
+ (void)event:(NSString *)eventId;


/**
 统计事件
 @param eventId 事件ID
 @param label 事件标签
 */
+ (void)event:(NSString *)eventId label:(NSString *)label;


/**
 统计事件
 @param eventId 事件ID
 @param attributes 事件属性
 */
+ (void)event:(NSString *)eventId attributes:(NSDictionary *)attributes;
@end
