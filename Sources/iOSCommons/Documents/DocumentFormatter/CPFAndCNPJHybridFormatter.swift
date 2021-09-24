//
//  CPFAndCNPJHybridFormatter.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

class CPFAndCNPJHybridFormatter {

    // MARK: Properties
    let cpfFormatter = CPFFormatter()
    let cnpjFormatter = CNPJFormatter()


    // MARK: Constructor
    init() {}
    
}

// MARK: - DocumentFormatter implementation
extension CPFAndCNPJHybridFormatter: DocumentFormatter {
    public func format(_ documentNumber: String) -> String {
        let formatter: DocumentFormatter = (documentNumber.count <= cpfFormatter.numberOfDigits) ? cpfFormatter : cnpjFormatter
        return formatter.format(documentNumber)
    }
}
