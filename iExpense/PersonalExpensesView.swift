//
//  PersonalExpensesView.swift
//  iExpense
//
//  Created by Constantin Lisnic on 11/12/2024.
//

import SwiftData
import SwiftUI

struct PersonalExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]

    init(sortOrder: [SortDescriptor<Expense>]) {
        _expenses = Query(
            filter: #Predicate<Expense> { expense in
                expense.type == "Personal"
            }, sort: sortOrder)
    }

    var body: some View {
        ForEach(expenses) { expense in
            ExpenseItemView(
                name: expense.name, type: expense.type,
                amount: expense.amount)
        }
        .onDelete(perform: removeExpenses)
    }
    
    func removeExpenses(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]

            modelContext.delete(expense)
        }
    }
}

#Preview {
    PersonalExpensesView(sortOrder: [SortDescriptor(\Expense.name)])
}
