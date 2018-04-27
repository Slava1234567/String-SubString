//
//  MyClass.h
//  NSString
//
//  Created by Slava on 4/19/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MyClass : NSObject

@property (strong,nonatomic) NSString* string;
@property (copy,nonatomic) NSMutableArray* (^CreateArrayCharactersBlock)(NSString* string);
@property (copy,nonatomic) NSArray* (^IndexesForTag)(NSMutableArray* arrayTag,NSMutableArray* arrayIndex, NSString* string);


-(NSArray*)stringMethtod: (NSString*) string;

@end
