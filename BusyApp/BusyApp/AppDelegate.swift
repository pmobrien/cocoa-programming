//
//  AppDelegate.swift
//  BusyApp
//
//  Created by Patrick O'Brien on 8/8/15.
//  Copyright (c) 2015 Patrick O'Brien. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow(self)
        
        self.mainWindowController = mainWindowController
    }
}
