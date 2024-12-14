//
//  ExpenseItemView.swift
//  iExpense
//
//  Created by Constantin Lisnic on 11/12/2024.
//

import SwiftUI

struct ExpenseItemView: View {
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

#Preview {
    ExpenseItemView(name: "Cheese", type: "Personal", amount: 20.5)
}
