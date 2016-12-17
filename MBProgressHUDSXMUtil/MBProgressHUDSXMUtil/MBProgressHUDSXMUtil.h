//
//  MBProgressHUDSXMUtil.h
//  MBProgressHUD-SXMUtilExample
//
//  Created by 申铭 on 16/12/17.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import <UIKit/UIKit.h>

// 传输列表的传输类型
typedef  NS_ENUM(NSInteger, SXMHUDMsgType) {
    /** 成功 */
    SXMHUDMsgTypeSuccess = 1,
    /** 失败 */
    SXMHUDMsgTypeError = 2,
};

@interface MBProgressHUDSXMUtil : NSObject

+ (instancetype)sharedInstance;

/**
 *  加载框
 */
- (void)sxm_loadingWithView:(UIView *)view;
- (void)sxm_loadingWithText:(NSString *)text view:(UIView *)view;

/**
 *  单文字显示
 */
- (void)sxm_showWithText:(NSString *)text;
- (void)sxm_showWithText:(NSString *)text view:(UIView *)view;
- (void)sxm_showWithText:(NSString *)text detail:(NSString *)detail view:(UIView *)view;

/**
 *  显示文字加图片
 */
- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type;
- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type view:(UIView *)view;

@end
