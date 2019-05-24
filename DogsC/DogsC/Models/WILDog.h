//
//  WILDog.h
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WILDog : NSObject

@property (nonatomic, copy) NSArray *breedArray;
@property (nonatomic, copy,) NSArray *breedTypeArray;

- (instancetype)initWithBreed:(NSArray *)breed breedType:(NSArray *)breedType;

@end

@interface WILDog (JSONConvertable)

-(instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end


NS_ASSUME_NONNULL_END
