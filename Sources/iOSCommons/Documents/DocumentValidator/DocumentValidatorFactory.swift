//
//  DocumentValidatorFactory.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

/**
 Factory class that instantiates a DocumentValidator class according to the documentType informed
 
 Based on FactoryMethod design pattern.
 */
public class DocumentValidatorFactory {
    
    public func create(ofType documentType: DocumentType) -> DocumentValidator {
        switch documentType {
        case .cpf:
            return CPFValidator()
        case .cnpj:
            return CNPJValidator()
        case .hybridCPFandCNPJ:
            return CPFAndCNPJHybridValidator()
        }
    }
}
