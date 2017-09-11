//
//  CzyNetworkManager.h
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^Success)(NSURLSessionDataTask * task, id responseObject);
typedef void(^Failure)(NSURLSessionDataTask * task, NSError * error);

typedef NS_ENUM(NSInteger, CzyLoadType) {

    CzyLoadTypeGet = 0,
    CzyLoadTypePost
};

@interface CzyNetworkManager : AFHTTPSessionManager

@property (nonatomic, copy) Success success;
@property (nonatomic, copy) Failure failure;

+ (instancetype)shareManager;

- (void)loadDataWithMethod:(CzyLoadType)loadType andLoadUrl:(NSString *)loadUrl andLoadPara:(id)loadPara andSuccess:(Success)success andFailure:(Failure)failure;


@end
