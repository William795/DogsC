//
//  WILDogController.h
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WILDog;

NS_ASSUME_NONNULL_BEGIN

@interface WILDogController : NSObject

@property (nonatomic, copy) NSArray *dog;
@property (nonatomic, copy) NSArray *dogBreed;

+(instancetype) shared;

- (void)fetchDog:(void (^)(BOOL))completion;

- (void)fetchImageUrlWith:(NSString *)breed type:(NSString *)type completion:(void (^)(NSString *))completion;

- (void)fetchImageWith:(NSString *)url completion:(void (^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
