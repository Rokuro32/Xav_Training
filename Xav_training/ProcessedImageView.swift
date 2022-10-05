//
//  ProcessedImageView.swift
//  Xav_training
//
//  Created by Steve Begin on 2022-09-28.
//

import SwiftUI


struct ProcessedImageView: View {
    let color: Color
    let image: NSImage?
    
    @State private var mixingValue: CGFloat = 0.5

    var body: some View {
        VStack {
            if image != nil{
                ZStack{
                    Image(nsImage: image!)
                        .resizable()
                        .scaledToFit()
                    Image(nsImage: image!)
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(color.opacity(mixingValue))
                }
                .frame(width: 500, height: 500)
                .clipped()
                
                
                Slider(
                    value: $mixingValue) {
                        Text("Mix")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
            }
        }
    }
    
}

struct ProcessedImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessedImageView(color: .red, image: nil)
    }
}
