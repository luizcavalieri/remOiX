 //
//  AuthViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 22/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Client.h"
#import "ExchangeViewController.h"

@import GoogleSignIn;

@interface AuthViewController : UIViewController

@property (nonatomic) Client *currentClient;
@property (nonatomic) Exchange *currentExchange;

@property (weak, nonatomic) IBOutlet UITextField *tbxUsername;
@property (weak, nonatomic) IBOutlet UITextField *tbxPassword;
- (IBAction)btnLogin:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *tbxSignUpName;
@property (weak, nonatomic) IBOutlet UITextField *tbxSignUpPhone;
@property (weak, nonatomic) IBOutlet UITextField *tbxSignUpEmail;
@property (weak, nonatomic) IBOutlet UITextField *tbxSignUpPassword;

- (IBAction)btnSignUp:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblTest1;

@property (weak, nonatomic) IBOutlet UILabel *lblTest2;

@end
