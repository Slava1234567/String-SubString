//
//  MyClass.m
//  NSString
//
//  Created by Slava on 4/19/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass
@synthesize CreateArrayCharactersBlock;
@synthesize IndexesForTag;

-(void)dealloc {
    [CreateArrayCharactersBlock release];
    [IndexesForTag release];
    [super dealloc];
}

-(NSArray*)stringMethtod: (NSString*) string {
    
    NSMutableArray* myReturnArrayString = [NSMutableArray array];
    
    NSMutableArray*constantArrayTagStart = [NSMutableArray arrayWithObjects:@"(",@"[",@"<", nil];
    NSMutableArray*constantArrayTagEnd = [NSMutableArray arrayWithObjects:@")",@"]",@">", nil];
    
  
    NSMutableArray* arrayCharacters = self.CreateArrayCharactersBlock(string);
    
    NSMutableArray* indexesForOpenTag = [NSMutableArray array];
    NSMutableArray* openTag = [NSMutableArray array];
    
    [arrayCharacters enumerateObjectsUsingBlock:^(NSString* charecter, NSUInteger idx, BOOL * _Nonnull stop) {
    
        if ([charecter isEqualToString:constantArrayTagStart[0]] ||
            [charecter isEqualToString:constantArrayTagStart[1]] ||
            [charecter isEqualToString:constantArrayTagStart[2]]) {
            
            NSNumber* indexForOpenTag = [NSNumber numberWithUnsignedInteger:(idx + 1)];
            
        
            [indexesForOpenTag addObject:indexForOpenTag];
            [openTag addObject:charecter];
            
        } else if ([charecter isEqualToString:constantArrayTagEnd[0]] ||
                   [charecter isEqualToString:constantArrayTagEnd[1]] ||
                   [charecter isEqualToString:constantArrayTagEnd[2]]) {
            
            [constantArrayTagEnd enumerateObjectsUsingBlock:^(NSString* tagEnd, NSUInteger idx1, BOOL * _Nonnull stop) {
              
                if ([tagEnd isEqualToString:charecter]){
                    NSString* tagForEquel = constantArrayTagStart[idx1];
                    
                    NSArray *indexesForNowTag = self.IndexesForTag(openTag,indexesForOpenTag, tagForEquel);
                    
                    
                    NSNumber* startIndex = [indexesForNowTag lastObject];
                    
                    NSInteger startLocational = [startIndex longValue];
                    NSInteger leght = idx - startLocational;
                    NSRange range = NSMakeRange(startLocational, leght);
                    [myReturnArrayString addObject:[string substringWithRange:range]];
                    
                }
            }];
        }
    }];
    return myReturnArrayString;
    }








    
    @end
    
