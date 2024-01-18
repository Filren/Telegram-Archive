//
//  EmployeeStore.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//


import Foundation
import Combine

class EmployeeStore: ObservableObject {
    @Published var employees: [Employee] = []
    
    init() {
        self.employees = DatabaseManager.shared.getAllEmployeesFromDatabase()
    }
    
    func addEmployee(firstName: String, lastName: String, position: String) {
        let newEmployee = Employee(id: UUID().uuidString, firstName: firstName, lastName: lastName, position: position)
        employees.append(newEmployee)
        DatabaseManager.shared.addEmployeeToDatabase(employee: newEmployee)
    }
    
    func removeEmployee(at index: Int) {
        let removedEmployee = employees.remove(at: index)
        DatabaseManager.shared.removeEmployeeFromDatabase(employee: removedEmployee)
    }
}
