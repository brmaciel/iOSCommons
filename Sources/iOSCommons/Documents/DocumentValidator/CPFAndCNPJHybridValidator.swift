//
//  CPFAndCNPJHybridValidator.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public class CPFAndCNPJHybridValidator {

    // MARK: Properties
    let cpfValidator = CPFValidator()
    let cnpjValidator = CNPJValidator()
    let formatter = CPFAndCNPJHybridFormatter()


    // MARK: Constructor
    init() {}


    // MARK: - Methods
    
}

// MARK: - DocumentValidator implementation
extension CPFAndCNPJHybridValidator: DocumentValidator {
    public func validateLength(of documentNumber: String) -> DocumentLengthValidationStatus {
        if documentNumber.isEmpty { return .empty }
        
        if documentNumber.count <= formatter.cpfFormatter.numberOfDigits { return cpfValidator.validateLength(of: documentNumber) }
        
        return cnpjValidator.validateLength(of: documentNumber)
    }
    
    public func validate(_ documentNumber: String) -> DocumentValidationStatus {
        if documentNumber.isEmpty { return .empty }
        
        if documentNumber.count <= formatter.cpfFormatter.numberOfDigits { return cpfValidator.validate(documentNumber) }
        
        return cnpjValidator.validate(documentNumber)
    }
    
    public func format(document: String) -> String {
        return formatter.format(document)
    }
}
