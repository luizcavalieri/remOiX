//
//  AuthViewController.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 22/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "AuthViewController.h"
#import "MeasurementHelper.h"
#import "AppState.h"
#import "AppConstant.h"
#import "Client.h"

@import FirebaseDatabase;
@import Firebase;
@import FirebaseAuth;
@import GoogleSignIn;


@interface AuthViewController ()

@end

@implementation AuthViewController

@synthesize tbxPassword, tbxUsername, tbxSignUpName, tbxSignUpEmail, tbxSignUpPhone, tbxSignUpPassword, currentClient, activityIndicatorView;



-(void)viewDidAppear:(BOOL)animated{
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user) {
        [self signedIn:user];
    }
    
    
    
}

- (void)viewDidLoad {
   
    currentClient = [[Client alloc]init];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    if([[segue identifier] isEqualToString:SeguesSignInToExchange]){
        
        ExchangeViewController *exchangeViewController = (ExchangeViewController *)[segue destinationViewController];
        
        [exchangeViewController setCurrentClient:currentClient];
    }

    
}


- (IBAction)btnLogin:(id)sender {
    NSString *email = tbxUsername.text;
    NSString *password = tbxPassword.text;
    
    [self startActivityIndicator];
    
    [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if(error){
            
            [self showAlert:@"Sorry, try it again!" message:error.localizedDescription];
            [activityIndicatorView stopAnimating];
            NSLog(@"%@", error.localizedDescription);
            return ;
        }
        [self signedIn:user];
    }];
    
    [activityIndicatorView stopAnimating];
    
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


- (void)setDisplayName:(FIRUser *)user {
    //  [self signedIn:nil];
    FIRUserProfileChangeRequest *changeRequest =
    [user profileChangeRequest];
    // Use first part of email as the default display name
    changeRequest.displayName = [[user.email componentsSeparatedByString:@"@"] objectAtIndex:0];
    [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return;
        }
        
        [self signedIn:[FIRAuth auth].currentUser];
        
              
    //    Client *client = [[Client alloc]init];
        
        
        
    }];
}

- (void)signedIn:(FIRUser *)user {
    [MeasurementHelper sendLoginEvent];
    
    currentClient.name = [user displayName];// = changeRequest.displayName;
    currentClient.email = [user email];
    
    [AppState sharedInstance].displayName = user.displayName.length > 0 ? user.displayName : user.email;
    [AppState sharedInstance].photoUrl = user.photoURL;
    [AppState sharedInstance].signedIn = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:NotificationKeysSignedIn
                                                        object:nil userInfo:nil];
    
    [self performSegueWithIdentifier:SeguesSignInToExchange sender:nil];
}


- (IBAction)btnSignUp:(id)sender {
    NSString *email = tbxUsername.text;
    NSString *password = tbxPassword.text;
    
    [self startActivityIndicator];
    
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                 if (error) {
                                     
                                     [self showAlert:@"Sorry, try it again!" message:error.localizedDescription];
                                     
                                     NSLog(@"%@", error.localizedDescription);
                                     return;
                                 }
                                 [self setDisplayName:user];
                             }];
    
    [activityIndicatorView stopAnimating];
}

-(void)startActivityIndicator{
    
    //[activityIndicatorView setCenter:CGPointMake(160,124)];
    [self.view addSubview:activityIndicatorView];
    [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];

}


- (void) threadStartAnimating {
    [activityIndicatorView startAnimating];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
