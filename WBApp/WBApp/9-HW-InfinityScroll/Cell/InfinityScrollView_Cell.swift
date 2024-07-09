//
//  InfinityScrollView_Cell.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/7/24.
//

import SwiftUI

// MARK: - InfinityScrollView_Cell
struct InfinityScrollView_Cell: View {
    
    let configuration: InfinityScrollView_LayoutConfiguration
    
    private let randomEmoji: String = {
        let emojiRange = 0x1F300...0x1F3F0
        let randomValue = Int.random(in: emojiRange)
        
        if let unicodeScalar = UnicodeScalar(randomValue) {
            return String(unicodeScalar)
        } else {
            return "🐈‍⬛"
        }
    }()
    
    var body: some View {
        ZStack {
            VStack {
                switch configuration {
                case .left:
                    leftConfiguration
                    
                case .right:
                    rightConfiguration
                    
                case .top:
                    topConfiguration
                    
                case .bottom:
                    bottomConfiguration
                }
            }
            Text(randomEmoji)
                .opacity(0.5)
                .font(.system(size: 150))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 300)
    }
}

// MARK: - Configurations
extension InfinityScrollView_Cell {
    
    private var leftConfiguration: some View {
        HStack {
            roundedShape
            VStack {
                roundedShape
                roundedShape
            }
        }
    }
    
    private var rightConfiguration: some View {
        HStack {
            VStack {
                roundedShape
                roundedShape
            }
            roundedShape
        }
    }
    
    private var topConfiguration: some View {
        VStack {
            roundedShape
            HStack {
                roundedShape
                roundedShape
            }
        }
    }
    
    private var bottomConfiguration: some View {
        VStack {
            HStack {
                roundedShape
                roundedShape
            }
            roundedShape
        }
    }
}

// MARK: - RoundedShape
extension InfinityScrollView_Cell {
    
    private var roundedShape: some View {
        RoundedRectangle(
            cornerRadius: 30
        )
        .strokeBorder(
            style: StrokeStyle(
                lineWidth: 2,
                dash: [10, 5]
            )
        )
    }
}

#Preview {
    InfinityScrollView_Cell(configuration: .right)
}

