//
//  DestinyViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 24/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "DestinyViewController.h"
#import "ExchangeViewController.h"
#import "AppConstant.h"


@import FirebaseAuth;
@import FirebaseDatabase;

@interface DestinyViewController ()

@end

@implementation DestinyViewController


@synthesize lblMoneyToReceive, tbxName, tbxCPF, tbxEmail, tbxPhone, tbxBankName, tbxAccountInfo, moneyToReceiveFromXvc;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[lblMoneyToReceive setText:[NSString stringWithFormat:@"Total to receive R$%0.2f", moneyToReceiveTotal ]];
    
    ExchangeViewController *exchangeViewController = [[ExchangeViewController alloc]init];
    
    [lblMoneyToReceive setText:[NSString stringWithFormat:@"R$%0.2f", moneyToReceiveFromXvc]];
    
    [self addTextField];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


//-(void)addTextField{
//    // This allocates a label
//    UILabel *prefixLabel = [[UILabel alloc]initWithFrame:CGRectZero];
//    //This sets the label text
//    prefixLabel.text =@"## ";
//    // This sets the font for the label
//    [prefixLabel setFont:[UIFont boldSystemFontOfSize:14]];
//    // This fits the frame to size of the text
//    [prefixLabel sizeToFit];
//    
//    // This allocates the textfield and sets its frame
//    UITextField *tbxNameCustom = [[UITextField  alloc] initWithFrame:
//                              CGRectMake(10, 150, 280, 30)];
//    
//    // This sets the border style of the text field
//    tbxNameCustom.borderStyle = UITextBorderStyleRoundedRect;
//    tbxNameCustom.contentVerticalAlignment =
//    UIControlContentVerticalAlignmentCenter;
//    [tbxNameCustom setFont:[UIFont boldSystemFontOfSize:12]];
//    
//    //Placeholder text is displayed when no text is typed
//    tbxNameCustom.placeholder = @"Simple Text field";
//    
//    //Prefix label is set as left view and the text starts after that
//    tbxNameCustom.leftView = prefixLabel;
//    
//    //It set when the left prefixLabel to be displayed
//    tbxNameCustom.leftViewMode = UITextFieldViewModeAlways;
//    
//    // Adds the textField to the view.
//    [self.view addSubview:tbxNameCustom];
//    
//    // sets the delegate to the current class
//    tbxNameCustom.delegate = self;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// This method is called once we click inside the textField
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    NSLog(@"Text field did begin editing");
//}
//
//// This method is called once we complete editing
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    NSLog(@"Text field ended editing");
//}



@end
