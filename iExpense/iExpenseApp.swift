//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Constantin Lisnic on 25/11/2024.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
