//
//  ShortcutRecorder.h
//  ShortcutRecorder
//  Copyright 2012 Contributors. All rights reserved.
//
//  License: BSD
//
//  Contributors to this file:
//      Jesper
//      Ilya Kulakov

#ifdef SRLib

#import "SRCommon.h"
#import "SRKeyCodeTransformer.h"
#import "SRModifierFlagsTransformer.h"
#import "SRKeyEquivalentTransformer.h"
#import "SRKeyEquivalentModifierMaskTransformer.h"
#import "SRValidator.h"
#import "SRRecorderControl.h"

#else // framework

#import <ShortcutRecorder/SRCommon.h>
#import <ShortcutRecorder/SRKeyCodeTransformer.h>
#import <ShortcutRecorder/SRModifierFlagsTransformer.h>
#import <ShortcutRecorder/SRKeyEquivalentTransformer.h>
#import <ShortcutRecorder/SRKeyEquivalentModifierMaskTransformer.h>
#import <ShortcutRecorder/SRValidator.h>
#import <ShortcutRecorder/SRRecorderControl.h>

#endif