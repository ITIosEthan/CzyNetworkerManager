//
//  CzyNetworkManager.m
//  CzyNetWorkerManager
//
//  Created by macOfEthan on 17/9/11.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "CzyNetworkManager.h"

@implementation CzyNetworkManager

static CzyNetworkManager *manager = nil;
static AFHTTPSessionManager *sessionManager = nil;

+ (instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CzyNetworkManager alloc] init];
    });
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (manager == nil) {
        
        manager = [super allocWithZone:zone];
        
        sessionManager = [[AFHTTPSessionManager alloc] init];
        
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",  nil];
    }
    return manager;
}

- (void)loadDataWithMethod:(CzyLoadType)loadType andLoadUrl:(NSString *)loadUrl andLoadPara:(id)loadPara andSuccess:(Success)success andFailure:(Failure)failure
{
    
    if (loadType == CzyLoadTypePost) {
        
        [sessionManager POST:loadUrl parameters:loadPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (success) {
                    success(task, responseObject);
                }
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (failure) {
                failure(task, error);
            }
            
        }];
    }
    
    if (loadType == CzyLoadTypeGet) {
        
        [sessionManager GET:loadUrl parameters:loadPara progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (success) {
                success(task, responseObject);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (failure) {
                failure(task, error);
            }
        }];
    }
    
}

@end
