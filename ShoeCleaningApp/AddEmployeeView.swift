//
//  AddEmployeeView.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

struct AddEmployeeView: View {
    @ObservedObject var employeeStore: EmployeeStore
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var position = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Информация о сотруднике")) {
                    TextField("Имя", text: $firstName)
                    TextField("Фамилия", text: $lastName)
                    TextField("Должность", text: $position)
                }

                Section {
                    Button("Добавить") {
                        addEmployee()
                    }
                }
            }
            .navigationBarTitle("Добавить сотрудника", displayMode: .inline)
            .navigationBarItems(trailing: Button("Отмена") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func addEmployee() {
        guard !firstName.isEmpty, !lastName.isEmpty, !position.isEmpty else {
            // Возможно, добавить алерт для уведомления пользователя о незаполненных полях
            return
        }

        employeeStore.addEmployee(firstName: firstName, lastName: lastName, position: position)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddEmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmployeeView(employeeStore: EmployeeStore())
    }
}
