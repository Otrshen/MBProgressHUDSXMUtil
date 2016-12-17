//
//  MBProgressHUDSXMUtil.m
//  MBProgressHUD-SXMUtilExample
//
//  Created by 申铭 on 16/12/17.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "MBProgressHUDSXMUtil.h"
#import "MBProgressHUD.h"

static float KDelay = 1.2f;
static NSString *KSuccessImageName = @"hudsxm_success.png";
static NSString *KErrorImageName = @"hudsxm_error.png";

@interface MBProgressHUDSXMUtil ()
@property (nonatomic, strong) UIView *hudView;
@end

@implementation MBProgressHUDSXMUtil

#pragma mark - loading

- (void)sxm_loadingWithView:(UIView *)view
{
    [self sxm_loadingWithText:@"" view:view];
}

- (void)sxm_loadingWithText:(NSString *)text view:(UIView *)view
{
//    [MBProgressHUD hideAllHUDsForView:self.hudView animated:NO];
    [MBProgressHUD hideHUDForView:self.hudView animated:NO];
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].lastObject;
    }
    self.hudView = view;
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.labelText = text;
    hud.removeFromSuperViewOnHide = YES;
    
    [view addSubview:hud];
    [hud show:YES];
}

#pragma mark - 提示文字信息

- (void)sxm_showWithText:(NSString *)text
{
    [self sxm_showWithText:text view:nil];
}

- (void)sxm_showWithText:(NSString *)text view:(UIView *)view
{
    [self sxm_showWithText:text detail:nil view:view];
}

- (void)sxm_showWithText:(NSString *)text detail:(NSString *)detail view:(UIView *)view
{
//    [MBProgressHUD hideAllHUDsForView:self.hudView animated:NO];
    [MBProgressHUD hideHUDForView:self.hudView animated:NO];
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].lastObject;
    }
    self.hudView = view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.detailsLabelText = detail;
    hud.mode = MBProgressHUDModeText;
    //    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:KDelay];
}

#pragma mark - 提示文字加图片信息

- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type
{
    [self sxm_showWithText:text type:type view:nil];
}

- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type view:(UIView *)view
{
//    [MBProgressHUD hideAllHUDsForView:self.hudView animated:NO];
    [MBProgressHUD hideHUDForView:self.hudView animated:NO];
    if (view == nil) {
        view = [[UIApplication sharedApplication] windows].lastObject;
    }
    self.hudView = view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    hud.mode = MBProgressHUDModeCustomView;
    NSString *imageName = nil;
    if (type == SXMHUDMsgTypeSuccess) {
        imageName = KSuccessImageName;
    } else {
        imageName = KErrorImageName;
    }
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUDSXMUtil.bundle/%@", imageName]]];
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:KDelay];
}

#pragma mark - 单例

+ (instancetype)sharedInstance {
    static MBProgressHUDSXMUtil *hudInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hudInstance = [[self alloc] init];
    });
    return hudInstance;
}

@end
