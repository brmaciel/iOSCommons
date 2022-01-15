//
//  CPFFormatter.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public class CPFFormatter {

    // MARK: Properties
    let documentFormat = "___.___.___-__"
    let numberOfDigits = 11


    // MARK: Constructor
    init() {}
    
}

// MARK: - DocumentFormatter implementation
extension CPFFormatter: DocumentFormatter {
    public func format(_ documentNumber: String) -> String {
        let masker = Masker(characterToBeReplaced: "_")
        
        return masker.applyMask(documentFormat, to: documentNumber.onlyDigits, truncateExtraCharacters: true)
    }
}
