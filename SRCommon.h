//
//  SRCommon.h
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

#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>


/*!
    @brief  Mask representing subset of Cocoa modifier flags suitable for shortcuts.
 */
static const NSUInteger SRCocoaModifierFlagsMask = NSEventModifierFlagCommand | NSEventModifierFlagOption | NSEventModifierFlagShift | NSEventModifierFlagControl;

/*!
    @brief  Mask representing subset of Carbon modifier flags suitable for shortcuts.
 */
static const NSUInteger SRCarbonModifierFlagsMask = cmdKey | optionKey | shiftKey | controlKey;

/*!
   @brief  Bundle identifier for ShortcutRecorder library
*/
static NSString* SRBundleIdentifier = @"com.kulakov.ShortcutRecorder";


/*!
    @brief  Converts carbon modifier flags to cocoa.
 */
FOUNDATION_STATIC_INLINE NSUInteger SRCarbonToCocoaFlags(UInt32 aCarbonFlags)
{
    NSUInteger cocoaFlags = 0;

    if (aCarbonFlags & cmdKey)
       cocoaFlags |= NSEventModifierFlagCommand;

    if (aCarbonFlags & optionKey)
       cocoaFlags |= NSEventModifierFlagOption;

    if (aCarbonFlags & controlKey)
       cocoaFlags |= NSEventModifierFlagControl;

    if (aCarbonFlags & shiftKey)
       cocoaFlags |= NSEventModifierFlagShift;

    return cocoaFlags;
}

/*!
    @brief  Converts cocoa modifier flags to carbon.
 */
FOUNDATION_STATIC_INLINE UInt32 SRCocoaToCarbonFlags(NSUInteger aCocoaFlags)
{
    UInt32 carbonFlags = 0;

   if (aCocoaFlags & NSEventModifierFlagCommand)
        carbonFlags |= cmdKey;

   if (aCocoaFlags & NSEventModifierFlagOption)
        carbonFlags |= optionKey;

   if (aCocoaFlags & NSEventModifierFlagControl)
        carbonFlags |= controlKey;

   if (aCocoaFlags & NSEventModifierFlagShift)
        carbonFlags |= shiftKey;

    return carbonFlags;
}

/*!
    @brief  Convenient method to get localized string from the framework bundle.
 */
FOUNDATION_STATIC_INLINE NSString *SRLoc(NSString *aKey)
{
#ifdef SRLib
   NSString* result = NSLocalizedStringFromTable(aKey,
                                                 @"ShortcutRecorder",
                                                 nil);
   NSCParameterAssert(result);
   return result;
#else
    return NSLocalizedStringFromTableInBundle(aKey,
                                              @"ShortcutRecorder",
                                              [NSBundle bundleWithIdentifier:@"com.kulakov.ShortcutRecorder"],
                                              nil);
#endif
}


/*!
    @brief  Convenient method to get image from the framework bundle.
 */
FOUNDATION_STATIC_INLINE NSImage *SRImage(NSString *anImageName)
{
#ifdef SRLib
   NSImage* image = [[NSBundle mainBundle] imageForResource:anImageName];
   NSCParameterAssert(image);
   return image;
#else
    NSBundle *b = [NSBundle bundleWithIdentifier:@"com.kulakov.ShortcutRecorder"];

   return [b imageForResource:anImageName];
#endif
}


/*!
    @brief  Returns string representation of shortcut with modifier flags replaced with their localized
            readable equivalents (e.g. ? -> Option).
 */
NSString *SRReadableStringForCocoaModifierFlagsAndKeyCode(NSUInteger aModifierFlags, unsigned short aKeyCode);

/*!
    @brief  Returns string representation of shortcut with modifier flags replaced with their localized
            readable equivalents (e.g. ? -> Option) and ASCII character for key code.
 */
NSString *SRReadableASCIIStringForCocoaModifierFlagsAndKeyCode(NSUInteger aModifierFlags, unsigned short aKeyCode);
