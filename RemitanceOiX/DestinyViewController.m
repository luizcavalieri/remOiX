//
//  DestinyViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 24/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "DestinyViewController.h"
#import "ExchangeViewController.h"

@import FirebaseAuth;
@import FirebaseDatabase;
@import FirebaseStorage;

@interface DestinyViewController ()

@end

@implementation DestinyViewController


@synthesize lblMoneyToReceive, tbxName, tbxCPF, tbxEmail, tbxPhone, tbxBankName, tbxAccountInfo, currentExchange, currentClient, currentReceiver, receiverTbxCPF, receiverTbxName, receiverTbxEmail, receiverTbxPhone,receiverTbxBankName, receiverTbxAccountInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    currentReceiver = [[Receiver alloc]init];
    
    [lblMoneyToReceive setText:[NSString stringWithFormat:@"%@ and R$%0.2f", [currentClient name], [currentExchange moneyToReceive]]];
    
    [self addTextField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnFinalConfirmation:(id)sender {
    
    receiverTbxName = [tbxName text];
    receiverTbxCPF = [tbxCPF text];
    receiverTbxEmail = [tbxEmail text];
    receiverTbxPhone = [tbxPhone text];
    receiverTbxBankName = [tbxBankName text];
    receiverTbxAccountInfo = [tbxAccountInfo text];
    
    [currentReceiver setName:receiverTbxName];
    [currentReceiver setCpf:receiverTbxCPF];
    [currentReceiver setEmail:receiverTbxEmail];
    [currentReceiver setPhone:receiverTbxPhone];
    [currentReceiver setBankName:receiverTbxBankName];
    [currentReceiver setAccountInfo:receiverTbxAccountInfo];
    
    NSLog(@"%@", [currentReceiver name]);

    
    if([receiverTbxBankName length] == 0 ||
       [receiverTbxAccountInfo length] == 0  ||
       [receiverTbxBankName length] == 0 ||
       [receiverTbxPhone  length] == 0 ||
       [receiverTbxCPF  length] == 0 ||
       [receiverTbxEmail  length] == 0 ||
       [receiverTbxName  length] == 0 ){
       
        [self showAlert:@"Missing Info" message:@"Please fill all the fields."];
        
    }else{
        
        [self performSegueWithIdentifier:SeguesDestinyToPayment sender:nil];
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


 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.

     
     if([[segue identifier] isEqualToString:SeguesDestinyToPayment]){
         
         ConfirmationViewController *confirmationViewController = (ConfirmationViewController *)[segue destinationViewController];
         
         [confirmationViewController setCurrentExchange:currentExchange];
         [confirmationViewController setCurrentClient:currentClient];
         [confirmationViewController setCurrentReceiver:currentReceiver];
         
     }

 }

- (IBAction)tbxFinishEditing:(id)sender {
    
}


-(void)addTextField{
    
    [tbxName setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblName = [[UILabel alloc]initWithFrame:CGRectZero];
    lblName.text = @" Name ";
    [lblName setFont:[UIFont systemFontOfSize:14]];
    [lblName setTextColor:[UIColor lightGrayColor]];
    tbxName.leftView = lblName;
    tbxName.leftViewMode = UITextFieldViewModeAlways;
    [lblName sizeToFit];
    
    [tbxPhone setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblPhone = [[UILabel alloc]initWithFrame:CGRectZero];
    lblPhone.text = @" Phone ";
    [lblPhone setTextColor:[UIColor lightGrayColor]];
    [lblPhone setFont:[UIFont systemFontOfSize:14]];
    tbxPhone.leftView = lblPhone;
    tbxPhone.leftViewMode = UITextFieldViewModeAlways;
    [lblPhone sizeToFit];

    [tbxEmail setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblEmail = [[UILabel alloc]initWithFrame:CGRectZero];
    lblEmail.text = @" Email ";
    [lblEmail setTextColor:[UIColor lightGrayColor]];
    [lblEmail setFont:[UIFont systemFontOfSize:14]];
    tbxEmail.leftView = lblEmail;
    tbxEmail.leftViewMode = UITextFieldViewModeAlways;
    [lblEmail sizeToFit];
    
    [tbxCPF setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblCPF = [[UILabel alloc]initWithFrame:CGRectZero];
    lblCPF.text = @" CPF ";
    [lblCPF setTextColor:[UIColor lightGrayColor]];
    [lblCPF setFont:[UIFont systemFontOfSize:14]];
    tbxCPF.leftView = lblCPF;
    tbxCPF.leftViewMode = UITextFieldViewModeAlways;
    [lblCPF sizeToFit];

    [tbxAccountInfo setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblAccountInfo = [[UILabel alloc]initWithFrame:CGRectZero];
    lblAccountInfo.text = @" Account Info ";
    [lblAccountInfo setTextColor:[UIColor lightGrayColor]];
    [lblAccountInfo setFont:[UIFont systemFontOfSize:14]];
    tbxAccountInfo.leftView = lblAccountInfo;
    tbxAccountInfo.leftViewMode = UITextFieldViewModeAlways;
    [lblAccountInfo sizeToFit];
    
    [tbxBankName setBorderStyle: UITextBorderStyleRoundedRect];
    UILabel *lblBankName = [[UILabel alloc]initWithFrame:CGRectZero];
    lblBankName.text = @" Bank Name ";
    [lblBankName setTextColor:[UIColor lightGrayColor]];
    [lblBankName setFont:[UIFont systemFontOfSize:14]];
    tbxBankName.leftView = lblBankName;
    tbxBankName.leftViewMode = UITextFieldViewModeAlways;
    [lblBankName sizeToFit];

    
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
    [self performSegueWithIdentifier:SeguesDestinyToSignIn sender:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}



@end
