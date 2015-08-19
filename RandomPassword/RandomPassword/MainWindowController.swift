//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by Patrick O'Brien on 7/28/15.
//  Copyright (c) 2015 Patrick O'Brien. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var textField: NSTextField!
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        println("window loaded from NIB named \(windowNibName)")
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func generatePassword(sender: AnyObject) {
        let length = 8
        let password = generateRandomString(length)
        
        textField.stringValue = password
    }
    
    deinit {
        println("\(self) will be deallocated")
    }
}
