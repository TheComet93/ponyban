////////////////////////////////////////////////////////////
//
// SFML - Simple and Fast Multimedia Library
// Copyright (C) 2007-2012 Marco Antognini (antognini.marco@gmail.com), 
//                         Laurent Gomila (laurent.gom@gmail.com), 
//
// This software is provided 'as-is', without any express or implied warranty.
// In no event will the authors be held liable for any damages arising from the use of this software.
//
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it freely,
// subject to the following restrictions:
//
// 1. The origin of this software must not be misrepresented;
//    you must not claim that you wrote the original software.
//    If you use this software in a product, an acknowledgment
//    in the product documentation would be appreciated but is not required.
//
// 2. Altered source versions must be plainly marked as such,
//    and must not be misrepresented as being the original software.
//
// 3. This notice may not be removed or altered from any source distribution.
//
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
// Headers
////////////////////////////////////////////////////////////
#import <SFML/Window/OSX/SFApplication.h>


////////////////////////////////////////////////////////////
@implementation SFApplication


////////////////////////////////////////////////////////////
+(void)processEvent
{
    [SFApplication sharedApplication]; // Make sure NSApp exists
    NSEvent* event = nil;
    
    while ((event = [NSApp nextEventMatchingMask:NSAnyEventMask
                                       untilDate:[NSDate distantPast]
                                          inMode:NSDefaultRunLoopMode
                                         dequeue:YES])) // Remove the event from the dequeue
    {
        [NSApp sendEvent:event];
    }
}

- (void)sendEvent:(NSEvent *)anEvent
{
    if ([anEvent type] == NSKeyUp) {
        [[[self mainWindow] firstResponder] tryToPerform:@selector(keyUp:)
                                                    with:anEvent];
    } else {
        [super sendEvent:anEvent];
    }
}


@end


