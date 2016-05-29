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

@synthesize tbxPassword, tbxUsername, tbxSignUpName, tbxSignUpEmail, tbxSignUpPhone, tbxSignUpPassword, lblTest1, lblTest2;



-(void)viewDidAppear:(BOOL)animated{
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user) {
        [self signedIn:user];
    }
    
    
    
}

- (void)viewDidLoad {
   
   
    
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
    
    ExchangeViewController *exchangeVieController = [segue destinationViewController];
    
    //Client *clientForwarder = user.setDisplayName;
    
    //[exchangeVieController setCurrentClient:clientForwarder];
    
}


- (IBAction)btnLogin:(id)sender {
    NSString *email = tbxUsername.text;
    NSString *password = tbxPassword.text;
    
    
    //lblTest2.text = [NSString stringWithFormat:@"Email: %@", email];
    //lblTest1.text = [NSString stringWithFormat:@"Password: %@", password];
    
    [[FIRAuth auth] signInWithEmail:email password:password completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if(error){
            NSLog(@"%@", error.localizedDescription);
            return ;
        }
        [self signedIn:user];
    }];
    
    //NSLog(@"The user logged in is: %@", [AppState sharedInstance].displayName);
    
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
        
              
        Client *client = [[Client alloc]init];
        
        client.name = changeRequest.displayName;
    
        
    }];
}

- (void)signedIn:(FIRUser *)user {
    [MeasurementHelper sendLoginEvent];
    
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
    [[FIRAuth auth] createUserWithEmail:email
                               password:password
                             completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
                                 if (error) {
                                     NSLog(@"%@", error.localizedDescription);
                                     return;
                                 }
                                 [self setDisplayName:user];
                             }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [super touchesBegan:touches withEvent:event];
}


@end
