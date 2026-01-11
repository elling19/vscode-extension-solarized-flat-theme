
// Objective-C Advanced Syntax Test for Solarized Flat Theme
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Color) {
    ColorRed,
    ColorGreen,
    ColorBlue
};

@protocol Greetable <NSObject>
- (void)greet:(NSString *)name;
@end

@interface Logger : NSObject
- (void)log:(NSString *)msg;
@end

@implementation Logger
- (void)log:(NSString *)msg {
    NSLog(@"[LOG] %@", msg);
}
@end

@interface User : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL active;
@end

@implementation User
@end

@interface Dog : Logger <Greetable>
@property (nonatomic, copy) NSString *name;
@end

@implementation Dog
- (void)greet:(NSString *)name {
    [self log:[NSString stringWithFormat:@"Greeting %@", name]];
    NSLog(@"Hello, %@!", name);
}
- (void)speak {
    NSLog(@"%@ barks!", self.name);
}
@end

@interface NSArray (Squared)
- (NSArray<NSNumber *> *)squared;
@end

@implementation NSArray (Squared)
- (NSArray<NSNumber *> *)squared {
    NSMutableArray *result = [NSMutableArray array];
    for (NSNumber *n in self) {
        [result addObject:@(n.intValue * n.intValue)];
    }
    return result;
}
@end

int tryDivide(int a, int b, NSError **error) {
    if (b == 0) {
        if (error) *error = [NSError errorWithDomain:@"DivideByZero" code:1 userInfo:nil];
        return 0;
    }
    return a / b;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *user = [User new];
        user.name = @"Alice";
        user.active = YES;
        Dog *dog = [Dog new];
        dog.name = @"Buddy";
        [dog greet:user.name];
        [dog speak];
        NSArray *nums = @[@1, @2, @3];
        NSLog(@"Squared: %@", [nums squared]);
        NSError *err = nil;
        tryDivide(10, 0, &err);
        if (err) NSLog(@"Caught error: %@", err);
        Color color = ColorGreen;
        switch (color) {
            case ColorRed: NSLog(@"Red"); break;
            case ColorGreen: NSLog(@"Green"); break;
            case ColorBlue: NSLog(@"Blue"); break;
        }
        void (^closure)(NSString *) = ^(NSString *msg) {
            NSLog(@"Closure: %@", msg);
        };
        closure(@"Test");
    }
    return 0;
}
