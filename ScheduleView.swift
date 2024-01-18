//
// MyScheduleView.swift
// ShoeCleaningApp
//
// Created by Андрей Беседин on 16.01.2024.
//

import SwiftUI

struct MyScheduleView: View {
    var body: some View {
        VStack {
            Text("Расписание")
                .font(.title)
                .padding()

            // Добавьте код для отображения расписания или других элементов, связанных с расписанием
            Text("Здесь будет расписание")

            Spacer()
        }
        .navigationBarTitle("Мое расписание", displayMode: .inline)
    }
}
