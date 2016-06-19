//
//  Exchange.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 23/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "Exchange.h"

@implementation Exchange

@synthesize serviceFee, moneyToSend, realExchange;

-(double)totalToPay{
    return moneyToSend + serviceFee;
}

-(double)moneyToReceive{
    return moneyToSend * realExchange;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        serviceFee = 15.00;
    }
    return self;
}

@end
