/* **** **** **** **** **** **** **** **** **** **** **** **** * 
 *                                                             *
 *  TBTypedArray.h                                             *
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

static NSString * const TBTypeException = @"TBTypeException";

@interface TBTypedArray : NSArray {
	Class klass;
	NSMutableArray *array;
}

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

- (id)initWithType:(Class)_klass;
- (id)initWithType:(Class)_klass andObject:(id)anObject;
- (id)initWithType:(Class)_klass andObjects:(const id [])objects count:(NSUInteger)cnt;
- (id)initWithType:(Class)_klass andObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithType:(Class)_klass andArray:(NSArray *)array;
- (id)initWithType:(Class)_klass andArray:(NSArray *)array copyItems:(BOOL)flag;

+ (id)arrayWithType:(Class)_klass;
+ (id)arrayWithType:(Class)_klass andObject:(id)anObject;
+ (id)arrayWithType:(Class)_klass andObjects:(const id [])objects count:(NSUInteger)cnt;
+ (id)arrayWithType:(Class)_klass andObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
+ (id)arrayWithType:(Class)_klass andArray:(NSArray *)array;
+ (id)arrayWithType:(Class)_klass andArray:(NSArray *)array copyItems:(BOOL)flag;

+ (id)arrayWithType:(Class)_klass andContentsOfFile:(NSString *)path;
+ (id)arrayWithType:(Class)_klass andContentsOfURL:(NSURL *)url;
- (id)initWithType:(Class)_klass andContentsOfFile:(NSString *)path;
- (id)initWithType:(Class)_klass andContentsOfURL:(NSURL *)url;

@end