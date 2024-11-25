//
//  ExpemseItem.swift
//  iExpense
//
//  Created by Constantin Lisnic on 25/11/2024.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable, Codable, View {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)

                Text(type)
            }

            Spacer()

            Text(
                amount,
                format: .currency(
                    code: Locale.current.currency?.identifier ?? "USD"))
        }
    }
}
