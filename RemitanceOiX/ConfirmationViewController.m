//
//  ConfirmationViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 31/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "ConfirmationViewController.h"



@interface ConfirmationViewController ()

@end

@implementation ConfirmationViewController

@synthesize currentClient, currentExchange, lblReferenceId, lblAmountTotalPayment, currentReceiver, transactions, ref;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ref = [[FIRDatabase database] reference];
    
    transactions = [[NSMutableArray alloc] init];
    
    
    [lblAmountTotalPayment setText:[NSString stringWithFormat:@"Amount: AUD%0.2f", [currentExchange totalToPay]]];
    [lblReferenceId setText:[NSString stringWithFormat:@"Test: %@", [currentReceiver name]]];
    
    
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
    
    if([[segue identifier] isEqualToString:SeguesConfirmationToFinal]){
        
        ConfirmationViewController *confirmationViewController = (ConfirmationViewController *)[segue destinationViewController];
        
        [confirmationViewController setCurrentExchange:currentExchange];
        [confirmationViewController setCurrentClient:currentClient];
        [confirmationViewController setCurrentReceiver:currentReceiver];
        
    }
}


- (IBAction)btnLogOut:(id)sender {

    FIRAuth *firebaseAuth = [FIRAuth auth];
        NSError *signOutError;
        BOOL status = [firebaseAuth signOut:&signOutError];
        if (!status) {
            NSLog(@"Error signing out: %@", signOutError);
            return;
        }
        [AppState sharedInstance].signedIn = false;
        [self performSegueWithIdentifier:SeguesConfirmationToSignIn sender:nil];
        
    
}


// UITextViewDelegate protocol methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self sendMessage:@{MessageFieldstext: textField.text}];
    textField.text = @"";
    return YES;
}

- (void)sendMessage:(NSDictionary *)data {
    
    NSNumber *realExchangeDictionary = [[NSNumber alloc] initWithDouble:[currentExchange realExchange]];
    NSNumber *moneyToSendDictionary = [[NSNumber alloc] initWithDouble:[currentExchange moneyToSend]];
    NSNumber *totalToPayDictionary = [[NSNumber alloc] initWithDouble:[currentExchange totalToPay]];
    
    NSMutableDictionary *mdata = [data mutableCopy];
    mdata[TransactionFieldsName] = [currentClient email];
    mdata[TransactionFieldsReceiverName] = [currentReceiver name];
    mdata[TransactionFieldsReceiverPhone] = [currentReceiver phone];
    mdata[TransactionFieldsReceiverBank] = [currentReceiver bankName];
    mdata[TransactionFieldsReceiverAccount] = [currentReceiver accountInfo];
    mdata[TransactionFieldsReceiverCPF] = [currentReceiver cpf];
    mdata[TransactionFieldsReceiverEmail] = [currentReceiver email];
    mdata[TransactionFieldsAUDRate] = realExchangeDictionary;
    mdata[TransactionFieldsAmountSent] = moneyToSendDictionary;
    mdata[TransactionFieldsAmountPay] = totalToPayDictionary;
    
    NSLog(mdata[TransactionFieldsName]);
    
    // Push data to Firebase Database
    [[[ref child:@"transactions"] childByAutoId] setValue:mdata];
}


- (IBAction)btnFinalize:(id)sender {
    
    [self sendMessage:@{}];
    
    [self performSegueWithIdentifier:SeguesConfirmationToFinal sender:nil];
    
}
@end
