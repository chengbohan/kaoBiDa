//
//  UIView+Category.h
//  DLIntellectualProperty
//
//  Created by 博瀚程 on 2019/11/8.
//  Copyright © 2019 博瀚程. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Category)
- (void)addTapGestureBlock:(void (^)(UIView *ownView))clickBlock;
@end

NS_ASSUME_NONNULL_END
