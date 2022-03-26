//
//  Mapper.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/24/22.
//
import Foundation

// purpose of function is to mapp all the words into a map for fast look up (if user's words are valid)
func mapAllWords(word_list: Array<String>) -> Dictionary<String, Int> {
    var wordMap: Dictionary<String, Int> = [:]
    for _word in word_list {
        wordMap[_word.uppercased()] = 1 // turn the word into an upper cased character
    }
    return wordMap
}
