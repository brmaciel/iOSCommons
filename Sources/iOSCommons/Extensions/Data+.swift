//
//  Data+.swift
//  
//
//  Created by Bruno Maciel on 9/20/21.
//

import Foundation

public extension Data {
    func printContent(encoding: String.Encoding = .utf8) {
        print(String(data: self, encoding: encoding) ?? "unable to convert data to string")
    }
}
