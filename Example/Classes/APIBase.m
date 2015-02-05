//
//  APIBase.m
//
//
//  Created by Subramanian on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#import "APIBase.h"
#import "ApiKeys.h"

@interface APIBase (Private)
@property(readwrite, nonatomic, strong)
    NSMutableDictionary *parametersDictionary;
@property(readwrite, nonatomic, strong) NSString *requestType;
@end

@implementation APIBase

- (instancetype)init {
  if (self = [super init]) {
  }
  return self;
}

- (NSString *)baseURL {
  return (ShouldUseProductionUrl) ? APIProductionUrl : APIStaginUrl;
}

- (NSString *)urlForAPIRequest {
  return @"";
}

- (NSString *)apiAuthenticationUsername {
  return @"";
}

- (NSString *)apiAuthenticationPassword {
  return @"";
}

- (NSString *)requestType {
  // Default Request Type
  return APIGet;
}

- (NSDictionary *)requestParameters {
  return nil;
}

- (void)parseAPIResponse:(NSDictionary *)responseDictionary {
}

@end
