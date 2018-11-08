//
//  XHeadView.h
//  AIParkSJZ
//
//  Created by lanbiao on 2018/8/16.
//  Copyright © 2018年 lanbiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XHeadViewDelegate.h"

/**
 navigationBar
 */
@interface XHeadView : UIView

@property (nonatomic,weak) id<XHeadViewDelegate> delegate;

/**
 构建导航头

 @return 返回导航头
 */
+ (XHeadView *) createHeadViewWithDelegate:(id<XHeadViewDelegate>) delegate;

@end
