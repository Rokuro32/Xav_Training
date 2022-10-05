//
//  ViewModel.swift
//  Xav_training
//
//  Created by Steve Begin on 2022-09-28.
//

import Foundation
import SwiftUI




class ViewModel: ObservableObject {
    
    init() { }
    
    @Published var color: Color = .gray
    @Published var image: NSImage?
    @Published var filename = "Filename"
    
    private let imageCache = NSCache<AnyObject, AnyObject>()
    
    
    func generateRandomColor() {
        color = Color.random
        print("Generating random color")
        
    }
    
    func loadImage() {
        
        let panel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = false
        if panel.runModal() == .OK {
            if let lien = panel.url{
                let imageJ = NSImage(contentsOf: lien)
                image = imageJ
            }
            else{
                image = NSImage(named:"Capture d’écran, le 2022-11-06 à 12.16.10")
            }
        }
    }
}

extension Color{
    static var random:Color{
        let redHue = Double.random(in: 0..<1)
        let greenHue = Double.random(in: 0..<1)
        let blueHue = Double.random(in: 0..<1)
        return Color(red: redHue, green: greenHue, blue: blueHue)
    }
}
