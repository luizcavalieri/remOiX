//
//  Receiver.m
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 31/05/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "Receiver.h"

@implementation Receiver


@synthesize name = receiverName;
@synthesize email = receiverEmail;
@synthesize phone = receiverPhone;
@synthesize cpf = receiverCpf;
@synthesize accountInfo = receiverAccountInfo;
@synthesize bankName = receiverBankName;


- (instancetype)init
{
    self = [super init];
    if (self) {
        receiverName = [[NSString alloc]init];
        receiverEmail = [[NSString alloc] init];
        receiverPhone = [[NSString alloc]init];
        receiverCpf = [[NSString alloc]init];
        receiverAccountInfo = [[NSString alloc]init];
        receiverBankName = [[NSString alloc]init];
    }
    return self;}


@end
