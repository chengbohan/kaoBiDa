//
//  ZXHomeVC.m
//  KaoBiDa
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 mac. All rights reserved.
//

#import "ZXHomeVC.h"
@interface ZXHomeVC ()<UIScrollViewDelegate,UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak)IBOutlet UISearchBar *searchBar;
@property(nonatomic, weak)IBOutlet UIView *searchBgView;
@property(nonatomic, weak)IBOutlet UIImageView *cameraImg;
@property(nonatomic, strong)UIScrollView *titleScroll;
@property(nonatomic, strong)UIScrollView *contentScroll;
@property(nonatomic, strong)NSMutableArray<UIView *> *titleViewArr;
@property(nonatomic, strong)NSMutableArray *contentViewArr;
@property(nonatomic, assign)NSInteger ItemNum;
@end

@implementation ZXHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"Home");
    _ItemNum = 10;
    [self _setupSubViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)_setupSubViews {
    _searchBar.userInteractionEnabled = NO;
    self.searchBgView.backgroundColor = [UIColor clearColor];
    [self.searchBgView addTapGestureBlock:^(UIView * _Nonnull ownView) {
        NSLog(@"搜索");
    }];
    
    _titleScroll = [[UIScrollView alloc] initWithFrame:CGRectZero];
    _titleScroll.tag = 101;
    _titleScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_titleScroll];
    [_titleScroll makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchBgView.mas_bottom).offset(0);
        make.left.right.equalTo(0);
        make.height.equalTo(50);
    }];
    _titleScroll.contentSize = CGSizeMake(_ItemNum * 60, 50);
    
    _titleScroll.delegate = self;
    _titleScroll.backgroundColor = [UIColor greenColor];
    NSArray<NSString *> *arr =@[@"关注1",@"关注2",@"关注3",@"关注4",@"关注5",@"关注6",@"关注7",@"关注8",@"关注9",@"关注10"];
    for (int i = 0; i < _ItemNum; i++) {
        UIView *itemV = [UIView new];
        itemV.backgroundColor = [UIColor yellowColor];
        [_titleScroll addSubview:itemV];
        itemV.tag = i;
     
        [itemV makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(i * 60);
            make.width.equalTo(60);
            make.height.equalTo(50);
        }];
        
        UILabel *lab = [UILabel new];
        [itemV addSubview:lab];
        lab.tag = 1000;
        lab.text = arr[i];
        lab.textColor = DLRGBHex(0x898989);
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:13];
        [lab makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(itemV);
        }];
        if (i == 0) {
            lab.textColor = DLRGBHex(0xF64247);
        }
        
        WeakSelf(self);
        [itemV addTapGestureBlock:^(UIView * _Nonnull ownView) {
            for (UIView *item in weakself.titleViewArr) {
                ((UILabel *)[item viewWithTag:1000]).textColor = DLRGBHex(0x898989);
            }
            ((UILabel *)[ownView viewWithTag:1000]).textColor = DLRGBHex(0xF64247);
            if (ownView.tag > 2 && ownView.tag < weakself.ItemNum - 3) {
                [weakself.titleScroll setContentOffset:CGPointMake((ownView.tag - 2) * 60 , 0) animated:YES];
            } else if(ownView.tag < 3) {
                [weakself.titleScroll setContentOffset:CGPointMake(0 , 0) animated:YES];
            }
        }];
        
        if (!_titleViewArr) {
            _titleViewArr = [NSMutableArray new];
        }
        [_titleViewArr addObject:itemV];
        
    }
    
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = DLRGBHex(0xEEEEEE);
    [self.view addSubview:bottomLine];
    [bottomLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(self.titleScroll.mas_bottom);
        make.height.equalTo(1);
        make.width.equalTo(DLScreenWidth);
    }];
    
    
    self.contentScroll = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.contentScroll.showsHorizontalScrollIndicator = NO;
    self.contentScroll.delegate = self;
    [self.view addSubview:self.contentScroll];
    [self.contentScroll makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomLine.mas_bottom);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.contentScroll.contentSize = CGSizeMake(DLScreenWidth * _ItemNum, 100);
    self.contentScroll.backgroundColor = [UIColor blueColor];
    

    for (int i = 0; i < _ItemNum; i++) {
        UITableView *tableList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableList.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.contentScroll addSubview:tableList];
        [tableList makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.right.equalTo(0);
            make.left.equalTo(DLScreenWidth * i);
            make.height.equalTo(self.contentScroll.mas_height);
            make.width.equalTo(DLScreenWidth);
        }];
        tableList.tag = i;
        tableList.delegate = self;
        tableList.dataSource = self;
        tableList.backgroundColor = [UIColor greenColor];

    }
    
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //11 15 10 11 11   58
    return cell;
    
}
@end
