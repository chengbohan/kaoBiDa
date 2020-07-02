//
//  ZXMainVC.m
//  KaoBiDa
//
//  Created by mac on 2020/7/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZXMainVC.h"

@interface ZXMainVC ()<UITabBarDelegate>
@property(nonatomic, strong)UITabBar *tabBar;
@property(nonatomic, strong)NSMutableArray *taBBarItemArr;
@property(nonatomic, strong)NSMutableArray <ZXBaseVC *>*viewArr;
@property(nonatomic, strong)UIView *addView;
@end

@implementation ZXMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setupSubViews];
    // Do any additional setup after loading the view from its nib.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}



- (void)_setupNav {
    //UINavigationBar *navBar = [UINavigationBar new];
    //UIView *navView = [UIView new];
    
    
}

- (void)_setupSubViews {
    self.tabBar = [[UITabBar alloc] init];
    self.tabBar.delegate = self;
    self.tabBar.translucent = NO;//tabbar不遮挡底部
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tabBar];
    [self.tabBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_bottom).offset(-TabbarHeight);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(TabbarHeight);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    [self.tabBar addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tabBar.mas_top);
        make.left.equalTo(self.tabBar.mas_left);
        make.right.equalTo(self.tabBar.mas_right);
        make.height.equalTo(@1);
    }];
    [self _setuoChildsVC];
}


- (void)_setuoChildsVC {
    [self addChildVC:@"ZXHomeVC" title:@"首页" normalImg:@"item1" selectImg:@"item1S"];
    [self addChildVC:@"ZXFixPaperVC" title:@"填报" normalImg:@"item2" selectImg:@"item2S"];
    [self addChildVC:@"ZXCheckOutVC" title:@"测评" normalImg:@"item3" selectImg:@"item3S"];
    [self addChildVC:@"ZXExpertVC" title:@"专家" normalImg:@"item4" selectImg:@"item4S"];
    [self addChildVC:@"ZXMineVC" title:@"我的" normalImg:@"item5" selectImg:@"item5S"];
    [self.tabBar setItems:_taBBarItemArr];
    self.tabBar.selectedItem = _taBBarItemArr[0];
    [self tabBar:self.tabBar didSelectItem:_taBBarItemArr[0]];
    
}

- (void)addChildVC:(NSString *)classStr title:(NSString *)titleStr normalImg:(NSString *)normalImgStr selectImg:(NSString *)selectImgStr {
    
    ZXBaseVC *vc;
    if (!_taBBarItemArr) {
        _taBBarItemArr = [NSMutableArray new];
    }
    if (!_viewArr) {
        _viewArr = [NSMutableArray new];
    }
    if (![classStr isEqualToString:@"ViewController"]) {
        vc =[[NSClassFromString(classStr) alloc] initWithNibName:classStr bundle:nil];
    } else {
        vc = [NSClassFromString(classStr) new];
    }
    UITabBarItem *item = [UITabBarItem new];
    item.title = titleStr;
    item.tag = _taBBarItemArr.count;
    NSDictionary *dict = [NSDictionary dictionaryWithObject:DLRGBHex(0x006CFE) forKey:NSForegroundColorAttributeName];
    [item setTitleTextAttributes:dict forState:UIControlStateSelected];
    item.image = DLImage(normalImgStr);
    item.selectedImage = [DLImage(selectImgStr) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem = item;
    [self addChildViewController:vc];
    
    
    [_taBBarItemArr addObject:item];
    
    
    [_viewArr addObject:vc];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -tabbarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    UIView *tmpView = nil;
    if (item.tag == 0) {
        tmpView = self.viewArr[0].view;
    } else if(item.tag == 1){
        tmpView = self.viewArr[1].view;
    } else if(item.tag == 2){
        tmpView = self.viewArr[2].view;
    } else if(item.tag == 3){
        tmpView = self.viewArr[3].view;
    } else {
        tmpView = self.viewArr[4].view;
    }
    if (self.addView == tmpView) {
        return;
    } else {
        [self.addView removeFromSuperview];
        self.addView = nil;
    }
    self.addView = tmpView;
    if (self.addView) {
        [self.view addSubview:self.addView];
        [self.addView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.tabBar.mas_top);
        }];
    }
}
@end
