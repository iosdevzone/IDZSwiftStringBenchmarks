//
//  IDZSwiftStringBenchmarksObjC.h
//  IDZSwiftStringBenchmarks
//
//  Created on 5/3/18.
//

#import <Foundation/Foundation.h>

@interface IDZSwiftStringBenchmarksObjC : NSObject
+ (NSInteger)countNewlinesNSStringCharacterAtObjC:(NSString*)string;
+ (NSInteger)countNewlinesNSStringUTF16PointerObjC:(NSString*)string;
+ (NSInteger)countNewlinesNSStringUTF8PointerObjC:(NSString*)string;
@end
