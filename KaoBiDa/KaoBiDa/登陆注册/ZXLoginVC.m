//
//  ZXLoginVC.m
//  KaoBiDa
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZXLoginVC.h"

@interface ZXLoginVC ()
@property(nonatomic, weak)IBOutlet UIButton *loginBtn;
@end

@implementation ZXLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSLog(@"Login");
    [_loginBtn addTapGestureBlock:^(UIView * _Nonnull ownView) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ACCOUNT_LOGIN_CHANGED object:@(YES)];
    }];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
