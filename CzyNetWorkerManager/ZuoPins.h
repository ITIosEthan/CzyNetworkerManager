//
//  ZuoPins.h
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZuoPin;

@interface ZuoPins : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray <ZuoPin *> *zuopins;


@end

@interface ZuoPin : NSObject

@property (nonatomic, copy) NSString *zuopin_id;
@property (nonatomic, copy) NSString *zuopin_url;
@property (nonatomic, copy) NSString *userid;
@property (nonatomic, assign) NSInteger liked_times;
@property (nonatomic, assign) NSInteger comment_times;
@property (nonatomic, assign) NSInteger fenxiang_times;
@property (nonatomic, assign) NSInteger edit_times;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *touxiang;
@property (nonatomic, copy) NSString *isRecommend;
@property (nonatomic, assign) NSInteger am_i_zan;
@property (nonatomic, assign) NSInteger zp_creat_time;


@end

