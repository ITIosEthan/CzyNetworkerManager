//
//  Goods.m
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "Goods.h"

@implementation Goods

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"data":[GoodsDetail class]};
}

@end

@implementation GoodsDetail

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    return @{@"goodsId":@"id"};
}

@end
