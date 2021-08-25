//
//  UIScrollView+WXExtension.h
//  WeexSDK
//
//  Created by Justin.wang on 2020/8/2.
//

#import <UIKit/UIKit.h>

typedef void(^GSRefreshComponentDisplayBlock)(BOOL isDisplay);

@interface UIScrollView (WXExtension)

@property (nonatomic, strong) NSNumber *wx_headerOffset;
@property (nonatomic, assign) BOOL wx_isSuper;
@property (nonatomic, assign) BOOL wx_isChild;
@property (nonatomic, assign) BOOL wx_refreshLock;
@property (nonatomic, strong) UIScrollView *wx_mainScrollView;
@property (nonatomic, strong) UIScrollView *wx_subScrollView;
@property (nonatomic, strong) NSMutableArray<UIScrollView *> *wx_childScrollViewMutableArray;
@property (nonatomic, copy  ) GSRefreshComponentDisplayBlock refreshDisplayBlock;

- (void)wx_addChildScroll:(UIScrollView *)scroll;

@end
