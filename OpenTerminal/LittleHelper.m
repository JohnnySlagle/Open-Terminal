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

//@interface NSObject (DVTViewControllerToolbarItem)
//+ (instancetype)alloc;
//- (id)initWithItemIdentifier:(NSString*)identifier;
//- (NSArray*)allowedItemIdentifiers;
//- (NSDictionary*)toolbarItemProviders;
//@end
//
//static NSString* const DMMDerivedDataExterminatorButtonIdentifier = @"me.delisa.DMMDerivedDataExterminator";
//static NSString* const DMMDerivedDataExterminatorShowButtonInTitleBar = @"DMMDerivedDataExterminatorShowButtonInTitleBar";
//static NSInteger const DMMToolbarRoundedMajorVersion = 10;
//static NSInteger const DMMToolbarRoundedMinorVersion = 10;

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


//#pragma mark - Button Functions
//
//+ (void)updateToolbarsFromPreferences
//{
//    @try {
//        NSArray* workspaceWindowControllers = [NSClassFromString(@"IDEWorkspaceWindowController") workspaceWindowControllers];
//        BOOL shouldShowButton = YES;//[self isButtonEnabled];
//        for (NSWindow* window in [workspaceWindowControllers valueForKey:@"window"]) {
//            [self registerToolbarButtonAndProviderForWindow:window];
//            if (shouldShowButton) {
//                [self insertToolbarButtonForWindow:window];
//            } else {
//                [self removeToolbarButtonForWindow:window];
//            }
//        }
//    }
//    @catch (NSException* exception) {}
//}
//
//+ (void)registerToolbarButtonAndProviderForWindow:(NSWindow*)window
//{
//    NSObject<NSToolbarDelegate>* delegate = window.toolbar.delegate;
//    NSArray* allowedIdentifiers = [delegate allowedItemIdentifiers];
//    NSMutableDictionary* providers = [delegate toolbarItemProviders].mutableCopy;
//    if (![allowedIdentifiers containsObject:DMMDerivedDataExterminatorButtonIdentifier]) {
//        allowedIdentifiers = [allowedIdentifiers arrayByAddingObject:DMMDerivedDataExterminatorButtonIdentifier];
//        providers[DMMDerivedDataExterminatorButtonIdentifier] = self;
//        [delegate setValue:allowedIdentifiers forKey:@"_allowedItemIdentifiers"];
//        [delegate setValue:providers forKey:@"_toolbarItemProviders"];
//    }
//}
//
//+ (void)insertToolbarButtonForWindow:(NSWindow*)window
//{
//    for (NSToolbarItem* item in window.toolbar.items) {
//        if ([item.itemIdentifier isEqualToString:DMMDerivedDataExterminatorButtonIdentifier])
//            return;
//    }
//    NSInteger index = MAX(0, window.toolbar.items.count - 1);
//    [window.toolbar insertItemWithItemIdentifier:DMMDerivedDataExterminatorButtonIdentifier
//                                         atIndex:index];
//}
//
//+ (void)removeToolbarButtonForWindow:(NSWindow*)window
//{
//    NSInteger index = NSNotFound;
//    for (int i = 0; i < window.toolbar.items.count; i++) {
//        NSToolbarItem* item = window.toolbar.items[i];
//        if ([item.itemIdentifier isEqualToString:DMMDerivedDataExterminatorButtonIdentifier]) {
//            index = i;
//            break;
//        }
//    }
//    if (index != NSNotFound) {
//        [window.toolbar removeItemAtIndex:index];
//    }
//}
//
//+ (BOOL)shouldUseRoundedToolbarButtonStyle {
//    NSOperatingSystemVersion version = [[NSProcessInfo processInfo] operatingSystemVersion];
//    return version.majorVersion >= DMMToolbarRoundedMajorVersion
//    && version.minorVersion >= DMMToolbarRoundedMinorVersion;
//}
//
//
//#pragma mark - Button Preferences
//
//+ (BOOL)isButtonEnabled
//{
//    return [[NSUserDefaults standardUserDefaults] boolForKey:DMMDerivedDataExterminatorShowButtonInTitleBar];
//}
//
//+ (void)setButtonEnabled:(BOOL)enabled
//{
//    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:DMMDerivedDataExterminatorShowButtonInTitleBar];
//}


@end
