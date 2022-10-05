//
//  ContentView.swift
//  Xav_training
//
//  Created by Steve Begin on 2022-09-28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        HStack {
            VStack {
                Spacer()
                vm.color
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        Text("Color")
                    }
                Spacer()
                Button {
                    vm.generateRandomColor()
                } label: {
                    Text("Generate random color")
                }
                
            }
            
            VStack {
                if let image = vm.image {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 500)
                } else {
                    Color.white
                        .overlay {
                            Text(vm.filename)
                        }
                }
                
                Button {
                    vm.loadImage()
                } label: {
                    Text("Load image")
                }
                
            }
            
            Divider()
                
                ProcessedImageView(
                    color: vm.color,
                    image: vm.image
                )
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: .init())
    }
}
