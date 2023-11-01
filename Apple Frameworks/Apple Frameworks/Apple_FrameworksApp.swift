//
//  Apple_FrameworksApp.swift
//  Apple Frameworks
//
//  Created by Victor Campos on 31/10/23.
//

import SwiftUI

@main
struct Apple_FrameworksApp: App {
    var body: some Scene {
        WindowGroup {
            FrameworkGridView()
                .preferredColorScheme(.dark)
        }
    }
}
