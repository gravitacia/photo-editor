//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage? = nil
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        NavigationView {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 400)
                        .padding()
                } else {
                    Text("Выберите изображение для редактирования")
                        .padding()
                }
                HStack {
                    Button(action: {
                        showingImagePicker = true
                    }) {
                        Text("Загрузить изображение")
                    }
                    Spacer()
                    NavigationLink(destination: EditView(image: $image)) {
                        Text("Редактировать изображение")
                    }
                    .disabled(image == nil)
                }
                .padding()
            }
            .navigationTitle("Редактор фотографий")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = inputImage
    }
}
