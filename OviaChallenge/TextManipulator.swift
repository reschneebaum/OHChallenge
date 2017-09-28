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
        // check that text isn't empty
        guard !text.isEmpty else { return "" }

        // start count for each type at 0
        var vowelCount = 0
        var consonantCount = 0
        var numberCount = 0
        var punctuationCount = 0

        // loop through unicode scalars (since CharacterSet.contains(_:) takes a unicode scalar)
        text.unicodeScalars.forEach {
            // add to count depending on character type (except white space)
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

        // build substring for each type (singular if count == 1; otherwise plural)
        let consonantString = consonantCount == 1 ? "\(consonantCount) consonant" : "\(consonantCount) consonants"
        let vowelString = vowelCount == 1 ? "\(vowelCount) vowel" : "\(vowelCount) vowels"
        let numberString = numberCount == 1 ? "\(numberCount) number" : "\(numberCount) numbers"
        let punctuationString = punctuationCount == 1 ? "\(punctuationCount) punctuation mark" : "\(punctuationCount) punctuation marks"

        // combine substrings
        return "\(consonantString), \(vowelString), \(numberString), \(punctuationString)"
    }

    func abbreviate(_ text: String) -> String {
        guard !text.isEmpty else { return "" }

        // first, separate string into array of words
        let words = text
            .components(separatedBy: " ")
            .map { component -> String in
                abbreviateWithPunctuation(component)
            }

        return words.joined(separator: " ")
    }

    // TODO: - doesn't handle front punctuation (e.g., quotation marks)
    private func abbreviateWithPunctuation(_ word: String) -> String {
        guard word.count > 2 else { return word }
        let count = word.count - 2

        var punctuation = ""
        var alpha = word
        
        for char in alpha.unicodeScalars.reversed() {
            if CharacterType.punctuation.contains(char) {
                punctuation.append(String(char))
                alpha = String(alpha.dropLast())
            } else {
                break
            }
        }

        // make sure there are enough characters after removing punctuation
        guard alpha.count > 2 else { return word }

        guard let first = alpha.first,
            let last = alpha.last else { return word }
        return "\(first)\(count)\(last)\(punctuation)"
    }
}

