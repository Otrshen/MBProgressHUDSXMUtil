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

#define KSXMFont [UIFont systemFontOfSize:14]

@interface MBProgressHUDSXMUtil ()
/** HUD所在View */
@property (strong) UIView *hudForView;
/** 记录上一次HUD是不是加载框 */
@property (assign, getter=isLoadingHud) BOOL loadingHud;
@end

@implementation MBProgressHUDSXMUtil

#pragma mark - loading

- (void)sxm_loadingWithView:(UIView *)view
{
    [self sxm_loadingWithText:@"" view:view];
}

- (void)sxm_loadingWithText:(NSString *)text view:(UIView *)view
{
    [MBProgressHUD hideHUDForView:self.hudForView animated:YES];
    if (view == nil) { view = [UIApplication sharedApplication].keyWindow; }
    
    
    self.hudForView = view;
    self.loadingHud = YES;
    
    MBProgressHUD *hud = [self sxm_createHUDWithView:view];
    hud.labelText = text;
    
    [view addSubview:hud];
    [hud show:YES];
}

- (void)sxm_loadingFinish
{
    // 如上次是加载框直接隐藏，如不是说明正在显示文字信息则不隐藏
    if (self.isLoadingHud) {
        [MBProgressHUD hideHUDForView:self.hudForView animated:YES];
    }
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
    [MBProgressHUD hideHUDForView:self.hudForView animated:YES];
    if (view == nil) { view = [UIApplication sharedApplication].keyWindow; }
    
    self.hudForView = view;
    self.loadingHud = NO;
    
    MBProgressHUD *hud = [self sxm_createHUDWithView:view];
    hud.labelText = text;
    hud.detailsLabelText = detail;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:self.sxmDealyTime];
}

#pragma mark - 提示文字加图片信息

- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type
{
    [self sxm_showWithText:text type:type view:nil];
}

- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type view:(UIView *)view
{
    [MBProgressHUD hideHUDForView:self.hudForView animated:YES];
    if (view == nil) { view = [UIApplication sharedApplication].keyWindow; }
    
    self.hudForView = view;
    self.loadingHud = NO;
    
    MBProgressHUD *hud = [self sxm_createHUDWithView:view];
    hud.labelText = text;
    hud.mode = MBProgressHUDModeCustomView;
    
    NSString *imageName = nil;
    if (type == SXMHUDMsgTypeSuccess) {
        imageName = KSuccessImageName;
    } else {
        imageName = KErrorImageName;
    }
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUDSXMUtil.bundle/%@", imageName]]];
    [hud hide:YES afterDelay:self.sxmDealyTime];
}

- (void)sxm_showWithText:(NSString *)text detail:(NSString *)detail type:(SXMHUDMsgType)type view:(UIView *)view
{
    [MBProgressHUD hideHUDForView:self.hudForView animated:YES];
    if (view == nil) { view = [UIApplication sharedApplication].keyWindow; }
    
    self.hudForView = view;
    self.loadingHud = NO;
    
    MBProgressHUD *hud = [self sxm_createHUDWithView:view];
    hud.labelText = text;
    hud.detailsLabelText = detail;
    hud.mode = MBProgressHUDModeCustomView;
    
    NSString *imageName = nil;
    if (type == SXMHUDMsgTypeSuccess) {
        imageName = KSuccessImageName;
    } else {
        imageName = KErrorImageName;
    }
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUDSXMUtil.bundle/%@", imageName]]];
    [hud hide:YES afterDelay:self.sxmDealyTime];
}

#pragma mark -

- (MBProgressHUD *)sxm_createHUDWithView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.margin = self.sxmMargin;
    hud.labelFont = self.sxmFont;
    hud.detailsLabelFont = self.sxmFont;
    hud.opacity = self.sxmOpacity;
    return hud;
}

- (float)sxmOpacity
{
    return _sxmOpacity = _sxmOpacity != 0 ? _sxmOpacity : 0.7f;
}

- (UIFont *)sxmFont
{
    return _sxmFont = _sxmFont != nil ? _sxmFont : KSXMFont;
}

- (float)sxmMargin
{
    return _sxmMargin = _sxmMargin != 0 ? _sxmMargin : 15.0f;
}

- (float)sxmDealyTime
{
    return _sxmDealyTime = _sxmDealyTime != 0 ? _sxmDealyTime : KDelay;
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
