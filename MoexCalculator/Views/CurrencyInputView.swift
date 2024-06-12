//
//  CurrencyInputView.swift
//  MoexCalculator
//
//  Created by Александр Плешаков on 12.06.2024.
//

import SwiftUI

struct CurrencyInputView: View {
    let currency: Currency
    let amount: Double
    let calculator: (Double) -> ()
    let tapHandler: () -> Void
    
    var body: some View {
        HStack {
            
            VStack {
                Text(currency.flag)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                Text(currency.rawValue)
                    .font(.title2)
            }
            .frame(height: 100)
            .onTapGesture(perform: tapHandler)
            
            let topBinding = Binding<Double>(
                get: {
                    amount
                },
                set: {
                    calculator($0)
                }
            )
            
            TextField("", value: topBinding, formatter: numberFormatter)
                .font(.largeTitle)
                .multilineTextAlignment(.trailing)
                .minimumScaleFactor(0.5)
                .keyboardType(.numberPad)
            
        } // HStack
    }
    
    var numberFormatter: NumberFormatter = {
        var nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.usesGroupingSeparator = false
        nf.maximumFractionDigits = 2
        return nf
    }()
}

#Preview {
    CurrencyInputView(currency: .RUR,
                      amount: 100,
                      calculator: { _ in },
                      tapHandler: {})
}
