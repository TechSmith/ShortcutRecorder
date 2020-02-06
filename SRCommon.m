//
//  SRCommon.m
//  ShortcutRecorder
//
//  Copyright 2006-2012 Contributors. All rights reserved.
//
//  License: BSD
//
//  Contributors:
//      David Dauer
//      Jesper
//      Jamie Kirkpatrick
//      Andy Kim
//      Ilya Kulakov

#import "SRCommon.h"
#import "SRKeyCodeTransformer.h"


NSString *SRReadableStringForCocoaModifierFlagsAndKeyCode(NSUInteger aModifierFlags, unsigned short aKeyCode)
{
    SRKeyCodeTransformer *t = [SRKeyCodeTransformer sharedPlainTransformer];
    NSString *c = [t transformedValue:@(aKeyCode)];

    if (![t isKeyCodeSpecial:aKeyCode])
        c = [c uppercaseString];

    return [NSString stringWithFormat:@"%@%@%@%@%@",
            (aModifierFlags & NSEventModifierFlagCommand ? SRLoc(@"Command-") : @""),
            (aModifierFlags & NSEventModifierFlagOption ? SRLoc(@"Option-") : @""),
            (aModifierFlags & NSEventModifierFlagControl ? SRLoc(@"Control-") : @""),
            (aModifierFlags & NSEventModifierFlagShift ? SRLoc(@"Shift-") : @""),
                                      c];
}


NSString *SRReadableASCIIStringForCocoaModifierFlagsAndKeyCode(NSUInteger aModifierFlags, unsigned short aKeyCode)
{
    SRKeyCodeTransformer *t = [SRKeyCodeTransformer sharedPlainASCIITransformer];
    NSString *c = [t transformedValue:@(aKeyCode)];

    if (![t isKeyCodeSpecial:aKeyCode])
        c = [c uppercaseString];

    return [NSString stringWithFormat:@"%@%@%@%@%@",
            (aModifierFlags & NSEventModifierFlagCommand ? SRLoc(@"Command-") : @""),
            (aModifierFlags & NSEventModifierFlagOption ? SRLoc(@"Option-") : @""),
            (aModifierFlags & NSEventModifierFlagControl ? SRLoc(@"Control-") : @""),
            (aModifierFlags & NSEventModifierFlagShift ? SRLoc(@"Shift-") : @""),
            c];
}
