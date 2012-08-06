/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  TBTypedArray.m                                             *
 *                                                             *
 *  Created by ISHII 2bit on 12/08/06.                         *
 *  Copyright (c) 2012 buffer Renaiss. All rights reserved.    *
 *                                                             *
 * **** **** **** **** **** **** **** **** **** **** **** **** */

#import "TBTypedArray.h"

@implementation TBTypedArray

- (id)init {
	self = [super init];
	if(self) {
		array = [[NSMutableArray alloc] init];
		klass = [NSObject class];
	}
	return self;
}

- (NSUInteger)count {
	return [array count];
}

- (id)objectAtIndex:(NSUInteger)index {
	return [array objectAtIndex:index];
}

- (id)initWithType:(Class)_klass {
	return [self initWithType:_klass andArray:nil];
}

- (id)initWithType:(Class)_klass andObject:(id)anObject {
	return [self initWithType:_klass andObjects:anObject, nil];
}

- (id)initWithType:(Class)_klass
		andObjects:(const id [])objects
			 count:(NSUInteger)cnt
{
	return [self initWithType:_klass andArray:[NSArray arrayWithObjects:objects count:cnt]];
}

- (id)initWithType:(Class)_klass andObjects:(id)firstObj, ... {
	va_list arguments;
	va_start(arguments, firstObj);
	id obj = firstObj;
	
	array = [[NSMutableArray alloc] init];
	
	while(obj) {
		if(![obj isKindOfClass:_klass]) {
			[array release];
			array = nil;
			[NSException raise:TBTypeException
						format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[obj class] description], [_klass description]];
			break;
		}
		[array addObject:obj];
		obj = va_arg(arguments, typeof(id));
	}
	va_end(arguments);
	
	self = [super init];
	if(self) {
		klass = _klass;
	}
	
	return self;
}

- (id)initWithType:(Class)_klass andArray:(NSArray *)_array {
	return [self initWithType:_klass andArray:_array copyItems:NO];
}

- (id)initWithType:(Class)_klass andArray:(NSArray *)_array copyItems:(BOOL)flag {
	for(id obj in _array) if(![obj isKindOfClass:_klass]) {
		[NSException raise:TBTypeException
					format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[obj class] description], [_klass description]];
	}
	
	array = [[NSMutableArray alloc] initWithArray:_array];
	self = [super init];
	if(self) {
		klass = _klass;
	}
	return self;
}

+ (id)arrayWithType:(Class)_klass {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass
														 andArray:nil];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andObject:(id)anObject {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass
														 andArray:[NSArray arrayWithObjects:anObject, nil]];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andObjects:(const id [])objects count:(NSUInteger)cnt {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass
													   andObjects:objects
															count:cnt];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andObjects:(id)firstObj, ... {
	va_list arguments;
	va_start(arguments, firstObj);
	id obj = firstObj;
	
	NSMutableArray *array = [NSMutableArray array];
	
	while(obj) {
		if(![obj isKindOfClass:_klass]) {
			[array release];
			array = nil;
			[NSException raise:TBTypeException
						format:@"TBMutableTypedArray - anObject (: %@) doesn't have class : %@", [[obj class] description], [_klass description]];
			break;
		}
		[array addObject:obj];
		obj = va_arg(arguments, typeof(id));
	}
	va_end(arguments);
	
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass andArray:array];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andArray:(NSArray *)array {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass andArray:array];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andArray:(NSArray *)array copyItems:(BOOL)flag {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass andArray:array copyItems:flag];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andContentsOfFile:(NSString *)path {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass andContentsOfFile:path];
	return [typedArray autorelease];
}

+ (id)arrayWithType:(Class)_klass andContentsOfURL:(NSURL *)url {
	TBTypedArray *typedArray = [[TBTypedArray alloc] initWithType:_klass andContentsOfURL:url];
	return [typedArray autorelease];
}

- (id)initWithType:(Class)_klass andContentsOfFile:(NSString *)path {
	return [self initWithType:_klass andArray:[NSArray arrayWithContentsOfFile:path]];
}

- (id)initWithType:(Class)_klass andContentsOfURL:(NSURL *)url {
	return [self initWithType:_klass andArray:[NSArray arrayWithContentsOfURL:url]];
}

#pragma mark NSFastEnumeration Protocol

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
								  objects:(id *)stackbuf
									count:(NSUInteger)len
{
	return [array countByEnumeratingWithState:state
									  objects:stackbuf
										count:len];
}

@end
