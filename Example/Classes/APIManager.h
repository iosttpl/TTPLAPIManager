//
//  APIManager.h
//
//
//  Created by Subramanian on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APIBase;

/*!
 @discussion APIManager will handle the api request and response. Once got the
 response from the api, it will call back the respective class methods with
 proper repose/error data.

 ## Version information

 __Version__: 1.0

 __Found__: 11/10/14

 __Last update__: 11/10/14

 __Developer__: Subramanian, Tarento Technologies Pvt Ltd.

 */

@interface APIManager : NSObject

/// @name Properties
@property(nonatomic, assign) BOOL isJSONRequest;

/// @name Getter methods

/*!
 @abstract Returns the shared instance of the API manager.

 @discussion It checks wheather instance created or not. If not then it will
 create
 and return it back. Else it will return the last time allocated instance.

 @return instancetype Respective class type.

 @since 1.0
 */
+ (instancetype)sharedInstance;

/// @name Setter methods

/*!
 @abstract Make api request and get the api response/error.

 @discussion It will make the API request and get the response/error from those
 apis. Once got reponse/error this will pass those reponse to the respective
 call back methods.

 @param apiObject This is an instance of the API class. Every API request
 will have the separate API class.
 @param shouldAddOAuthHeader This is a flag to add OAuth Header on the request
 serializer or not.
 @param completionCallback This is a call back method which will trigger once
 got the api response from the respective API Request. `(void (^)(NSDictionary
 *, NSError *))`

 @since 1.0
 */

- (void)makeAPIRequestWithObject:(APIBase *)apiObject
            shouldAddOAuthHeader:(BOOL)shouldAddOAuthHeader
              andCompletionBlock:
                  (void (^)(NSDictionary *, NSError *))completionCallback;

@end
