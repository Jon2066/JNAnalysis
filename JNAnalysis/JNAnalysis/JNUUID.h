//
//  JNUUID.h
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNUUID : NSObject

/**
 判断是否已经生成了uuid
 获取uuid之前调用
 @return 是否是新安装的
 */
+ (BOOL)newInstall;


/**
 获取uuid 并保存着keychain中 app唯一
 @return uuid
 */
+ (NSString *)getUUID;
@end
