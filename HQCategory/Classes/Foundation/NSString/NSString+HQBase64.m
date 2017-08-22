//
//  NSString+HQBase64.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSString+HQBase64.h"
#import "NSData+HQBase64.h"

@implementation NSString (HQBase64)

+ (NSString *)hq_stringWithBase64EncodedString:(NSString *)string {
    
    NSData *data = [NSData hq_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)hq_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data hq_base64EncodedStringWithWrapWidth:wrapWidth];

}

- (NSString *)hq_base64EncodedString {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data hq_base64EncodedString];

}

- (NSString *)hq_base64DecodedString {
    
    return [NSString hq_stringWithBase64EncodedString:self];

}

- (NSData *)hq_base64DecodedData {
    
    return [NSData hq_dataWithBase64EncodedString:self];

}

@end
