//
//  UIImageView+Category.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//




#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)
- (void)addTapGestureBlock:(void (^)(UIImageView *ownImg))clickBlock;
@end

NS_ASSUME_NONNULL_END
