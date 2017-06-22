//
//  Receipt+CoreDataProperties.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "Receipt+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

+ (NSFetchRequest<Receipt *> *)fetchRequest;

@property (nonatomic) float amount;
@property (nullable, nonatomic, copy) NSString *note;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSSet<Tag *> *relationship;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(Tag *)value;
- (void)removeRelationshipObject:(Tag *)value;
- (void)addRelationship:(NSSet<Tag *> *)values;
- (void)removeRelationship:(NSSet<Tag *> *)values;

@end

NS_ASSUME_NONNULL_END
