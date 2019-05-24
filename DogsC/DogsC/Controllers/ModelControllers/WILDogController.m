//
//  WILDogController.m
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

#import "WILDogController.h"
#import "UIKit/UIKit.h"
#import "WILDog.h"

static NSString * const baseUrlString = @"https://dog.ceo/api/breed";

@implementation WILDogController

+ (instancetype)shared{
    static WILDogController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [WILDogController new];
    });
    return shared;
}

-(void)fetchDog:(void (^)(BOOL))completion {
    
    NSURL *url = [NSURL URLWithString:@"https://dog.ceo/api/breeds/list/all"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s:%@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(false);
            return;
        }
        if (!data){
            NSLog(@"Fail");
            completion(false);
            return;
        }
        
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        NSDictionary *messageDict = topLevelJSON[@"message"];
        
        WILDog *breed = [[WILDog alloc] initWithDictionary:messageDict];
        
        WILDogController.shared.dog = breed.breedArray;
        WILDogController.shared.dogBreed = breed.breedTypeArray;
        completion(true);
    }]resume];
}

-(void)fetchImageUrlWith:(NSString *)breed type:(NSString *)type completion:(void (^)(NSString * _Nonnull))completion{
    
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    NSString *dogBreed = breed;
    NSString *breedType = type;
    
    NSURL *finalUrl = baseUrl;
    
    if (breedType) {
        finalUrl = [[[baseUrl URLByAppendingPathComponent:dogBreed] URLByAppendingPathComponent:breedType] URLByAppendingPathComponent:@"images/random"];
    } else {
        finalUrl = [[baseUrl URLByAppendingPathComponent:dogBreed] URLByAppendingPathComponent:@"images/random"];
    }

    NSLog(@"%@", finalUrl);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"There was an error in %s:%@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            return;
        }
        if (!data){
            return;
        }
        
        NSDictionary *topLevelJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSString *imageUrlString = topLevelJSON[@"message"];
        
        completion(imageUrlString);
    }]resume];
}

- (void)fetchImageWith:(NSString *)url completion:(void (^)(UIImage * _Nonnull))completion {
    
    NSURL *finalUrl = [NSURL URLWithString:url];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️🤹🏻‍♂️There was an error in %s:%@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        if (!data) {
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
        
    }]resume];
}



@end
