//
//  NSObject_Extension.swift
//
//  Created by Johnny Slagle on 2/1/16.
//  Copyright © 2016 Johnny Slagle. All rights reserved.
//

import Foundation

extension NSObject {
    class func pluginDidLoad(bundle: NSBundle) {
        let appName = NSBundle.mainBundle().infoDictionary?["CFBundleName"] as? NSString
        if appName == "Xcode" {
        	if sharedPlugin == nil {
        		sharedPlugin = OpenTerminal(plugin: bundle)
        	}
        }
    }
}