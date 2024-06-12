//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Александр Плешаков on 11.06.2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    @StateObject var viewModel = CalculatorViewModel()
    var body: some Scene {
        WindowGroup{
            MainView()
                .environmentObject(viewModel)
        }
    }
}
