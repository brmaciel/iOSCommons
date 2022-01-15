//
//  CNPJFormatter.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public class CNPJFormatter {

    // MARK: Properties
    let documentFormat = "__.___.___/____-__"
    let numberOfDigits = 14


    // MARK: Constructor
    init() {}
    
}

// MARK: - DocumentFormatter implementation
extension CNPJFormatter: DocumentFormatter {
    public func format(_ documentNumber: String) -> String {
        let masker = Masker(characterToBeReplaced: "_")
        
        return masker.applyMask(documentFormat, to: documentNumber.onlyDigits, truncateExtraCharacters: true)
    }
}
