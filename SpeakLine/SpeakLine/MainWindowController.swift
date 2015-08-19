//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by Patrick O'Brien on 8/18/15.
//  Copyright (c) 2015 Patrick O'Brien. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController, NSSpeechSynthesizerDelegate, NSWindowDelegate {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    let speechSynth = NSSpeechSynthesizer()
    
    var isStarted: Bool = false {
        didSet {
            updateButtons()
        }
    }
    
    override var windowNibName: String {
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        updateButtons()
        speechSynth.delegate = self
    }
    
    // MARK: - Action methods
    
    @IBAction func speakIt(sender: NSButton) {
        let string = textField.stringValue
        if string.isEmpty {
            println("string from \(textField) is empty")
        } else {
            speechSynth.startSpeakingString(string)
            isStarted = true
        }
    }
    
    @IBAction func stopIt(sender: NSButton) {
        speechSynth.stopSpeaking()
    }
    
    func updateButtons() {
        if isStarted {
            speakButton.enabled = false
            stopButton.enabled = true
        } else {
            stopButton.enabled = false
            speakButton.enabled = true
        }
    }
    
    // MARK: - NSSpeechSynthesizerDelegate
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        isStarted = false
        println("finishedSpeaking=\(finishedSpeaking)")
    }
    
    // MARK: - NSWindowDelegate
    
    func windowShouldClose(sender: AnyObject) -> Bool {
        return !isStarted
    }
}
