//
//  SRModifierFlagsTransformer.m
//  ShortcutRecorder
//
//  Copyright 2006-2012 Contributors. All rights reserved.
//
//  License: BSD
//
//  Contributors:
//      Ilya Kulakov

#import "SRModifierFlagsTransformer.h"
#import "SRCommon.h"


@implementation SRModifierFlagsTransformer

- (instancetype)initWithPlainStrings:(BOOL)aUsesPlainStrings
{
    self = [super init];

    if (self)
    {
        _usesPlainStrings = aUsesPlainStrings;
    }

    return self;
}

- (instancetype)init
{
    return [self initWithPlainStrings:NO];
}


#pragma mark Methods

+ (instancetype)sharedTransformer
{
    static dispatch_once_t OnceToken;
    static SRModifierFlagsTransformer *Transformer = nil;
    dispatch_once(&OnceToken, ^{
        Transformer = [[self alloc] initWithPlainStrings:NO];
    });
    return Transformer;
}

+ (instancetype)sharedPlainTransformer
{
    static dispatch_once_t OnceToken;
    static SRModifierFlagsTransformer *Transformer = nil;
    dispatch_once(&OnceToken, ^{
        Transformer = [[self alloc] initWithPlainStrings:YES];
    });
    return Transformer;
}


#pragma mark NSValueTransformer

+ (Class)transformedValueClass
{
    return [NSString class];
}

+ (BOOL)allowsReverseTransformation
{
    return NO;
}

- (NSString *)transformedValue:(NSNumber *)aValue
{
    if (![aValue isKindOfClass:[NSNumber class]])
        return nil;
    else if (self.usesPlainStrings)
    {
        NSUInteger modifierFlags = [aValue unsignedIntegerValue];
        NSMutableString *s = [NSMutableString string];

       if (modifierFlags & NSEventModifierFlagControl)
          [s appendString:NSLocalizedStringFromTableInBundle(@"Control-",
                                                             @"ShortcutRecorder",
                                                             [NSBundle bundleWithIdentifier:SRBundleIdentifier],
                                                             nil)];
       
       if (modifierFlags & NSEventModifierFlagOption)
          [s appendString:NSLocalizedStringFromTableInBundle(@"Option-",
                                                             @"ShortcutRecorder",
                                                             [NSBundle bundleWithIdentifier:SRBundleIdentifier],
                                                             nil)];
       
       if (modifierFlags & NSEventModifierFlagShift)
          [s appendString:NSLocalizedStringFromTableInBundle(@"Shift-",
                                                             @"ShortcutRecorder",
                                                             [NSBundle bundleWithIdentifier:SRBundleIdentifier],
                                                             nil)];
       
       if (modifierFlags & NSEventModifierFlagCommand)
          [s appendString:NSLocalizedStringFromTableInBundle(@"Command-",
                                                             @"ShortcutRecorder",
                                                             [NSBundle bundleWithIdentifier:SRBundleIdentifier],
                                                             nil)];

        if (s.length > 0)
            [s deleteCharactersInRange:NSMakeRange(s.length - 1, 1)];

        return s;
    }
    else
    {
        NSUInteger f = [aValue unsignedIntegerValue];
        return [NSString stringWithFormat:@"%@%@%@%@",
                (f & NSEventModifierFlagControl ? @"⌃" : @""),
                (f & NSEventModifierFlagOption ? @"⌥" : @""),
                (f & NSEventModifierFlagShift ? @"⇧" : @""),
                (f & NSEventModifierFlagCommand ? @"⌘" : @"")];
    }
}

@end
