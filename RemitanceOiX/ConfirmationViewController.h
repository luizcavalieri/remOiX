//
//  ConfirmationViewController.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 31/05/2016.
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
@import FirebaseAuth;
@import FirebaseCrash;
@import FirebaseDatabase;
@import FirebaseRemoteConfig;
@import FirebaseStorage;

@interface ConfirmationViewController : UIViewController

@property (strong, nonatomic) Client *currentClient;
@property (strong, nonatomic) Exchange *currentExchange;
@property (strong, nonatomic) Receiver *currentReceiver;
- (IBAction)btnLogOut:(id)sender;

- (IBAction)btnFinalize:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblAmountTotalPayment;
@property (weak, nonatomic) IBOutlet UILabel *lblReferenceId;

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSMutableArray<FIRDataSnapshot *> *transactions;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property (nonatomic, strong) FIRRemoteConfig *remoteConfig;

@end
