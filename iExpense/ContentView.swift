//
//  ContentView.swift
//  iExpense
//
//  Created by Constantin Lisnic on 25/11/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var showAddNewExpense: Bool = false
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount),
    ]
    @State private var filterOption = "All"

    var body: some View {
        NavigationStack {
            List {
                switch filterOption {
                case "Personal":
                    Section("Personal") {
                        PersonalExpensesView(sortOrder: sortOrder)
                    }

                case "Business":

                    Section("Business") {
                        BusinessExpensesView(sortOrder: sortOrder)
                    }

                default:
                    Section("Personal") {
                        PersonalExpensesView(sortOrder: sortOrder)
                    }

                    Section("Business") {
                        BusinessExpensesView(sortOrder: sortOrder)
                    }
                }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                NavigationLink {
                    AddView()
                } label: {
                    Button("Add Expense", systemImage: "plus") {
                        showAddNewExpense = true
                    }
                }

                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount),
                            ])

                        Text("Sort by amount")
                            .tag([
                                SortDescriptor(\Expense.amount),
                                SortDescriptor(\Expense.name),
                            ])
                    }
                }

                Menu("Filter", systemImage: "line.3.horizontal.decrease") {
                    Picker("Filter", selection: $filterOption) {
                        Text("Show All")
                            .tag("All")
                        Text("Show Personal")
                            .tag("Personal")
                        Text("Show Business")
                            .tag("Business")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
