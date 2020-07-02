//
//  NSString+Category.m
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
#pragma mark -手机号正则校验
- (BOOL)isValidateMobile {
    NSString *emailRegex = @"^1(3[0-9]|4[56789]|5[0-9]|6[6]|7[0-9]|8[0-9]|9[189])\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [predicate evaluateWithObject:self];
}
#pragma mark -仅可输入数字正则校验
- (BOOL)isValidateNumber{
   BOOL res =YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
   int i =0;
   while (i < self.length) {
       NSString * string = [self substringWithRange:NSMakeRange(i,1)];
       NSRange range = [string rangeOfCharacterFromSet:tmpSet];
       if (range.length ==0) {
            res =NO;
           break;
        }
        i++;
    }
   return res;
}
@end
