//
//  AppConstant.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 22/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "AppConstant.h"

@implementation AppConstant

NSString *const NotificationKeysSignedIn = @"onSignInCompleted";

NSString *const SeguesSignInToExchange = @"SeguesSignInToExchange";
NSString *const SeguesExchangeToSignIn = @"SeguesExchangeToSignIn";
NSString *const SeguesExchangeToDestiny = @"SeguesExchangeToDestiny";
NSString *const SeguesDestinyToSignIn = @"SeguesDestinyToSignIn";
NSString *const SeguesDestinyToPayment = @"SeguesDestinyToPayment";

NSString *const MessageFieldsname = @"name";
NSString *const MessageFieldstext = @"text";
NSString *const MessageFieldsphotoUrl = @"photoUrl";
NSString *const MessageFieldsAccountInfo = @"Account Info";
NSString *const MessageFieldsPhone = @"Phone";
NSString *const MessageFieldsEmail = @"Email";
NSString *const MessageFieldsBankName = @"Bank Name";
NSString *const UrlDataRetrieval = @"http://apilayer.net/api/live?access_key=75c3fa478f911d93a5cebf8fd64943dc&currencies=BRL,AUD&source=USD&format=1";

//NSString *const UrlDataRetrieval = @"http://www.apilayer.net/api/live?access_key=75c3fa478f911d93a5cebf8fd64943dc&format=1";

@end
