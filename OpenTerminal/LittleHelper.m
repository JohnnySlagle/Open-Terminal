//
//  LittleHelper.m
//  OpenTerminal
//
//  Created by Johnny Slagle on 2/1/16.
//  Copyright © 2016 Johnny Slagle. All rights reserved.
//

#import "LittleHelper.h"

@interface NSObject (IDEWorkspaceWindowController)
+ (id)workspaceWindowControllers;
@end


@implementation LittleHelper

+ (NSString *)projectPath {
    
    id currentWorkspaceWindow;
    NSArray *windowControllers = [NSClassFromString(@"IDEWorkspaceWindowController") workspaceWindowControllers];
    for (id controller in windowControllers) {
        if ([[controller valueForKey:@"window"] isEqual:[NSApp keyWindow]]) {
            currentWorkspaceWindow = [controller valueForKey:@"_workspace"];
            break;
        }
    }

    return ((NSString *)[[currentWorkspaceWindow valueForKey:@"representingFilePath"] valueForKey:@"_pathString"]).stringByDeletingLastPathComponent;
}

@end
