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

#pragma mark - setLoading
- (void)setLoading:(BOOL)loading
{
    _loading = loading;
    
    [self reloadEmptyDataSet];
}

#pragma mark - DZNEmptyDataSetSource, DZNEmptyDataSetDelegate
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *contentTitle = @"";
    
    if (self.loading == NO) {
        
        contentTitle = @"暂无数据";
    }else{
        contentTitle = @"正在获取数据";
    }
    
    NSMutableAttributedString *s = [[NSMutableAttributedString alloc] initWithString:contentTitle];
    [s addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, s.string.length)];
    return s;
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *descriptionString = @"";
    
    if (self.loading == NO) {
        
        descriptionString = @"轻触重新获取...";
    }else{
        descriptionString = @"请稍后...";
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
        return nil;
    }
    
    return [UIImage imageNamed:@"dropdown_anim__0001"];
}

- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    animation.values = [NSArray arrayWithObjects:(id)[UIImage imageNamed:@"dropdown_anim__0001"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0002"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0003"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0004"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0005"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0006"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0007"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0008"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0009"].CGImage,(id)[UIImage imageNamed:@"dropdown_anim__0010"].CGImage, nil];
    animation.duration = 1.0;
    animation.repeatCount = MAXFLOAT;
    
    return animation;
}

- (void)dealloc
{
    NSLog(@"czyTableView dealloc");
}

@end
