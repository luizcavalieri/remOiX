//
//  ExchangeList+CoreDataProperties.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 4/06/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExchangeList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *usdbrl;
@property (nullable, nonatomic, retain) NSNumber *usdaud;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *quotes;

@end

@interface ExchangeList (CoreDataGeneratedAccessors)

- (void)addQuotesObject:(NSManagedObject *)value;
- (void)removeQuotesObject:(NSManagedObject *)value;
- (void)addQuotes:(NSSet<NSManagedObject *> *)values;
- (void)removeQuotes:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
