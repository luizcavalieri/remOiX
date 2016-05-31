//
//  Client.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 27/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "Client.h"

@implementation Client

@synthesize name = userName;
@synthesize email = userEmail;


- (instancetype)init
{
    self = [super init];
    if (self) {
        userEmail = [[NSString alloc]init];
        userName = [[NSString alloc] init];
    }
    return self;}



//- (id)initWithStringName:(NSString*) clientName andStringEmail:(NSString *) clientEmail
//{
//    self = [super init];
//    if (self) {
//        name = clientName;
//        email = clientEmail;
//    }
//    return self;
//}

@end
