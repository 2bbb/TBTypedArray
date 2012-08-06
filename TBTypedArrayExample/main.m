/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  main.m                                                     *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** *
 *                                                             *
 * 2012/08/06 Ver. 0.0                                         *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#import <Foundation/Foundation.h>

#import "TBTypedArray.h"
#import "TBMutableTypedArray.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
	    // insert code here...
		NS_DURING
	    TBTypedArray *numberArray = [[TBTypedArray alloc] initWithType:[NSNumber class] andObject:[NSNumber numberWithInt:4]];
		NSLog(@"SUCCESS: %d", [[numberArray lastObject] intValue]);
		NS_HANDLER
		NSLog(@"Error %@:\n\t%@", [localException name], [localException description]);
		NS_ENDHANDLER
		
		NS_DURING
	    TBTypedArray *stringArray = [[TBTypedArray alloc] initWithType:[NSString class] andObject:[NSNumber numberWithInt:4]];
		NSLog(@"%@", [stringArray lastObject]);
		NS_HANDLER
		NSLog(@"Error %@:\n\t%@", [localException name], [localException description]);
		NS_ENDHANDLER
		
		NS_DURING
	    TBMutableTypedArray *array = [[TBMutableTypedArray alloc] initWithType:[NSString class]];
		[array addObject:@"Foo"];
		[array addObject:[NSString stringWithString:@"Bar"]];
		[array addObject:[NSMutableString stringWithString:@"Baz"]];
		NSLog(@"%@", [array lastObject]);
		[array addObject:[NSArray array]];
		NSLog(@"%@", [array lastObject]);
		NS_HANDLER
		NSLog(@"Error %@:\n\t%@", [localException name], [localException description]);
		NS_ENDHANDLER
		
		NS_DURING
	    TBMutableTypedArray *array = [[TBMutableTypedArray alloc] initWithType:[NSString class]];
		[array addObject:@"Foo"];
		[array addObject:[NSString stringWithString:@"Bar"]];
		[array addObject:[NSMutableString stringWithString:@"Baz"]];
		NSArray *newArray = [NSArray arrayWithArray:array];
		NSLog(@"%@", [newArray lastObject]);
		NS_HANDLER
		NSLog(@"Error %@:\n\t%@", [localException name], [localException description]);
		NS_ENDHANDLER
	}
    return 0;
}

