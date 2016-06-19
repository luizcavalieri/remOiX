//
//  FinalViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 10/06/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Exchange.h"
#import "Client.h"
#import "AppState.h"
#import "ExchangeViewController.h"
#import "ConfirmationViewController.h"
#import "AppConstant.h"
#import "Receiver.h"

@interface FinalViewController : UIViewController
- (IBAction)btnReturnMainScreen:(id)sender;

@property (nonatomic) Receiver *currentReceiver;
@property (nonatomic) Client *currentClient;
@property (nonatomic) Exchange *currentExchange;

@end
