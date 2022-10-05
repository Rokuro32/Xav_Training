//
//  Xav_trainingApp.swift
//  Xav_training
//
//  Created by Steve Begin on 2022-09-28.
//

import SwiftUI

@main
struct Xav_trainingApp: App {
    
    let vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
