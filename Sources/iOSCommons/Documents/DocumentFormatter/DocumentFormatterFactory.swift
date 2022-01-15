//
//  DocumentFormatterFactory.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

/**
 Factory class that instantiates a DocumentFormatter class according to the documentType informed
 
 Based on FactoryMethod design pattern.
 */
public class DocumentFormatterFactory {
    
    public func create(ofType documentType: DocumentType) -> DocumentFormatter {
        switch documentType {
        case .cpf:
            return CPFFormatter()
        case .cnpj:
            return CNPJFormatter()
        case .hybridCPFandCNPJ:
            return CPFAndCNPJHybridFormatter()
        }
    }
}
