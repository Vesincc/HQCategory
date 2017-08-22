//
//  NSString+HQEncode.m
//  HQCategory
//
//  Created by HanQi on 2017/8/22.
//  Copyright © 2017年 HanQi. All rights reserved.
//

#import "NSString+HQEncode.h"

@implementation NSString (HQEncode)

- (NSString *)hq_urlEncode {
    
    if (self.length == 0) {
    
        return @"";
        
    }
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

}

- (NSString *)hq_urlDecode {
    
    if (self.length == 0) {
    
        return @"";
        
    }
    
    return self.stringByRemovingPercentEncoding;

}

@end
