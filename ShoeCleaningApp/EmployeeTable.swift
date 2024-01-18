//
//  EmployeeTable.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 16.01.2024.
//


import SQLite

struct EmployeeTable {
    static let employees = Table("employees")
    static let id = Expression<Int64>("id") // Changed the type to Int64
    static let firstName = Expression<String>("firstName")
    static let lastName = Expression<String>("lastName")
    static let position = Expression<String>("position")

    static func create() -> TableBuilder {
        return employees.create { table in
            table.column(id, primaryKey: .autoincrement) // Set primaryKey to .autoincrement
            table.column(firstName)
            table.column(lastName)
            table.column(position)
        }
    }
}
