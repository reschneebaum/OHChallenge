//
//  TextManipulator.swift
//  OviaChallenge
//
//  Created by Rachel Schneebaum on 9/27/17.
//  Copyright © 2017 Rachel Schneebaum. All rights reserved.
//

import Foundation

protocol TextManipulator {
    func abbreviate(_ text: String) -> String
    func count(_ text: String) -> String
}


extension TextManipulator {

    func count(_ text: String) -> String {
        guard !text.isEmpty else { return "" }

        var vowelCount = 0
        var consonantCount = 0
        var numberCount = 0
        var punctuationCount = 0

        text.unicodeScalars.forEach {
            if CharacterType.vowels.contains($0) {
                vowelCount += 1
            } else if CharacterType.consonants.contains($0) {
                consonantCount += 1
            } else if CharacterType.numbers.contains($0) {
                numberCount += 1
            } else if CharacterType.punctuation.contains($0) {
                punctuationCount += 1
            }
        }

        let consonantString = consonantCount == 1 ? "\(consonantCount) consonant" : "\(consonantCount) consonants"
        let vowelString = vowelCount == 1 ? "\(vowelCount) vowel" : "\(vowelCount) vowels"
        let numberString = numberCount == 1 ? "\(numberCount) number" : "\(numberCount) numbers"
        let punctuationString = punctuationCount == 1 ? "\(punctuationCount) punctuation mark" : "\(punctuationCount) punctuation marks"

        return "\(consonantString), \(vowelString), \(numberString), \(punctuationString)"
    }

    func abbreviate(_ text: String) -> String {
        guard !text.isEmpty else { return "" }

        // first, separate string into array of words
        let words = text
            .components(separatedBy: " ")
            // make sure to trim whitespace from each word in case user entered more than one space in between
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }

        return words.joined()
    }

    private func abbreviateWord(_ word: String) -> String {
        // if word is too short to abbreviate, return without altering
        guard word.count > 2 else { return word }

        return word
    }
}


