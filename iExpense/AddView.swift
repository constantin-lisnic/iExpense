//
//  AddView.swift
//  iExpense
//
//  Created by Constantin Lisnic on 25/11/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext

    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0

    let types = ["Personal", "Business"]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField(
                    "Amount", value: $amount,
                    format: .currency(
                        code: Locale.current.currency?.identifier ?? "USD")
                )
                .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let item = Expense(
                            name: name, type: type, amount: amount)

                        modelContext.insert(item)

                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AddView()
}
