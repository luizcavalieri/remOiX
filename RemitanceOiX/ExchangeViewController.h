//
//  ExchangeViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 23/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>
#import "Exchange.h"
#import "Client.h"
#import "AppState.h"
#import "ExchangeViewController.h"
#import "ConfirmationViewController.h"
#import "AppConstant.h"
#import "Receiver.h"
#import "ExchangeList.h"
#import "ExchangeDate.h"



@interface ExchangeViewController : UIViewController

@property (strong, nonatomic) Client *currentClient;
@property (strong, nonatomic) Exchange *currentExchange;
@property (strong, nonatomic) Receiver *currentReceiver;


@property (nonatomic)  NSString *userName;
@property (nonatomic) NSString *userEmail;

@property (nonatomic, strong) NSMutableArray * json;
@property (nonatomic, strong) NSMutableArray * exchange;

@property NSArray * quotes;

//@property (nonatomic) CGFloat moneyToReceiveTotal;

@property (weak, nonatomic) IBOutlet UILabel *lblClientName;

@property (weak, nonatomic) IBOutlet UITextField *tbxMoneyToSend;
@property (weak, nonatomic) IBOutlet UITextField *tbxServiceFee;
@property (weak, nonatomic) IBOutlet UITextField *tbxMoneyToReceive;

@property (weak, nonatomic) IBOutlet UITextField *tbxTotalToPay;

@property (weak, nonatomic) IBOutlet UILabel *lblExchangeRate;


- (void) retrieveData;
- (IBAction)btnConfirmQuotation:(id)sender;
- (IBAction)tbxMoneyToSendChange:(id)sender;
- (IBAction)btnSignOut:(id)sender;

@end
