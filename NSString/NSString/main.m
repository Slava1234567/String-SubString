//
//  main.m
//  NSString
//
//  Created by Slava on 4/19/18.
//  Copyright © 2018 Slava. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MyClass.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        MyClass* text = [[MyClass alloc] init];
       
        NSString* text1 = @"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University].";
       
        NSString* text2 = @"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos.";
    
       
        
        text.CreateArrayCharactersBlock = ^NSMutableArray *(NSString *string) {
            
            NSMutableArray *charecters = [NSMutableArray arrayWithCapacity:[string length]];
        
            for (int i = 0; i < [string length]; i++) {
                NSString* charecter = [NSString stringWithFormat:@"%c",[string characterAtIndex:i]];
                [charecters addObject:charecter];
            }
            return charecters;
        };
        
        
        text.IndexesForTag = ^NSArray *(NSMutableArray *arrayTag, NSMutableArray *arrayIndex, NSString *string) {
            NSMutableArray *array = [NSMutableArray array];
            
            [arrayTag enumerateObjectsUsingBlock:^(NSString* tag, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([tag isEqualToString:string]) {
                    [array addObject:arrayIndex[idx]];
                }
            }];
            return [NSArray arrayWithArray:array];
        };
        

        text.string = text1;
        NSLog(@"%@", [text stringMethtod:text.string]);
        
        text.string = text2;
        NSLog(@"%@", [text stringMethtod:text.string]);
       
        [text release];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
    
    
}


