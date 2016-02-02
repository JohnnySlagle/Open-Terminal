//
//  OpenTerminal.swift
//
//  Created by Johnny Slagle on 2/1/16.
//  Copyright © 2016 Johnny Slagle. All rights reserved.
//

import AppKit

var sharedPlugin: OpenTerminal?

class OpenTerminal: NSObject {
    
    var bundle: NSBundle
    
    // MARK:- Init
    init(plugin: NSBundle) {
        self.bundle = plugin
        
        super.init()
        
        // Be Notified of Launch
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidFinishLaunching:", name: NSApplicationDidFinishLaunchingNotification, object: nil)
    }
    
    // MARK:- View Lifecycle
    func applicationDidFinishLaunching(notification: NSNotification) {
        removeObserver()
        
        // Add Menu Item
        if let menuItem = NSApp.mainMenu?.itemWithTitle("File") {
            let openTerminal = NSMenuItem(title:"Open in Terminal", action:"openInTerminal", keyEquivalent:"t")
            openTerminal.keyEquivalentModifierMask = Int(NSEventModifierFlags.CommandKeyMask.rawValue | NSEventModifierFlags.ControlKeyMask.rawValue | NSEventModifierFlags.AlternateKeyMask.rawValue)
            openTerminal.target = self
            menuItem.submenu?.addItem(NSMenuItem.separatorItem())
            menuItem.submenu?.addItem(openTerminal)
        }

        // Setup Button?
        // Note: I want to add a button to the toolbar, however, it is disabled for now becasue it seems like Xcode 7 may have borked this.
        // LittleHelper.updateToolbarsFromPreferences()
    }
    
    // MARK:- Open Terminal
    func openInTerminal() {
        let path = LittleHelper.projectPath()
        print(path)
        NSTask.launchedTaskWithLaunchPath("/usr/bin/open", arguments: ["-a", "/Applications/Utilities/Terminal.app", path])
    }
    
    // MARK:- Deinit & Removing Observers
    func removeObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    deinit {
        removeObserver()
    }
}

