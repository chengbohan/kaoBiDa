//
//  NSString+Category.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/10/25.
//  Copyright © 2019 博瀚程. All rights reserved.
//




#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)
//手机号正则校验
- (BOOL)isValidateMobile;
//仅可输入数字正则校验
- (BOOL)isValidateNumber;
@end

NS_ASSUME_NONNULL_END
