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
#import "DestinyViewController.h"

@import FirebaseAuth;
@import FirebaseDatabase;
@import FirebaseStorage;

@interface ExchangeViewController ()

@end

@implementation ExchangeViewController

@synthesize tbxServiceFee, tbxTotalToPay, tbxMoneyToSend, tbxMoneyToReceive, lblExchangeRate, currentClient, currentExchange, lblClientName, userName, userEmail;

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //currentClient = [[Client alloc] init];
    
    //currentClient = [[Client alloc] init];
    
    currentExchange = [[Exchange alloc] init];
    
//    currentClient.name = [[AppState sharedInstance] displayName];
//    currentClient.email = [[AppState sharedInstance] email];
//    
    [lblExchangeRate setText:[NSString stringWithFormat:@"%0.2f", [currentExchange realExchange]]];
    [tbxServiceFee setText:[NSString stringWithFormat:@"%0.2f", [currentExchange serviceFee]]];
    
    tbxMoneyToReceive.enabled = false;
    tbxTotalToPay.enabled = false;
    tbxServiceFee.enabled = false;
    
    [lblClientName setText:[NSString stringWithFormat:@"Goo'day %@", [currentClient name]]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:SeguesExchangeToDestiny]){
    
    DestinyViewController *destinyViewController = (DestinyViewController *)[segue destinationViewController];
    
    [destinyViewController setCurrentExchange:currentExchange];
    [destinyViewController setCurrentClient:currentClient];
        
    }
    
}


- (IBAction)btnConfirmQuotation:(id)sender {
   
    [self performSegueWithIdentifier:SeguesExchangeToDestiny sender:nil];
    
    NSLog(@"this is the money: %0.2f", [[tbxMoneyToReceive text] doubleValue]);
    
}

- (IBAction)tbxMoneyToSendChange:(id)sender {
    
    [currentExchange setMoneyToSend:[[tbxMoneyToSend text]doubleValue]];
    
    [tbxMoneyToReceive setText:[NSString stringWithFormat:@"%0.2f", [currentExchange moneyToReceive]]];
        
    [tbxTotalToPay setText:[NSString stringWithFormat:@"%0.2f", [currentExchange totalToPay]]];
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



@end
