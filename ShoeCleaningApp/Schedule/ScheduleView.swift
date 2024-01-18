//
// MyScheduleView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

struct MyScheduleView: View {
    @EnvironmentObject var clientManager: ClientManager

    var body: some View {
        VStack {
            Text("Расписание")
                .font(.title)
                .padding()

            // Используйте данные о клиентах из clientManager.customers
            List {
                ForEach(clientManager.customers) { customer in
                    // Отображение данных о телефоне и услугах клиента в расписании
                    VStack(alignment: .leading) {
                        Text("Номер заказа: \(customer.phone)")
                        Text("Услуги: \(customer.services.joined(separator: ", "))")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
