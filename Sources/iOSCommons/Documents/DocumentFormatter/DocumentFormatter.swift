//
//  DocumentFormatter.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public protocol DocumentFormatter: AnyObject {
    func format(_ documentNumber: String) -> String
}
