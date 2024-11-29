//
//  ContentView.swift
//  iExpense
//
//  Created by Constantin Lisnic on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showAddNewExpense: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter { $0.type == "Personal" }) {
                        item in
                        item
                    }
                    .onDelete { offsets in
                        removeItems(for: "Personal", at: offsets)
                    }
                }

                Section("Business") {
                    ForEach(expenses.items.filter { $0.type == "Business" }) {
                        item in
                        item
                    }
                    .onDelete { offsets in
                        removeItems(for: "Business", at: offsets)
                    }
                }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                NavigationLink {
                    AddView(expenses: expenses)
                } label: {
                    Button("Add Expense", systemImage: "plus") {
                        showAddNewExpense = true
                    }
                }
            }
        }
    }

    func removeItems(for type: String, at offsets: IndexSet) {
        // Filter and identify indices to delete
        let filteredItems = expenses.items.enumerated().filter {
            $0.element.type == type
        }
        let indicesToRemove = offsets.map { filteredItems[$0].offset }

        // Remove items at those indices in reverse to prevent index shifting
        for index in indicesToRemove.sorted(by: >) {
            expenses.items.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
