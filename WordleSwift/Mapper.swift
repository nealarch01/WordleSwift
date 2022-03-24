//
//  Mapper.swift
//  WordleSwift
//
//  Created by Neal Archival on 3/24/22.
//

import Foundation


func mapAllWords(word_list: Array<String>) -> Dictionary<String, Int> {
    var wordMap: Dictionary<String, Int> = [:]
    for _word in word_list {
        wordMap[_word] = 1
        // 1 represents it exists in the dictionary
        // goal is to be able to O(1) access a word in the dictionary
    }
    return wordMap
}
