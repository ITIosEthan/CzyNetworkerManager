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


@end
