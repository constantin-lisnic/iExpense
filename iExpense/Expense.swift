//
//  Expense.swift
//  iExpense
//
//  Created by Constantin Lisnic on 11/12/2024.
//

import Foundation
import SwiftData

@Model
class Expense {
    var name: String
    var type: String
    var amount: Double

    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
