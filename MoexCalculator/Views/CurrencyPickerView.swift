//
//  CurrencyPickerView.swift
//  MoexCalculator
//
//  Created by Александр Плешаков on 12.06.2024.
//

import SwiftUI

struct CurrencyPickerView: View {

    @Binding var currency: Currency
    
    let onChange: (Currency) -> Void
    
    var body: some View {
        
        Picker("", selection: $currency) {
                        
            ForEach(Currency.allCases) { currency in
                Text(currency.rawValue.uppercased())
            }
        }
        .pickerStyle(.wheel)
        //.onChange(of: currency, perform: onChange)
        .onChange(of: currency) { oldValue, newValue in
            onChange(newValue)
        }
    }
}

// Структура, которая определяет отображение компонента в панели preview
struct CurrencyPicker_Previews: PreviewProvider {
    
    static let currencyBinding = Binding<Currency>(
        get: { .RUR },
        set: { _ = $0 }
    )
    
    static var previews: some View {
        CurrencyPickerView(currency: currencyBinding, onChange: { _ in })
    }
}
