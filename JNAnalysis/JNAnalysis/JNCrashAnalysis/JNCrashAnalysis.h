//
//  JNCrashAnalysis.h
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JNCrashAnalysis : NSObject
- (void)startWithThrow:(void(^)(NSString *name ,NSString *reason, NSArray *symbols))crash;
@end
