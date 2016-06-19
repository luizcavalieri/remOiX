//
//  ExchangeList+CoreDataProperties.h
//  RemitanceOiX
//
//  Created by Luiz cavalieri on 8/06/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ExchangeList.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExchangeList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *brl;
@property (nullable, nonatomic, retain) NSSet<ExchangeDate *> *rates;

@end

@interface ExchangeList (CoreDataGeneratedAccessors)

- (void)addRatesObject:(ExchangeDate *)value;
- (void)removeRatesObject:(ExchangeDate *)value;
- (void)addRates:(NSSet<ExchangeDate *> *)values;
- (void)removeRates:(NSSet<ExchangeDate *> *)values;

@end

NS_ASSUME_NONNULL_END
