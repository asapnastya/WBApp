//
//  CatFactsModel.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/10/24.
//

import SwiftUI
import MeowFactsAPI

struct CatFactsModel {
    
    var facts: Fact?
    
    mutating func loadFacts(complete: @escaping (_ data: Fact?, _ error: Error?) -> Void) {
        PublicAPI.defaultRoot(
            count: 10,
            lang: .rus
        ){ data, error in
            complete(data, error)
        }
    }
}
