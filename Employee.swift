//
//  Employee.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//

import Foundation
import SQLite

struct Employee: Identifiable {
    var id: String // Изменено тип id на String
    var firstName: String
    var lastName: String
    var position: String
}

// DatabaseManager.swift
class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let db: Connection
    
    private let employees = Table("employees")
    private let id = Expression<String>("id")
    private let firstName = Expression<String>("firstName")
    private let lastName = Expression<String>("lastName")
    private let position = Expression<String>("position")
    
    private init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            db = try Connection("\(path)/db.sqlite3")
            
            try db.run(employees.create { table in
                table.column(id, primaryKey: true)
                table.column(firstName)
                table.column(lastName)
                table.column(position)
            })
        } catch {
            print("Error initializing database: \(error)")
        }
    }
    
    func addEmployeeToDatabase(employee: Employee) {
        do {
            let insert = employees.insert(
                id <- employee.id,
                firstName <- employee.firstName,
                lastName <- employee.lastName,
                position <- employee.position
            )
            try db.run(insert)
        } catch {
            print("Error adding employee to database: \(error)")
        }
    }
    
    func removeEmployeeFromDatabase(employee: Employee) {
        do {
            let delete = employees.filter(id == employee.id)
            try db.run(delete.delete())
        } catch {
            print("Error removing employee from database: \(error)")
        }
    }
    
    func getAllEmployeesFromDatabase() -> [Employee] {
        do {
            let rows = try db.prepare(employees)
            return try rows.map { row in
                return Employee(
                    id: try row.get(id),
                    firstName: try row.get(firstName),
                    lastName: try row.get(lastName),
                    position: try row.get(position)
                )
            }
        } catch {
            print("Error fetching employees from database: \(error)")
            return []
        }
    }
}


