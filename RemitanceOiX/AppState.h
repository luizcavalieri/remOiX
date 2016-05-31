//
//  AppState.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 22/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppState : NSObject

+ (AppState *)sharedInstance;

//@property (nonatomic) float moneyToReceive;
@property (nonatomic) BOOL signedIn;
@property (nonatomic, retain) NSString *displayName;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSURL *photoUrl;

@end
