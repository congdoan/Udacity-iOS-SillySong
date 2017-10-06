//
//  ViewController.swift
//  Silly Song
//
//  Created by Cong Doan on 9/30/17.
//  Copyright © 2017 Cong Doan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add the view controller instance as the delegate of the "name" text field
        nameField.delegate = self
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let name = nameField.text!.trimmingCharacters(in: .whitespaces)
        if name != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
        }
    }
    
}


//++ Helper functions
func buildVowelSet() -> Set<Character> {
    let baseVowels = "aeiou".characters
    var allVowels: Set<Character> = []
    for baseVowel in baseVowels {
        allVowels.insert(baseVowel)
        for combiningValue in 768...868 {
            let combinedCharacter = "\(baseVowel)\(UnicodeScalar(combiningValue)!)"
            allVowels.insert(combinedCharacter[combinedCharacter.startIndex])
        }
    }
    return allVowels
}

let allVowels = buildVowelSet()

func shortNameFromName(name: String) -> String {
    let name = name.lowercased()
    var index = name.startIndex
    let endIndex = name.endIndex
    while index != endIndex && !allVowels.contains(name[index]) {
        index = name.index(after: index)
    }
    return (index != endIndex) ? String(name[index...]) : name
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
//--


