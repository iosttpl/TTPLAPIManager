//
//  APIBase.h
//
//
//  Created by Subramanian on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @discussion This is an API base model. Every API classes should be a subclass
 of
 PIAPIBase class.

 ## Version information

 __Version__: 1.0

 __Found__: 11/10/14

 __Last update__: 11/10/14

 __Developer__: Subramanian, Tarento Technologies Pvt Ltd.

 */
@interface APIBase : NSObject

/// @name Getter methods

/*!
 @abstract Returns the base URL to be used for API calls

 @discussion Every api has base url. Whenever need to request different server
 apis.
 then need to override this method on the specific API class with the proper
 base url.

 @return Returns the base URL in string format.

 @since 1.0+
 */
- (NSString *)baseURL;

/*!
 @abstract Returns the URL to be used for the API request

 @discussion This method will return the part of the API request. This part will
 append
 with the base url.

 @return Returns the URL part in string format.

 @since 1.0+
 */
- (NSString *)urlForAPIRequest;

/*!
 @abstract Returns the api authendication username

 @discussion This will return the username in string format which is requeired
 for API authendication.

 @return Returns username in string format.

 @since 1.0+
 */
- (NSString *)apiAuthenticationUsername;

/*!
 @abstract Returns the api authendication password

 @discussion This will return the password in string format which is requeired
 for API authendication.

 @return Returns password in string format.

 @since 1.0+
 */
- (NSString *)apiAuthenticationPassword;

/*!
 @abstract Returns the API parameters.

 @discussion This will return the 'NSMutableDictionary'. It contains the list of
 parameters which is required for API reqeust

 @return Returns the API parameters in string format.

 @since 1.0+
 */
- (NSMutableDictionary *)requestParameters;

/*!
 @abstract Returns the API request type GET/POST

 @discussion Mostly we are using two type to API request GET and POST. This will
 return the type of request which we are going to make.

 @return Returns the API request type GET/POST in string format

 @since 1.0+
 */
- (NSString *)requestType;

/*!
 @abstract Parse the API response and store it on respective API models.

 @discussion Once got the API response from the request. APIManager will call
 this method with the response of the API in the 'NSDictionary' format.

 @param responseDictionary API response datas are serialized and gave as a
 'NSDictionary' from the APIManager

 @since 1.0+
 */
- (void)parseAPIResponse:(NSDictionary *)responseDictionary;

@end
