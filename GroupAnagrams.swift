//
//  GroupAnagrams.swift
//  DSA-Practice
//
//  Created by Paridhi Malviya on 1/3/26.
//

//Same characters with same frequence but the order can be jumbeled
class GroupAnagrams {
    
    init() {
        
        groupAnagrams()
    }
    
    /*
     In hash map, hashing is done for strings which are stored as keys. Under the hood, hashing can use multiple techniques
     1. naive approach - perform operations on ascii values for chars. However, bat, abt, tab will have the same value. And other uncountable no of strings will also have the same value.
     2. assign prime numbers to all characters. a - 3, b - 7, t - 11. Then only the anagrams will have the same value. We don't need to sort the strings in this case, thus can eliminate O(n logn) time complexity.
     It will be only O(log n) time complexity.
     In hashmap, strings are also hashed using the same way we hash strings using "frequency, position and character"
     can associate prime numbers with characters
     contains() function also uses O(n) time complexity
     */
    func groupAnagrams() {
        
        let input = ["bat", "ant", "abt", "aet", "eat", "nat"]
        
        //fist sort all element s and then add into the values array for a particular group.
        // //create a global map. Keep distinct sorted values of all strings as key and add an element in value array
        var map = [String: [String]]()
        
        for i in 0..<input.count {
            let str = input[i]
            //O(nLogn)
            let sortedStr = String(str.sorted(by: <))
            if (map[sortedStr] != nil) {
                //means a key with these exact no of characters already exist in the map. So add the actual string in it's value's array
                map[sortedStr]?.append(str)
            } else {
                //if it doesn't exist then add this entry in value's array
                map[sortedStr] = [str]
            }
        }
        //print all groups
        for value in map.values {
            print("value ** \(value)")
        }
    }
    
    
    //Space complexity - O(nk) -> n - no of words, k - length of each word. Hash map is taking the space
    func GroupanagramsUsingPrimeProduct(str: String) {
        var map = [Int: [String]] ()
        let input = ["bat", "ant", "abt", "aet", "eat", "nat"]
        for i in 0..<input.count {
            let primeProductOfStr = primeProduct(str: input[i])
            if (map[primeProductOfStr] != nil) {
                map[primeProductOfStr]?.append(input[i])
            } else {
                map[primeProductOfStr] = [input[i]]
            }
        }
        for value in map.values {
            print("value is \(value)")
        }
    }
    
    private func primeProduct(str: String) -> Int {
        let prime: [Int] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 103]
        
        var result = 1
        for i in 0..<str.count {
            let ch = str[str.index(str.startIndex, offsetBy: i)]
            let asciiOfa = "a".unicodeScalars.first!.value % 265
            let asciiOfCh = ch.unicodeScalars.first!.value % 256
            let index = asciiOfa - asciiOfCh
            result = result * prime[Int(index)]
        }
        return result
    }
}
