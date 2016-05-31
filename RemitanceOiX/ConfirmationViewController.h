//
//  ConfirmationViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 31/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exchange.h"
#import "Client.h"
#import "AppState.h"
#import "ExchangeViewController.h"
#import "ConfirmationViewController.h"
#import "AppConstant.h"


@interface ConfirmationViewController : UIViewController

@property (nonatomic) Client *currentClient;
@property (nonatomic) Exchange *currentExchange;

@property (weak, nonatomic) IBOutlet UILabel *lblAmountTotalPayment;
@property (weak, nonatomic) IBOutlet UILabel *lblReferenceId;

@end
