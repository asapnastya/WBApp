//
//  InfinityScrollView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/7/24.
//

import SwiftUI

struct InfinityScrollView: View {
    
    @State private var itemIds = Array(0...30)
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(itemIds, id: \.self) { item in
                    InfinityScrollView_Cell(
                        configuration: .chooseRandomConfiguration()
                    )
                    .padding()
                    .onAppear {
                        if item == itemIds.last {
                            loadMore()
                        }
                    }
                }
            }
            .padding(.horizontal, 32)
        }
    }
    
    private func loadMore() {
        let newItems = itemIds.count...itemIds.count + 30
        
        itemIds.append(contentsOf: newItems)
    }
}

#Preview {
    InfinityScrollView()
}
