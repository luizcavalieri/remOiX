//
//  ExchangeViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 23/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exchange.h"
#import "Client.h"



@interface ExchangeViewController : UIViewController

@property (strong, nonatomic) Client *currentClient;
@property (strong, nonatomic) Exchange *currentExchange;

@property (nonatomic)  NSString *userName;
@property (nonatomic) NSString *userEmail;

//@property (nonatomic) CGFloat moneyToReceiveTotal;

@property (weak, nonatomic) IBOutlet UILabel *lblClientName;

@property (weak, nonatomic) IBOutlet UITextField *tbxMoneyToSend;
@property (weak, nonatomic) IBOutlet UITextField *tbxServiceFee;
@property (weak, nonatomic) IBOutlet UITextField *tbxMoneyToReceive;

@property (weak, nonatomic) IBOutlet UITextField *tbxTotalToPay;

@property (weak, nonatomic) IBOutlet UILabel *lblExchangeRate;

- (IBAction)btnConfirmQuotation:(id)sender;
- (IBAction)tbxMoneyToSendChange:(id)sender;
- (IBAction)btnSignOut:(id)sender;

@end
