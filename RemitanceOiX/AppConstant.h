//
//  AppConstant.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 22/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstant : NSObject

extern NSString *const NotificationKeysSignedIn;

extern NSString *const SeguesSignInToExchange;
extern NSString *const SeguesExchangeToSignIn;
extern NSString *const SeguesExchangeToDestiny;
extern NSString *const SeguesDestinyToSignIn;
extern NSString *const SeguesDestinyToPayment;

extern NSString *const MessageFieldsname;
extern NSString *const MessageFieldstext;
extern NSString *const MessageFieldsAccountInfo;
extern NSString *const MessageFieldsPhone;
extern NSString *const MessageFieldsEmail;
extern NSString *const MessageFieldsBankName;
extern NSString *const MessageFieldsphotoUrl;
extern NSString *const UrlDataRetrieval;

@end
