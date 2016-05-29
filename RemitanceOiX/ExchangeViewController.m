//
//  ExchangeViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 23/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "ExchangeViewController.h"
#import "Exchange.h"
#import "AppState.h"
#import "AppConstant.h"

@import FirebaseAuth;
@import FirebaseDatabase;
@import FirebaseStorage;

@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

@synthesize tbxServiceFee, tbxTotalToPay, tbxMoneyToSend, tbxMoneyToReceive, lblExchangeRate, currentClient, currentExchange, lblClientName;

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    Exchange *currentRate = [[Exchange alloc]init];
    
    [lblExchangeRate setText:[NSString stringWithFormat:@"%0.2f", [currentRate realExchange]]];
    [tbxServiceFee setText:[NSString stringWithFormat:@"%0.2f", [currentRate serviceFee]]];
    
    tbxMoneyToReceive.enabled = false;
    tbxTotalToPay.enabled = false;
    tbxServiceFee.enabled = false;
    
    //NSString *clientName =  [AppState sharedInstance] displayName;
    
    [lblClientName setText:[NSString stringWithFormat:@"Goo'day %@", [[AppState sharedInstance] displayName]]];
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnConfirmQuotation:(id)sender {
    
    [AppState sharedInstance].moneyToReceive = [[tbxMoneyToReceive text]floatValue];
   
    [self performSegueWithIdentifier:SeguesExchangeToDestiny sender:nil];
    
    NSLog(@"this is the money: %0.2f", [AppState sharedInstance].moneyToReceive);
    
}

- (IBAction)tbxMoneyToSendChange:(id)sender {
    
    Exchange *xCalculation = [[Exchange alloc]init];
    
    [xCalculation setMoneyToSend:[[tbxMoneyToSend text]doubleValue]];
    
    [tbxMoneyToReceive setText:[NSString stringWithFormat:@"%0.2f", [xCalculation moneyToReceive]]];
        
    [tbxTotalToPay setText:[NSString stringWithFormat:@"%0.2f", [xCalculation totalToPay]]];
        
   
    
}

- (IBAction)btnSignOut:(id)sender {
    FIRAuth *firebaseAuth = [FIRAuth auth];
    NSError *signOutError;
    BOOL status = [firebaseAuth signOut:&signOutError];
    if (!status) {
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }
    [AppState sharedInstance].signedIn = false;
    [self performSegueWithIdentifier:SeguesExchangeToSignIn sender:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}




//-(void)textFieldDidChange :(UITextField *)tbxMoneyToSend{
//    
//}

@end
