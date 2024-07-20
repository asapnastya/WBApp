//
//  OTPFieldView.swift
//  WBApp
//
//  Created by Анастасия Романова on 7/18/24.
//

import SwiftUI

struct OTPFieldView: View {
    
    @Binding private var codeText: String
    @FocusState private var isCodeFocused: Bool
    
    private let codeLength: Int
    private let onCodeEntered: (String) -> Void
    
    init(
        codeText: Binding<String>,
        codeLength:Int,
        onCodeEntered: @escaping (String) -> Void
    ){
        self._codeText = codeText
        self.codeLength = codeLength
        self.onCodeEntered = onCodeEntered
    }
    
    var body: some View {
        HStack(spacing: 44){
            ForEach(
                .zero...codeLength - 1,
                id: \.self
            ){ index in
                Text("")
                    .modifier(
                        ConfirmationCodeTextBoxModifier(
                            confirmationCodeText: $codeText,
                            index: index
                        )
                    )
            }
        }
        .background(content: {
            TextField("", text: $codeText.limit(4))
                .frame(width: .zero, height: .zero)
                .keyboardType(.numberPad)
                .focused($isCodeFocused)
                .onChange(of: codeText) { newValue in
                    if newValue.count == codeLength {
                        onCodeEntered(newValue)
                    }
                }
                .onAppear {
                    isCodeFocused = true
                }
        })
    }
}

#Preview {
    OTPFieldView(codeText: .constant("11"), codeLength: 4) { value in
        
    }
}
