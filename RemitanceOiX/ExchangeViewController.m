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

#define dataRetrievalURL @"http://api.fixer.io/2016-06-07";

@implementation ExchangeViewController

@synthesize tbxServiceFee, tbxTotalToPay, tbxMoneyToSend, tbxMoneyToReceive, lblExchangeRate, currentClient, currentExchange, lblClientName, userName, userEmail, json, exchange;

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    currentExchange = [[Exchange alloc] init];
    
//    currentClient.name = [[AppState sharedInstance] displayName];
//    currentClient.email = [[AppState sharedInstance] email];
//    
    [tbxServiceFee setText:[NSString stringWithFormat:@"%0.2f", [currentExchange serviceFee]]];
    
    tbxMoneyToReceive.enabled = false;
    tbxTotalToPay.enabled = false;
    tbxServiceFee.enabled = false;
    
    [self requestData];
    
    [self addTextField];
    
    [lblClientName setText:[NSString stringWithFormat:@"Goo'day %@", [currentClient name]]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestData{
    
    //NSString * requestPath = @"2016-06-08?base=AUD&symbols=BRL";
    
    [[RKObjectManager sharedManager]
     getObjectsAtPath:@""
     parameters:nil
     success: ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         //articles have been saved in core data by now
         [self fetchQuotesFromContext];
     }
     failure: ^(RKObjectRequestOperation *operation, NSError *error) {
         RKLogError(@"Load failed with error: %@", error);
     }
     ];
    
}

- (void)fetchQuotesFromContext {
    
    NSManagedObjectContext *context = [RKManagedObjectStore defaultStore].mainQueueManagedObjectContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"ExchangeList"];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"rates" ascending:YES];
    //NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"timeStamp" ascending:NO];
    fetchRequest.sortDescriptors = @[descriptor];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    ExchangeList *exchangeList = [fetchedObjects firstObject];
    
    self.quotes = [exchangeList.rates allObjects];
    
    currentExchange.realExchange = [[exchangeList brl] doubleValue];
    [lblExchangeRate setText:[NSString stringWithFormat:@"%0.2f", [currentExchange realExchange]]];
    
    NSLog(@"%0.2f", [[exchangeList brl] doubleValue]);
    
}


- (void)retrieveData {
    
    NSURL * url = [NSURL URLWithString:UrlDataRetrieval];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    
//  exchange = [[NSMutableArray alloc]init];
    
//  exchange = [json objectForKey:@"quotes"];
//    
//    for(int i = 0; i < json.count; i++){
//        NSString * firstExchange = [[json objectAtIndex:2] objectForKey:@"USDBRL"];
//        NSLog(@"The exchange is: %@", firstExchange);
//    }
    
    NSString * firstExchange = [[json objectAtIndex:0] objectForKey:@"quotes"];
    NSLog(@"The exchange is: %@", firstExchange);

    
    //currentExchange.realExchange = 2.36;
    
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
    
    [currentExchange setMoneyToSend:[[tbxMoneyToSend text] doubleValue]];
    
    NSLog(@"%0.2f", [currentExchange moneyToSend]);
    
    NSNumber *myDouble = [NSNumber numberWithDouble:[currentExchange moneyToSend]];
    
    if([ [myDouble stringValue] length] == 0){
        
        [self showAlert:@"Missing Info" message:@"Please fill the amount of AUD you want to send."];
        
    }else{
        
         [self performSegueWithIdentifier:SeguesExchangeToDestiny sender:nil];
        NSLog(@"this is the money: %0.2f", [[tbxMoneyToReceive text] doubleValue]);
    }
    
    
}

-(void)showAlert:(NSString *)title message:(NSString *) message{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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

-(void)addTextField{
    
    [tbxServiceFee setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblServiceFee = [[UILabel alloc]initWithFrame:CGRectZero];
    lblServiceFee.text = @" Service Fee ";
    [lblServiceFee setFont:[UIFont systemFontOfSize:14]];
    [lblServiceFee setTextColor:[UIColor lightGrayColor]];
    tbxServiceFee.leftView = lblServiceFee;
    tbxServiceFee.leftViewMode = UITextFieldViewModeAlways;
    [lblServiceFee sizeToFit];
    
    [tbxTotalToPay setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblTotalToPay = [[UILabel alloc]initWithFrame:CGRectZero];
    lblTotalToPay.text = @" Total AUD ";
    [lblTotalToPay setTextColor:[UIColor lightGrayColor]];
    [lblTotalToPay setFont:[UIFont systemFontOfSize:14]];
    tbxTotalToPay.leftView = lblTotalToPay;
    tbxTotalToPay.leftViewMode = UITextFieldViewModeAlways;
    [lblTotalToPay sizeToFit];

    [tbxMoneyToSend setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblMoneyToSend = [[UILabel alloc]initWithFrame:CGRectZero];
    lblMoneyToSend.text = @" AUD -> ";
    [lblMoneyToSend setTextColor:[UIColor lightGrayColor]];
    [lblMoneyToSend setFont:[UIFont systemFontOfSize:14]];
    tbxMoneyToSend.leftView = lblMoneyToSend;
    tbxMoneyToSend.leftViewMode = UITextFieldViewModeAlways;
    [lblMoneyToSend sizeToFit];
    
    [tbxMoneyToReceive setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblMoneyToReceive = [[UILabel alloc]initWithFrame:CGRectZero];
    lblMoneyToReceive.text = @" BRL<- ";
    [lblMoneyToReceive setTextColor:[UIColor lightGrayColor]];
    [lblMoneyToReceive setFont:[UIFont systemFontOfSize:14]];
    tbxMoneyToReceive.leftView = lblMoneyToReceive;
    tbxMoneyToReceive.leftViewMode = UITextFieldViewModeAlways;
    [lblMoneyToReceive sizeToFit];
    
    
}

@end
