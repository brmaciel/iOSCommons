//
//  CPFValidator.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public class CPFValidator {

    // MARK: Properties
    let formatter = CPFFormatter()


    // MARK: Constructor
    init() {}


    // MARK: - Methods

}

// MARK: - DocumentValidator implementation
extension CPFValidator: DocumentValidator {
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
        
        return validateCpf(documentNumber) ? .valid : .invalid
    }
    
    public func format(document: String) -> String {
        return formatter.format(document)
    }
}

// MARK: - CPF Validation flow
extension CPFValidator {
    private func validateCpf(_ informedCpf: String) -> Bool {
        // Check if has 11 digits only
        guard
            informedCpf.count == formatter.numberOfDigits,
            informedCpf.count == informedCpf.onlyDigits.count
            else { return false }
        
        // Check if digits are not all equal
        guard !informedCpf.charactersAreAllEqual else { return false }
        
        guard var digitsArray = informedCpf.map({ Int(String($0)) }) as? [Int] else { return false }
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
     Computes the first validation digit from a CPF document number
     
     ~~~
     // Validation logic
     let cpf = "123.456.789-92"
     // 1  2 3 4 5 6 7 8 9 (cpf)
     // 10 9 8 7 6 5 4 3 2 (multipliers)
     // 10 18 24 28 30 30 29 24 18 (multiplication result)
     // 211                 (sum of multiplication result)
     // 211 * 10 = 2110 % 11 = 9 (validation digit)
     // if previous validation digit is = 10, it would be replaced by 0
     ~~~
     */
    private func computeFirstValidationDigit(from digitsArray: [Int]) -> Int {
        var multiplier = 11
        let sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        var validationDigit = sumDigits * 10 % 11
        if validationDigit >= 10 { validationDigit = 0 }
        
        return validationDigit
    }
    
    /**
     Computes the second validation digit from a CPF document number
     
     ~~~
     // Validation logic
     let cpf = "123.456.789-92"
     // 1  2  3 4 5 6 7 8 9 9 (cpf)
     // 11 10 9 8 7 6 5 4 3 2 (multipliers)
     // 11 20 27 32 35 36 35 32 27 18 (multiplication result)
     // 273                    (sum of multiplication result)
     // 273 * 10 = 2730 % 11 = 2 (validation digit)
     // if previous validation digit is = 10, it would be replaced by 0
     ~~~
     */
    private func computeSecondValidationDigit(from digitsArray: [Int]) -> Int {
        var multiplier = 12
        let sumDigits = digitsArray.reduce(0) {
            multiplier -= 1
            return $0 + $1 * multiplier
        }
        var validationDigit = sumDigits * 10 % 11
        if validationDigit >= 10 { validationDigit = 0 }
        
        return validationDigit
    }
}
