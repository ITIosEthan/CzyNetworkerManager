//
//  CzyTableView.h
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LoadDataAgain) (void);

@interface CzyTableView : UITableView

/**是否加载状态*/
@property (nonatomic, assign) BOOL loading;

/**点击重新获取数据*/
@property (nonatomic, copy) LoadDataAgain loadDataAgain;

/**加载标题 加载进行时  加载结束时*/
@property (nonatomic, copy) NSString *loadingTitle;
@property (nonatomic, copy) NSString *idleTitle;

/**加载描述 加载进行时 加载结束时*/
@property (nonatomic, copy) NSString *loadingSubTitle;
@property (nonatomic, copy) NSString *idleSubTitle;

/**加载进行时的图片 加载完成或加载失败的图片 图片名称  默认都返回数组的第一张图片*/
@property (nonatomic, copy) NSString *loadingMaskImageView;
@property (nonatomic, strong) NSString *loadingFinishMaskImageView;


/**动画图片 传图片或者图片名字*/
@property (nonatomic, strong) NSArray *animationImages;


@end
