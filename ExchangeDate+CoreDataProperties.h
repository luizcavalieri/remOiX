//
//  ExchangeDate+CoreDataProperties.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 5/06/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExchangeDate.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeDate (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *base;
@property (nullable, nonatomic, retain) NSDate *date;

@end

NS_ASSUME_NONNULL_END
