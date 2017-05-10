//
//  WechatVc.m
//  shareModule
//
//  Created by 董立峥 on 2017/5/9.
//  Copyright © 2017年 芦苇科技. All rights reserved.
//

#import "WechatVc.h"
#import <UMSocialCore/UMSocialCore.h>
@interface WechatVc ()

@end
static NSString * const cellID = @"cellid";

@implementation WechatVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择微信分享内容";

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.tableFooterView = [UIView new];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"图片+标题+内容+URL";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*
     创建网页内容对象
     根据不同需求设置不同分享内容，一般为图片，标题，内容描述，url
     */
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"分享标题" descr:@"分享的内容" thumImage:[UIImage imageNamed:@"head@2x"]];
    //设置网页地址
    shareObject.webpageUrl = @"http://www.talkmoney.cn";
    
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    
    
    /**
     设置分享
     
     @param data 分享返回信息
     @param error 失败信息
     @param UMSocialPlatformType 分享平台
     */
    [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        
    }];
    
}



@end
