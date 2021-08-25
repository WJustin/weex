//
//  UIScrollView+WXExtension.m
//  WeexSDK
//
//  Created by Justin.wang on 2020/8/2.
//

#import "UIScrollView+WXExtension.h"
#import <objc/runtime.h>

static char *const wx_headerOffsetKey;
static char *const wx_isSuperKey;
static char *const wx_isChildKey;
static char *const wx_refreshLockKey;
static char *const wx_mainScrollViewKey;
static char *const wx_subScrollViewKey;
static char *const wx_childScrollViewMutableArrayKey;
static char *const wx_displayRefreshBlockKey;

@implementation UIScrollView (WXExtension)

- (void)setWx_headerOffset:(NSNumber *)wx_headerOffset {
    objc_setAssociatedObject(self, &wx_headerOffsetKey, wx_headerOffset, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSNumber *)wx_headerOffset {
    NSNumber *number = objc_getAssociatedObject(self, &wx_headerOffsetKey);
    return number?: @(CGFLOAT_MAX);
}

- (void)setWx_isSuper:(BOOL)wx_isSuper {
    objc_setAssociatedObject(self, &wx_isSuperKey, @(wx_isSuper), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)wx_isSuper {
    NSNumber *number = objc_getAssociatedObject(self, &wx_isSuperKey);
    return [number boolValue];
}

- (void)setWx_isChild:(BOOL)wx_isChild {
    objc_setAssociatedObject(self, &wx_isChildKey, @(wx_isChild), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)wx_isChild {
    NSNumber *number = objc_getAssociatedObject(self, &wx_isChildKey);
    return [number boolValue];
}

- (void)setWx_refreshLock:(BOOL)wx_refreshLock {
    objc_setAssociatedObject(self, &wx_refreshLockKey, @(wx_refreshLock), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)wx_refreshLock {
    NSNumber *number = objc_getAssociatedObject(self, &wx_refreshLockKey);
    return [number boolValue];
}

- (void)setWx_mainScrollView:(UIScrollView *)wx_mainScrollView {
    objc_setAssociatedObject(self, &wx_mainScrollViewKey, wx_mainScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)wx_mainScrollView {
    return objc_getAssociatedObject(self, &wx_mainScrollViewKey);
}

- (void)setWx_subScrollView:(UIScrollView *)wx_subScrollView {
    objc_setAssociatedObject(self, &wx_subScrollViewKey, wx_subScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIScrollView *)wx_subScrollView {
    return objc_getAssociatedObject(self, &wx_subScrollViewKey);
}

- (void)wx_addChildScroll:(UIScrollView *)scroll {
    if ([scroll isKindOfClass:[UIScrollView class]] && scroll.wx_isChild) {
        if (![self.wx_childScrollViewMutableArray containsObject:scroll]) {
            NSMutableArray *mutableArray = [self.wx_childScrollViewMutableArray mutableCopy];
            [mutableArray addObject:scroll];
            self.wx_childScrollViewMutableArray = mutableArray;
        }
    }
}

- (void)setWx_childScrollViewMutableArray:(NSMutableArray<UIScrollView *> *)wx_childScrollViewMutableArray {
    objc_setAssociatedObject(self, &wx_childScrollViewMutableArrayKey, wx_childScrollViewMutableArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray<UIScrollView *> *)wx_childScrollViewMutableArray {
    NSMutableArray *mutableArray = objc_getAssociatedObject(self, &wx_childScrollViewMutableArrayKey);
    if (!mutableArray) {
        return [[NSMutableArray alloc] init];
    }
    return mutableArray;
}

- (void)setRefreshDisplayBlock:(GSRefreshComponentDisplayBlock)refreshDisplayBlock {
    objc_setAssociatedObject(self, &wx_displayRefreshBlockKey, refreshDisplayBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (GSRefreshComponentDisplayBlock)refreshDisplayBlock {
    return objc_getAssociatedObject(self, &wx_displayRefreshBlockKey);
}

@end
