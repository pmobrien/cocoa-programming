//
//  MainWindowController.swift
//  BusyApp
//
//  Created by Patrick O'Brien on 8/8/15.
//  Copyright (c) 2015 Patrick O'Brien. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    let showTicks = 0;
    let numTicks = 10;
    
    var sliderVal = 0;
    
    @IBOutlet weak var slider: NSSlider!
    
    @IBOutlet weak var sliderLabel: NSTextField!
    
    @IBOutlet weak var showTicksRadio: NSButton!
    @IBOutlet weak var hideTickRadio: NSButton!
    
    @IBOutlet weak var checkbox: NSButton!
    
    @IBOutlet weak var secretTextField: NSTextField!
    @IBOutlet weak var revealButton: NSButton!
    @IBOutlet weak var revealTextField: NSTextField!
    
    @IBOutlet weak var resetButton: NSButton!
    
    override var windowNibName: String? {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        reset()
    }
    
    func reset() {
        slider.integerValue = 0
        updateTickMarks(showTicks)
        
        sliderLabel.stringValue = ""
        
        showTicksRadio.state = NSOnState
        
        checkbox.state = NSOnState
        updateCheckboxText(NSOnState)
        
        secretTextField.stringValue = ""
        revealTextField.stringValue = ""
    }
    
    @IBAction func adjustSlider(sender: NSSlider) {
        if sender.integerValue > sliderVal {
            sliderLabel.stringValue = "Slider goes up!"
        } else if sender.integerValue < sliderVal {
            sliderLabel.stringValue = "Slider goes down!"
        } else {
            sliderLabel.stringValue = "Slider isn't moving"
        }
        
        sliderVal = sender.integerValue
    }
    
    @IBAction func radioButtonChange(sender: NSButton) {
        updateTickMarks(sender.tag)
    }
    
    @IBAction func checkboxChange(sender: NSButton) {
        updateCheckboxText(sender.state)
    }
    
    @IBAction func revealSecretMessage(sender: NSButton) {
        revealTextField.stringValue = secretTextField.stringValue
    }
    
    @IBAction func resetButtonClicked(sender: NSButton) {
        reset()
    }
    
    private func updateTickMarks(tag: NSInteger) {
        slider.numberOfTickMarks = tag == showTicks ? numTicks : 0
    }
    
    private func updateCheckboxText(state: NSInteger) {
        checkbox.title = state == NSOffState ? "Check me" : "Uncheck me"
    }
}
