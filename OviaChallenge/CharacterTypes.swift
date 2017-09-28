//
//  CharacterTypes.swift
//  OviaChallenge
//
//  Created by Rachel Schneebaum on 9/27/17.
//  Copyright © 2017 Rachel Schneebaum. All rights reserved.
//

import Foundation

enum CharacterType {

    /*
     includes a,e,i,o,u, lowercase and uppercase
     */
    static var vowels: CharacterSet {
        return CharacterSet(charactersIn: "aeiouAEIOU")
    }

    /*
     includes all members of CharacterSet.letters that are NOT in CharacterSet.vowels
     */
    static var consonants: CharacterSet {
        return vowels.inverted.intersection(.letters)
    }

    static var punctuation: CharacterSet {
        return CharacterSet.punctuationCharacters
    }

    static var numbers: CharacterSet {
        return CharacterSet.decimalDigits
    }
}
