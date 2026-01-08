//
//  IsomorphicStrings.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 1/3/26.
//

/*
 use map to keep track of characters mapping. because it's search complexcity is O(1)
 In space complexity analysis- we always consider the auxilliary space / computational space.
 auxilliary / computational space -> the space created for computational purposes.
 eg if you are given 2 input strings- will those be considered as extra spaxe. No, the input is not considered as extra space. The same will output. Input and output are not considered as auxilliary space.
 space complexity includes - extra data structure that is maintained for computational purpose.
 
 In isomorphic strings problems - 2 hash maps can be used to maintain the characters mapping. Even if I have a string of 1000 charcaters which has all small letters.
 then the maximum entries in the hash map would be 26 which is constant.
 space complexity will be O(n)- if the space needed is increasing with the size of the input. But in chars, it wouldn't increase beyond 26 charas.
 Even if we are maintaining 2 maps - 1 map can have 26 characters and other map also, 26 characters. Not more than these. Hence, O(1) space complexity.
 When we want to search - use hashing based data structure (for optimal search capability)
 
 Time complexity -  depends on the lenght of strings. We will go oer all characters of the string
 */

class IsomorphicStrings {
    
    init() {
        let isIsomorphic = isIsomorphicStrings(s: "egg", t: "add")
        print("isIsomorphic \(isIsomorphic)")
        
        let isIso = isIsomorphicStringsSolutionUsingAscii(s: "eggb", t: "adde")
        print("isIso \(isIso)")
    }
    
    //egg -add
    func isIsomorphicStrings(s: String, t: String) -> Bool {
        let sLength = s.count
        let tLength = t.count
        
        if (sLength != tLength) {
            //not an isomorphic string
            return false
        }
        
        var sMap = [Character: Character]()
        var tMap = [Character: Character]()
        for i in 0..<sLength {
            
            let sChar: Character = s[s.index(s.startIndex, offsetBy: i)]
            print("sChar \(sChar) *** i \(i)")
            let tChar = t[t.index(t.startIndex, offsetBy: i)]
            print("tChar: \(tChar) *** i \(i)")
            if (sMap[sChar] != nil) {
                if (sMap[sChar] != tChar) {
                    //breach in isomorphibility
                    return false
                }
            } else {
                sMap[sChar] = tChar
            }
            if (tMap[tChar] !=  nil) {
                if (tMap[tChar] != sChar) {
                    return false
                }
            } else {
                tMap[tChar] = sChar
             }
        }
        return true
    }
    
    func isIsomorphicStringsSolutionUsingAscii(s: String, t: String) -> Bool {
        let sL = s.count
        let tL = t.count
        // If lengths are not equal, return false
        if sL != tL { return false }

        // Use last-seen position arrays for ASCII (0..255). Initialize with 0 meaning unseen.
        var sLast = Array(repeating: 0, count: 256)
        var tLast = Array(repeating: 0, count: 256)

        // Iterate over characters by index
        for i in 0..<sL {
            let sIndex = s.index(s.startIndex, offsetBy: i)
            let tIndex = t.index(t.startIndex, offsetBy: i)
            let sChar = s[sIndex]
            let tChar = t[tIndex]

            // Convert Character to ASCII code point (UInt8) safely; if non-ASCII, fall back to unicodeScalar value modulo 256
            let sCode = Int(sChar.unicodeScalars.first!.value % 256)
            let tCode = Int(tChar.unicodeScalars.first!.value % 256)
            
            print("sChar unicode scalars *** \(sChar.unicodeScalars) *** \(sChar.unicodeScalars.count) *** \(sChar.unicodeScalars.first!.value)")
            print("tChar unicode scalars *** \(tChar.unicodeScalars) *** \(tChar.unicodeScalars.count) *** \(tChar.unicodeScalars.first!.value)")
            print("ASCII *** \(sCode) **** \(tCode)")

            // We store i+1 to distinguish unseen (0) from position 0
            if sLast[sCode] != tLast[tCode] {
                return false
            }
            sLast[sCode] = i + 1
            tLast[tCode] = i + 1
        }
        return true
    }
    
    //third solution: Using a set
    
}
