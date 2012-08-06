/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  TBMutableTypedArray.m                                      *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#import "TBMutableTypedArray.h"

@implementation TBMutableTypedArray

- (BOOL)isAddable:(id)anObject {
	return [anObject isKindOfClass:klass];
}

- (void)initWithType:(Class)_klass andCapacity:(NSUInteger)capacity {
	self = [super init];
	if(self) {
		array = [[NSMutableArray alloc] initWithCapacity:capacity];
	}
}

- (NSUInteger)count {
	return [super count];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
	if(anObject == nil) {
		[NSException raise:NSInvalidArgumentException
					format:@"NSMutableTypedArray - object is nil"];
	}
	if([self count] <= index) {
		[NSException raise:NSRangeException
					format:@"NSMutableTypedArray - index(%d) is greater than number of elements(%d) in the array", index, [self count]];
	}
	if(![self isAddable:anObject]) {
		[NSException raise:TBTypeException
					format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[anObject class] description], [klass description]];
	}
	[array insertObject:anObject atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
	if([self count] <= index) {
		[NSException raise:NSRangeException
					format:@"NSMutableTypedArray - index(%d) is greater than number of elements(%d) in the array", index, [self count]];
	}
	[array removeObjectAtIndex:index];
}

- (void)addObject:(id)anObject {
	if(![self isAddable:anObject]) {
		[NSException raise:TBTypeException
					format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[anObject class] description], [klass description]];
	}
	[array addObject:anObject];
}

- (void)removeLastObject {
	[array removeLastObject];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
	if([self count] <= index) {
		[NSException raise:NSRangeException
					format:@"NSMutableTypedArray - index(%d) is greater than number of elements(%d) in the array", index, [self count]];
	}
	if(![self isAddable:anObject]) {
		[NSException raise:TBTypeException
					format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[anObject class] description], [klass description]];
	}
	[array replaceObjectAtIndex:index withObject:anObject];
}

@end
