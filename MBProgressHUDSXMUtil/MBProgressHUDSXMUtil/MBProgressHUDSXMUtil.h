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

/** 边缘间隔 */
@property (nonatomic, assign) float sxmMargin;
/** 透明度 */
@property (nonatomic, assign) float sxmOpacity;
/** 延迟消失时间 */
@property (nonatomic, assign) float sxmDealyTime;
/** 字体大小 */
@property (nonatomic, strong) UIFont *sxmFont;

+ (instancetype)sharedInstance;

/**
 *  加载框
 */
- (void)sxm_loadingWithView:(UIView *)view;
/**
 *  文字加载框
 */
- (void)sxm_loadingWithText:(NSString *)text view:(UIView *)view;
/**
 *  加载完成
 */
- (void)sxm_loadingFinish;

/**
 *  单文字显示 默认显示在Window层
 */
- (void)sxm_showWithText:(NSString *)text;
/**
 *  单文字显示
 */
- (void)sxm_showWithText:(NSString *)text view:(UIView *)view;
/**
 *  标题，详细文字显示
 */
- (void)sxm_showWithText:(NSString *)text detail:(NSString *)detail view:(UIView *)view;

/**
 *  显示文字加图片 默认显示在Window层
 */
- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type;
/**
 *  显示文字加图片
 */
- (void)sxm_showWithText:(NSString *)text type:(SXMHUDMsgType)type view:(UIView *)view;

@end
