//
//  DocumentValidator.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public protocol DocumentValidator {
    func validateLength(of documentNumber: String) -> DocumentLengthValidationStatus
    func validate(_ documentNumber: String) -> DocumentValidationStatus
    func format(document: String) -> String
}

public enum DocumentLengthValidationStatus {
    case empty, incomplete, valid, invalid
}
public enum DocumentValidationStatus {
    case empty, incomplete, valid, invalid
}
