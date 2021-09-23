//
//  Masker.swift
//  
//
//  Created by Bruno Maciel on 10/12/20.
//

import Foundation

class Masker {

    // MARK: Properties
    var characterToBeReplaced: Character


    // MARK: Constructor
    init(characterToBeReplaced: Character) {
        self.characterToBeReplaced = characterToBeReplaced
    }


    // MARK: - Methods
    
    /**
     Formart `string` according to the `mask` informed.
     
     - Parameters:
        - mask: Mask to be applied to the `string`.
        - string: String to be formatted as the `mask`.
        - truncateExtraCharacters: When string has a size greater than expected by the mask, if this parameter is set to `true`, it will apply the mask and will ignore any extra character in the string. If `false`, it will apply the mask to the string and append the extra characters in the end of the formatted string
     
     ~~~
     // Example:
     let masker = Masker(characterToBeReplaced: "_")
     masker.applyMask(___.___, to: "1234567", truncateExtraChracters: true)
     // returns "123.456"
     masker.applyMask(___.___, to: "1234567", truncateExtraChracters: false)
     // returns "123.4567"
     ~~~
     */
    func applyMask(_ mask: String, to string: String, truncateExtraCharacters: Bool = false) -> String {
        var maskedString = string
        
        for (i, char) in mask.enumerated() where char != characterToBeReplaced {
            try? maskedString.insert(String(char), at: i)
        }
        
        if truncateExtraCharacters {
            maskedString = String(maskedString.prefix(mask.count))
        }
        
        return maskedString
    }
}
