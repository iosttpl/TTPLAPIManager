//
//  APIManager.m
//
//
//  Created by Subramanian on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#import "APIManager.h"
#import "APIBase.h"
#import "ApiKeys.h"
#import <AFNetworking.h>
#import <XMLDictionary.h>

@implementation APIManager

#pragma mark -
#pragma mark - API Manager Shared Instance
+ (instancetype)sharedInstance {
  static APIManager *apiRequestsManagerSharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
      apiRequestsManagerSharedInstance = [[super alloc] initUniqueInstance];
      /// Please reset the flag here is you are not using JSON Request
      /// Serializer
      apiRequestsManagerSharedInstance.isJSONRequest = NO;
  });
  return apiRequestsManagerSharedInstance;
}

- (instancetype)initUniqueInstance {
  return [super init];
}

#pragma mark - Make API request -
- (void)makeAPIRequestWithObject:(APIBase *)apiObject
            shouldAddOAuthHeader:(BOOL)shouldAddOAuthHeader
              andCompletionBlock:(void (^)(NSDictionary *,
                                           NSError *))completionCallback {

  AFHTTPRequestOperationManager *requestManager =
      [AFHTTPRequestOperationManager manager];
  AFHTTPRequestSerializer *requestSerializer;
  if (self.isJSONRequest) {
    requestSerializer = [AFJSONRequestSerializer serializer];
  } else {
    requestSerializer = [AFHTTPRequestSerializer serializer];
  }
  /// JSON Response Serializer
  AFJSONResponseSerializer *jsonSerializer =
      [AFJSONResponseSerializer serializerWithReadingOptions:0];
  /// XML Response Serializer
  AFXMLParserResponseSerializer *xmlSerializer =
      [AFXMLParserResponseSerializer serializer];
  /// Compound Serializer
  AFCompoundResponseSerializer *compoundSerializer =
      [AFCompoundResponseSerializer compoundSerializerWithResponseSerializers:
                                        @[ jsonSerializer, xmlSerializer ]];

  [requestManager setRequestSerializer:requestSerializer];

  [requestManager setResponseSerializer:compoundSerializer];

  [requestManager.requestSerializer
      setAuthorizationHeaderFieldWithUsername:apiObject
                                                  .apiAuthenticationUsername
                                     password:apiObject
                                                  .apiAuthenticationPassword];
  if (shouldAddOAuthHeader) {
    // TODO : OAuth Header update
  }
  NSDictionary *parametersDictionary = [apiObject requestParameters];

  if ([apiObject.requestType isEqualToString:APIPost]) {
    /// POST
    [requestManager POST:apiObject.urlForAPIRequest
        parameters:parametersDictionary
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@", [[NSString alloc] initWithData:responseObject
                                               encoding:NSUTF8StringEncoding]);
            [self serializeAPIResponseWithData:responseObject
                           andRequestOperation:operation
                                     apiObject:apiObject
                            andCompletionBlock:completionCallback];
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            completionCallback(nil, error);
        }];

  } else if ([apiObject.requestType isEqualToString:APIGet]) {
    /// GET
    [requestManager GET:apiObject.urlForAPIRequest
        parameters:nil
        success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [self serializeAPIResponseWithData:responseObject
                           andRequestOperation:operation
                                     apiObject:apiObject
                            andCompletionBlock:completionCallback];
        }
        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            completionCallback(nil, error);
        }];
  }
}

#pragma mark - Serializing Response -
- (void)serializeAPIResponseWithData:(id)response
                 andRequestOperation:(AFHTTPRequestOperation *)operation
                           apiObject:(APIBase *)apiObject
                  andCompletionBlock:(void (^)(NSDictionary *,
                                               NSError *))completionCallback {
  /// Check wheater the API Response is XML or JSON. Based on the type we have
  /// to convert API response into the NSDictionary.
  NSDictionary *responseDictionary;
  if ([response isKindOfClass:[NSXMLParser class]]) {
    NSError *serializationError = nil;
    responseDictionary = [[XMLDictionaryParser sharedInstance]
        dictionaryWithData:operation.responseData];
    if (serializationError) {
      completionCallback(nil, serializationError);
      return;
    }
  } else {
    responseDictionary = (NSDictionary *)response;
  }
  [apiObject parseAPIResponse:responseDictionary];
  completionCallback(responseDictionary, nil);
}

@end
