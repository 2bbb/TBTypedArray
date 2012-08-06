/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  TBMutableTypedArray.h                                      *
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

@interface TBMutableTypedArray : TBTypedArray

- (BOOL)isAddable:(id)anObject;

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)removeLastObject;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end
