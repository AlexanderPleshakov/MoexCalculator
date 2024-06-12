//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Александр Плешаков on 12.06.2024.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: CalculatorViewModel
    
    var body: some View {
        List {
            
            CurrencyInputView(
                currency: viewModel.topCurrency,
                amount: viewModel.topAmount,
                calculator: viewModel.setTopAmount)
            
            CurrencyInputView(
                currency: viewModel.bottomCurrency,
                amount: viewModel.bottomAmount,
                calculator: viewModel.setBottomAmount)
            
            
        } // List
    } // body
}

#Preview {
    CalculatorView(viewModel: CalculatorViewModel())
}
