//
//  CNPJValidator.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public class CNPJValidator {

    // MARK: Properties
    let formatter = CNPJFormatter()


    // MARK: Constructor
    init() {}


    // MARK: - Methods
    
}

// MARK: - DocumentValidator implementation
extension CNPJValidator: DocumentValidator {
    public func validateLength(of documentNumber: String) -> DocumentLengthValidationStatus {
        if documentNumber.isEmpty { return .empty }
        if documentNumber.count < formatter.numberOfDigits { return .incomplete }
        if documentNumber.count > formatter.numberOfDigits { return .invalid }
        
        return .valid
    }
    
    public func validate(_ documentNumber: String) -> DocumentValidationStatus {
        if documentNumber.isEmpty { return .empty }
        
        guard documentNumber.count == documentNumber.onlyDigits.count else { return .invalid }
        
        if documentNumber.count < formatter.numberOfDigits { return .incomplete }
        if documentNumber.count > formatter.numberOfDigits { return .invalid }
        
        return validateCnpj(documentNumber) ? .valid : .invalid
    }
    
    public func format(document: String) -> String {
        return formatter.format(document)
    }
}

// MARK: - CNPJ Validation flow
extension CNPJValidator {
    private func validateCnpj(_ informedCnpj: String) -> Bool {
        // Check if has 14 digits only
        guard
            informedCnpj.count == formatter.numberOfDigits,
            informedCnpj.count == informedCnpj.onlyDigits.count
            else { return false }
        
        // Check if digits are not all equal
        guard !informedCnpj.charactersAreAllEqual else { return false }
        
        var digitsArray: [Int] = informedCnpj.map { Int(String($0))! }
        let digit2 = digitsArray.removeLast()
        let digit1 = digitsArray.removeLast()
        
        
        // First digit validation
        let expectedFirstDigit = computeFirstValidationDigit(from: digitsArray)
        guard expectedFirstDigit == digit1 else { return false }
        
        // Second digit validation
        digitsArray.append(digit1)
        let expectedSecondDigit = computeSecondValidationDigit(from: digitsArray)
        guard expectedSecondDigit == digit2 else { return false }
        
        return true
    }
    
    /**
     Computes the first validation digit from a CNPJ document number
     
     ~~~
     // Validation logic
     let cnpj = "87.473.719/0001-28"
     // 8 7 4 7 3 7 1 9 0 0 0 1  (cpf)
     // 5 4 3 2 9 8 7 6 5 4 3 2 (multipliers)
     // 40 28 12 14 27 56 7 54 0 0 0 2 (multiplication result)
     // 240                 (sum of multiplication result)
     // 11 - (240 % 11) = 2 (validation digit)
     // if previous validation digit is >= 10, it would be replaced by 0
     ~~~
     */
    private func computeFirstValidationDigit(from digitsArray: [Int]) -> Int {
        let multipliers = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        
        var sumDigits = 0
        for (number, multiplier) in zip(digitsArray, multipliers) {
            sumDigits += number * multiplier
        }
        var validationDigit = 11 - (sumDigits % 11)
        if validationDigit >= 10 { validationDigit = 0 }
        
        return validationDigit
    }
    
    /**
     Computes the second validation digit from a CNPJ document number
     
     ~~~
     // Validation logic
     let cnpj = "87.473.719/0001-28"
     // 8 7 4 7 3 7 1 9 0 0 0 1 2  (cpf)
     // 6 5 4 3 2 9 8 7 6 5 4 3 2 (multipliers)
     // 48 35 16 21 6 63 8 63 0 0 0 3 4 (multiplication result)
     // 267                 (sum of multiplication result)
     // 11 - (267 % 11) = 8 (validation digit)
     // if previous validation digit is >= 10, it would be replaced by 0
     ~~~
     */
    private func computeSecondValidationDigit(from digitsArray: [Int]) -> Int {
        let multipliers = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
        
        var sumDigits = 0
        for (number, multiplier) in zip(digitsArray, multipliers) {
            sumDigits += number * multiplier
        }
        var validationDigit = 11 - (sumDigits % 11)
        if validationDigit >= 10 { validationDigit = 0 }
        
        return validationDigit
    }
}
