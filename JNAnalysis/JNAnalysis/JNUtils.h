//
//  JNUtils.h
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define k_jnDeviceName    [UIDevice currentDevice].name
#define k_jnSystemVersion [UIDevice currentDevice].systemVersion
#define k_jnDeviceModel   [JNUtils jn_deviceModel]
#define k_jnAppVersion    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define k_jnAppBuild      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define k_jnAppName       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define k_jnAppBuildId    [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

@interface JNUtils : NSObject
+ (NSString *)jn_deviceModel;
+ (float)getCPUUsage;
@end
