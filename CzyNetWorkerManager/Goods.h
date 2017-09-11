//
//  Goods.h
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GoodsDetail;

@interface Goods : NSObject
@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *rankhour;
@property (nonatomic, copy) NSString *rankdate;
@property (nonatomic, copy) NSString *displaydate;
@property (nonatomic, copy) NSString *rankduring;
@property (nonatomic, copy) NSString *hasnexthour;
@property (nonatomic, copy) NSString *nexthourhour;
@property (nonatomic, copy) NSString *nexthourdate;
@property (nonatomic, copy) NSString *lasthourhour;
@property (nonatomic, copy) NSString *lasthourdate;
@property (nonatomic, strong) NSArray <GoodsDetail *> *data;

@end

@interface GoodsDetail : NSObject

@property (nonatomic, copy) NSString *goodsId;
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pubtime;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *imgw;
@property (nonatomic, copy) NSString *imgh;
@property (nonatomic, copy) NSString *fromsite;
@property (nonatomic, copy) NSString *mall;
@property (nonatomic, copy) NSString *iftobuy;
@property (nonatomic, copy) NSString *buyurl;
@property (nonatomic, copy) NSString *dealfeature;

@end
