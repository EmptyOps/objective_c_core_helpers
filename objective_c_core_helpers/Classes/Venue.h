//
//  Venue.h
//  XClient
//
//  Created by Hitesh Khunt on 13/06/15.
//  Copyright (c) 2015 XClient. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface Venue : NSObject

@property (nonatomic, strong) NSString *name;


+ (RKObjectMapping *)mapping;

+ (RKObjectMapping *)response;

- (NSDictionary*)elementToPropertyMappings;

@end

//@interface Venue : NSObject {
//    NSNumber* _identifier;
//    NSString* _name;
//    NSString* _company;
//
//    NSDictionary* _response;
//}
//
//@property (nonatomic, retain) NSNumber* identifier;
//@property (nonatomic, retain) NSString* name;
//@property (nonatomic, retain) NSString* company;
//
//@property (nonatomic, retain) NSDictionary* response;
//
//@end
