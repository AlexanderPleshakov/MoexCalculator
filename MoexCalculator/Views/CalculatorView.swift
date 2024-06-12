//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Александр Плешаков on 12.06.2024.
//

import SwiftUI

struct CalculatorView: View {
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State var pickerIsPresented = false
    
    var body: some View {
        List {
            
            CurrencyInputView(
                currency: viewModel.topCurrency,
                amount: viewModel.topAmount,
                calculator: viewModel.setTopAmount,
                tapHandler: { pickerIsPresented.toggle() }
            )
            
            CurrencyInputView(
                currency: viewModel.bottomCurrency,
                amount: viewModel.bottomAmount,
                calculator: viewModel.setBottomAmount,
                tapHandler: { pickerIsPresented.toggle() }
            )
            
        } // List
        .foregroundStyle(.tint)
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $pickerIsPresented) {
            VStack(spacing: 16) {
                Spacer()
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(.secondary)
                    .frame(width: 60, height: 6)
                    .onTapGesture {
                        pickerIsPresented = false
                    }
                
                HStack {
                    CurrencyPickerView(currency: $viewModel.topCurrency) { _ in
                        didChangeTopCurrency()
                    }
                    
                    CurrencyPickerView(currency: $viewModel.bottomCurrency) { _ in
                        didChangeBottomCurrency()
                    }
                }
            } // VStack
            .presentationDetents([.fraction(0.3)])
            
        } // sheet
        
    } // body
    
    private func didChangeTopCurrency() {
        viewModel.updateTopAmount()
    }
    
    private func didChangeBottomCurrency() {
        viewModel.updateBottomAmount()
    }
}

#Preview {
    CalculatorView()
        .environmentObject(CalculatorViewModel())
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
