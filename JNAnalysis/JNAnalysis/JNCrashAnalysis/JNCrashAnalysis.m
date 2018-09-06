//
//  JNCrashAnalysis.m
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import "JNCrashAnalysis.h"
NSUncaughtExceptionHandler *previousHandler = nil;
void(^jn_throwCrash)(NSString *name, NSString *reason, NSArray *symbols);
@interface JNCrashAnalysis ()

@end

@implementation JNCrashAnalysis
- (void)startWithThrow:(void (^)(NSString *, NSString *, NSArray *))crash
{
    jn_throwCrash = crash;
    previousHandler = NSGetUncaughtExceptionHandler();
    NSSetUncaughtExceptionHandler(&jn_uncaughtExceptionHandler);
}

void jn_uncaughtExceptionHandler(NSException *exception)
{
    if (previousHandler) {
        previousHandler(exception);
    }
    NSArray *symbols = [exception callStackSymbols];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    if (jn_throwCrash) {
        jn_throwCrash(name, reason, symbols);
    }
}

@end
