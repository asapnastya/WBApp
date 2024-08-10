//
//  CatFactsView.swift
//  WBApp
//
//  Created by Анастасия Романова on 8/9/24.
//

import SwiftUI

struct CatFactsView: View {
    
    @State private var catFactsModel: CatFactsModel = .init()
    
    var body: some View {
        VStack {
            switch catFactsModel.facts?.data {
            case .some(let data):
                List(data, id: \.self) { fact in
                    Text(fact)
                }
            case .none:
                ProgressView()
            }
        }
        .onAppear {
            catFactsModel.loadFacts { data, error in
                if let data = data {
                    catFactsModel.facts = data
                } else {
                    print("\(error?.localizedDescription ?? .unknownErrorTitle)")
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CatFactsView()
}
