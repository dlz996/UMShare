//
//  ViewController.m
//  shareModule
//
//  Created by 董立峥 on 2017/5/9.
//  Copyright © 2017年 芦苇科技. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

#import "QQShareVc.h"
#import "QzoneVc.h"
#import "WechatVc.h"
#import "WechatTimeLineVc.h"
#import "SinaVc.h"


@interface ViewController ()
/** 按钮数组 */
@property (nonatomic,strong)NSMutableArray * buttonArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    self.title = @"选择分享对象";
    _buttonArray = [NSMutableArray array];
    
    for (int i=0; i<5; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:[NSString stringWithFormat:@"%@",@[@"QQ",@"QQ空间",@"微信",@"朋友圈",@"微博"][i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btn.tag = i+1;
        [btn addTarget:self action:@selector(touchShareButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [_buttonArray addObject:btn];
    }
    
    [_buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:5 tailSpacing:5];

    [_buttonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.height.offset(50);
    }];
}

- (void)touchShareButton:(UIButton *)send{
    switch (send.tag) {
        case 1:{
            QQShareVc * qq = [[QQShareVc alloc]init];
            [self.navigationController pushViewController:qq animated:YES];
        }
            break;
        case 2:{
            QzoneVc * qzone = [[QzoneVc alloc]init];
            [self.navigationController pushViewController:qzone animated:YES];
        }
            break;
        case 3:{
            WechatVc * weChat = [[WechatVc alloc]init];
            [self.navigationController pushViewController:weChat animated:YES];
        }
            break;
        case 4:{
            WechatTimeLineVc * wechatTime = [[WechatTimeLineVc alloc]init];
            [self.navigationController pushViewController:wechatTime animated:YES];
        }
            break;
        case 5:{
            SinaVc * sina = [[SinaVc alloc]init];
            [self.navigationController pushViewController:sina animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
