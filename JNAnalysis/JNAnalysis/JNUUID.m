//
//  JNUUID.m
//  JNAnalysis
//
//  Created by Jonathan on 2018/9/4.
//  Copyright © 2018年 Jonathan. All rights reserved.
//

#import "JNUUID.h"

#define k_JNUUIDKey [NSString stringWithFormat:@"JNUUIDKey_%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]]

@implementation JNUUID

+ (BOOL)newInstall
{
    NSString *uuid = [self jn_getUUIDFromKeychain];
    if (!uuid || [uuid isEqualToString:@""] || [uuid isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}

+ (NSString *)getUUID
{
    NSString *uuid = [self jn_getUUIDFromKeychain];
    if (!uuid || [uuid isEqualToString:@""] || [uuid isEqual:[NSNull null]]) {
        uuid = [self jn_UUID];
        [self jn_saveUUID:uuid];
        uuid = [self jn_getUUIDFromKeychain];
    }
    return uuid;
}

+ (NSString *)jn_UUID {
    CFUUIDRef uuidRef = CFUUIDCreate( nil );
    CFStringRef uuidStringRef = CFUUIDCreateString(nil, uuidRef);
    NSString *uuid = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidStringRef));
    CFRelease(uuidRef);
    CFRelease(uuidStringRef);
    return uuid;
}

+ (NSMutableDictionary *)jn_keychainDic
{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword,(id)kSecClass,k_JNUUIDKey,(id)kSecAttrService,k_JNUUIDKey,(id)kSecAttrAccount,(id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible, nil];
}

+ (NSString *)jn_getUUIDFromKeychain
{
    id ret = nil;
    NSMutableDictionary *keychainDic = [self jn_keychainDic];
    [keychainDic setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainDic setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainDic, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
        }
        @finally {
        }
    }
    if (keyData) {
        CFRelease(keyData);
    }
    return ret;
}

+ (void)jn_saveUUID:(NSString *)uuid
{
    NSMutableDictionary *keychainDic = [self jn_keychainDic];
    SecItemDelete((CFDictionaryRef)keychainDic);
    [keychainDic setObject:[NSKeyedArchiver archivedDataWithRootObject:uuid] forKey:(id)kSecValueData];
    SecItemAdd((CFDictionaryRef)keychainDic, NULL);
}


@end
