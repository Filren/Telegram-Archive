//
//  ClientManager.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import Foundation
import SwiftUI
import Combine

class ClientManager: ObservableObject {
    @Published var customers: [Customer] = []
    @Published var employees: [Employee] = []
    
    // Метод для сохранения данных в UserDefaults
    func saveEmployeesData() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(employees) {
            UserDefaults.standard.set(encodedData, forKey: "employees")
        }
    }
    
    // Метод для загрузки данных из UserDefaults
    func loadEmployeesData() {
        if let data = UserDefaults.standard.data(forKey: "employees") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Employee].self, from: data) {
                employees = decodedData
            }
        }
    }
        
        
        // Метод для сохранения данных в UserDefaults
        func saveCustomersData() {
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(customers) {
                UserDefaults.standard.set(encodedData, forKey: "customers")
            }
        }
        
        // Метод для загрузки данных из UserDefaults
        func loadCustomersData() {
            if let data = UserDefaults.standard.data(forKey: "customers") {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode([Customer].self, from: data) {
                    customers = decodedData
                }
            }
        }
}
