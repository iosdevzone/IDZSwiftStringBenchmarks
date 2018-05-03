//
//  IDZSwiftStringBenchmarksObjC.m
//  IDZSwiftStringBenchmarks
//
//  Created  on 5/3/18.
//

#import "IDZSwiftStringBenchmarksObjC.h"

@implementation IDZSwiftStringBenchmarksObjC
+ (NSInteger)countNewlinesNSStringCharacterAtObjC:(NSString*)string
{
    NSInteger count = 0;
    for (int i = 0; i < string.length; ++i) {
        if ([string characterAtIndex:i] == 10) {
            count += 1;
        }
    }
    return count;
}

+ (NSInteger)countNewlinesNSStringUTF16PointerObjC:(NSString*)string
{
    NSInteger count = 0;
    unichar* p = (unichar *)[string cStringUsingEncoding:NSUTF16StringEncoding];
    while (*p != 0) {
        if (*p == 10) {
            count += 1;
        }
        p++;
    }
    return count;
}

+ (NSInteger)countNewlinesNSStringUTF8PointerObjC:(NSString*)string
{
    NSInteger count = 0;
    unsigned char* p = (unsigned char *)[string cStringUsingEncoding:NSUTF8StringEncoding];
    while (*p != 0) {
        if (*p == 10) {
            count += 1;
        }
        p++;
    }
    return count;
}
@end
