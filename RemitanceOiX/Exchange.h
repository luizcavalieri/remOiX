//
//  Exchange.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 23/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Exchange : NSObject

@property double serviceFee;
@property double moneyToSend;
@property double realExchange;

-(double)totalToPay;

-(double)moneyToReceive;


@end
