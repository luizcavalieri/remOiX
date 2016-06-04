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
#import "ConfirmationViewController.h"
#import "AppConstant.h"
#import "Receiver.h"

@protocol DestinyViewControllerDelegate<NSObject>

- (void)setMoneyToReceive:(CGFloat *)moneyToReceiveTotal;


@end

@interface DestinyViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic) Receiver *currentReceiver;
@property (nonatomic) Client *currentClient;
@property (nonatomic) Exchange *currentExchange;
- (IBAction)btnFinalConfirmation:(id)sender;

//@property (nonatomic) double moneyToReceiveFromXvc;

- (IBAction)tbxFinishEditing:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblMoneyToReceive;

- (IBAction)btnSignOut:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tbxName;
@property (weak, nonatomic) IBOutlet UITextField *tbxEmail;
@property (weak, nonatomic) IBOutlet UITextField *tbxPhone;
@property (weak, nonatomic) IBOutlet UITextField *tbxCPF;
@property (weak, nonatomic) IBOutlet UITextField *tbxAccountInfo;
@property (weak, nonatomic) IBOutlet UITextField *tbxBankName;

@property NSString *receiverTbxName;
@property NSString *receiverTbxCPF;
@property NSString *receiverTbxEmail;
@property NSString *receiverTbxPhone;
@property NSString *receiverTbxBankName;
@property NSString *receiverTbxAccountInfo;

@end
