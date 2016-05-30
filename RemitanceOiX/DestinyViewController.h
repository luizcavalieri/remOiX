//
//  DestinyViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 24/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exchange.h"
#import "Client.h"
#import "AppState.h"
#import "ExchangeViewController.h"

@protocol DestinyViewControllerDelegate<NSObject>

- (void)setMoneyToReceive:(CGFloat *)moneyToReceiveTotal;


@end

@interface DestinyViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic) Client *currentClient;
@property (nonatomic) Exchange *currentExchange;

@property (nonatomic) double moneyToReceiveFromXvc;

@property (weak, nonatomic) IBOutlet UILabel *lblMoneyToReceive;

- (IBAction)btnSignOut:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tbxName;
@property (weak, nonatomic) IBOutlet UITextField *tbxEmail;
@property (weak, nonatomic) IBOutlet UITextField *tbxPhone;
@property (weak, nonatomic) IBOutlet UITextField *tbxCPF;
@property (weak, nonatomic) IBOutlet UITextField *tbxAccountInfo;
@property (weak, nonatomic) IBOutlet UITextField *tbxBankName;

@end
