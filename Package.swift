//
//  Package.swift
//  ShoeCleaningApp
//
//  Created by Андрей Беседин on 17.01.2024.
//

import Foundation
dependencies: [
    .package(url: "https://github.com/stephencelis/SQLite.swift.git", from: "0.12.0")
],
targets: [
    .target(name: "YourApp", dependencies: ["SQLite"])
]
