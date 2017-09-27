//
//  CzyTableView.m
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "CzyTableView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

@interface CzyTableView ()<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@end

@implementation CzyTableView

#pragma mark - initWithFrame
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        
        self.loading = YES;

    }
    return self;
}

#pragma mark - Setter
- (void)setLoading:(BOOL)loading
{
    _loading = loading;
    
    [self reloadEmptyDataSet];
}

- (void)setLoadingTitle:(NSString *)loadingTitle
{
    _loadingTitle = loadingTitle;
    
    [self reloadEmptyDataSet];
}

- (void)setIdleTitle:(NSString *)idleTitle
{
    _idleTitle = idleTitle;
    
    [self reloadEmptyDataSet];
}

- (void)setLoadingSubTitle:(NSString *)loadingSubTitle
{
    _loadingSubTitle = loadingSubTitle;
    
    [self reloadEmptyDataSet];
}

- (void)setIdleSubTitle:(NSString *)idleSubTitle
{
    _idleSubTitle = idleSubTitle;
    
    [self reloadEmptyDataSet];
}

- (void)setLoadingMaskImageView:(NSString *)loadingMaskImageView
{
    _loadingMaskImageView = loadingMaskImageView;
    
    [self reloadEmptyDataSet];
}

- (void)setLoadingFinishMaskImageView:(NSString *)loadingFinishMaskImageView
{
    _loadingFinishMaskImageView = loadingFinishMaskImageView;
    
    [self reloadEmptyDataSet];
}

- (void)setAnimationImages:(NSArray *)animationImages
{
    _animationImages = animationImages;
    
    [self reloadEmptyDataSet];
}

#pragma mark - DZNEmptyDataSetSource, DZNEmptyDataSetDelegate
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *contentTitle = @"";

    if (self.loading == NO) {
        
        contentTitle = self.idleTitle.length ? self.idleTitle : @"暂无数据";
    }else{
        
        contentTitle = self.loadingTitle.length ? self.loadingTitle : @"正在加载";
    }
    
    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:contentTitle];
    [s addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, s.string.length)];
    
    return s;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *descriptionString = @"";
    
    if (self.loading == NO) {
        
        descriptionString = self.idleSubTitle.length ? self.idleSubTitle : @"点击或轻触重新加载";
    }else{
        
        descriptionString = self.loadingSubTitle.length ? self.loadingSubTitle : @"请稍后";
    }
    
    NSString *contentS = descriptionString;
    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:contentS];
    [s addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, contentS.length)];
    return s;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    self.loading = YES;
    [self reloadEmptyDataSet];
    
    /**点击回调*/
    if (self.loadDataAgain) {
        self.loadDataAgain();
    }
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return self.loading;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    if (self.loading == NO) {
        
        if (_loadingFinishMaskImageView.length) {
            return [UIImage imageNamed:_loadingFinishMaskImageView];
        }
    }else{
    
        if (_loadingMaskImageView.length) {
            return [UIImage imageNamed:_loadingMaskImageView];
        }
    }
    
    if ([_animationImages.firstObject isKindOfClass:[NSString class]]) {
        return [UIImage imageNamed:_animationImages.firstObject];
    }
    
    return _animationImages.firstObject;
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (id obj in _animationImages) {
        
        if ([obj isKindOfClass:[UIImage class]]) {
            [images addObject:(id)[obj CGImage]];
        }else if([obj isKindOfClass:[NSString class]]){
            [images addObject:(id)[UIImage imageNamed:obj].CGImage];
        }
    }
    
    animation.values = images;
    animation.duration = 1.0;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}


@end
