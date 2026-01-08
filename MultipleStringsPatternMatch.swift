//
//  MultipleStringsPatternMatch.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 1/8/26.
//

import Foundation

/*
 Use two maps
 store character to string mapping in charMap map
 Store the string to character mapping in strMap map
 If the mapping is not consistent at any point then the pattern is not matching with the string. If no discrepency is found, then at the end of the string, true will be returned.
 if charArray length is not equal to str array length, then pattern not matching
 Space complexity - O(1) characters can;t be more than 26 while mapping.
 Time complexity -> O(n), length of the pattern string. We would have to iterate through these many no of times.
 */

class MultipleStringsPatternMatch {
    
    init() {
        /*
         Input - pattern = "abba", str = "dog cat cat dog"
         output- true
         
         Input - pattern = "abba", str = "dog cat cat fish"
         output - false //it doesn't match the pattern
         */
        let isPatternMatching = multipleStringsPatternMatch(pattern: "abba", str: "dog cat cat dog")
        print("is pattern matching \(isPatternMatching)")
    }
    
    func multipleStringsPatternMatch(pattern: String, str: String) -> Bool {
        
        let stringArray = str.components(separatedBy: " ")
        let charArray = Array(pattern)
        
        if (stringArray.count != charArray.count) {
            return false
        }
        print("string array \(stringArray)")
        print("char array \(charArray)")
        
        var charMap: [Character: String] = [:]
        var strMap: [String: Character] = [:]
        
        for i in 0..<charArray.count {
            //if the key and value are not present in any of the map then store the 2-way mapping in both maps
            if (charMap[charArray[i]] == nil && strMap[stringArray[i]] == nil) {
                charMap[charArray[i]] = stringArray[i]
                strMap[stringArray[i]] = charArray[i]
            } else if ((charMap[charArray[i]] != stringArray[i]) || (strMap[stringArray[i]] != charArray[i])){
                //If both or only 1 mapping is oresent then check if the mapping is consistent in both maps.. if not, return false
                return false
            }
        }
        return true
    }
}
