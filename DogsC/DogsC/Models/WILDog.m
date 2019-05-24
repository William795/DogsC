//
//  WILDog.m
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

#import "WILDog.h"

@implementation WILDog

-(instancetype)initWithBreed:(NSArray *)breed breedType:(NSArray *)breedType{
    self = [super init];
    if (self) {
        _breedArray = breed;
        _breedTypeArray = breedType;
    }
    return self;
}


@end


@implementation WILDog (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary{
    
    NSArray *breedArray = [dictionary allKeys];
    NSArray *breedTypes = [dictionary allValues];
    
    return [self initWithBreed:breedArray breedType:breedTypes];
}

@end

