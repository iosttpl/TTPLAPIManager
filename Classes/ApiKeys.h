//
//  ApiKeys.h
//
//
//  Created by Subramanian on 11/10/14.
//  Copyright (c) 2014 Tarento Technologies Pvt Ltd. All rights reserved.
//

#ifndef ApiKeys_h
#define ApiKeys_h

// URLs
static NSString *const APIStaginUrl = @"";
static NSString *const APIProductionUrl = @"";

// Change the flag based on server.
static BOOL ShouldUseProductionUrl = YES;

// API Request Type
static NSString *const APIGet = @"GET";
static NSString *const APIPost = @"POST";

// Timeout interval
static float APITimeOut = 10.0f;

// API Status Code
static NSInteger APIStatusCodeSuccess = 200;

#endif
