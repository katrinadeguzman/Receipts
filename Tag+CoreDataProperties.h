//
//  Tag+CoreDataProperties.h
//  Receipts
//
//  Created by Katrina de Guzman on 2017-06-22.
//  Copyright © 2017 Katrina de Guzman. All rights reserved.
//

#import "Tag+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Tag (CoreDataProperties)

+ (NSFetchRequest<Tag *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *tagName;
@property (nullable, nonatomic, retain) NSSet<Receipt *> *relationship;

@end

@interface Tag (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(Receipt *)value;
- (void)removeRelationshipObject:(Receipt *)value;
- (void)addRelationship:(NSSet<Receipt *> *)values;
- (void)removeRelationship:(NSSet<Receipt *> *)values;

@end

NS_ASSUME_NONNULL_END
