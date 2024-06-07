//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI
import PhotosUI
import PencilKit

import SwiftUI
import PhotosUI
import PencilKit

struct ContentView: View {
    @State private var image: UIImage?
    @State private var pickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var canvasView = PKCanvasView()
    @State private var text = ""

    var body: some View {
        NavigationView {
            VStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .border(Color.black, width: 1)
                } else {
                    Text("Выберите изображение")
                        .foregroundColor(.gray)
                }
                HStack {
                    Button(action: {
                        pickerPresented = true
                    }) {
                        Text("Загрузить изображение")
                    }
                }
                .padding()

                DrawingView(canvasView: $canvasView)
                    .frame(width: 300, height: 300)
                    .border(Color.black, width: 1)

                Button(action: saveDrawing) {
                    Text("Сохранить рисунок")
                }
                .padding()

                TextOverlay(text: $text)
                    .padding()

                Button(action: addTextToImage) {
                    Text("Добавить текст к изображению")
                }
                .padding()
            }
            .sheet(isPresented: $pickerPresented, onDismiss: loadImage) {
                ImagePicker(image: $selectedImage)
            }
            .navigationBarTitle("Редактор изображений", displayMode: .inline)
        }
    }

    func loadImage() {
        guard let inputImage = selectedImage else { return }
        image = inputImage
    }

    func saveDrawing() {
        let drawingImage = canvasView.drawing.image(from: canvasView.drawing.bounds, scale: 1.0)
        UIImageWriteToSavedPhotosAlbum(drawingImage, nil, nil, nil)
    }

    func addTextToImage() {
        guard let inputImage = selectedImage else { return }
        let renderer = UIGraphicsImageRenderer(size: inputImage.size)
        
        let img = renderer.image { ctx in
            inputImage.draw(at: CGPoint.zero)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.white,
                .backgroundColor: UIColor.black
            ]
            
            let string = NSString(string: text)
            string.draw(with: CGRect(x: 0, y: 0, width: inputImage.size.width, height: inputImage.size.height), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        }
        
        selectedImage = img
    }
}
