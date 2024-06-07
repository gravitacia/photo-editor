//
//  EditView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI
import PencilKit

struct EditView: View {
    @Binding var image: UIImage?
    @State private var canvasView = PKCanvasView()
    @State private var text = ""
    @State private var showingTextEditor = false

    var body: some View {
        VStack {
            if let image = image {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                    CanvasView(canvasView: $canvasView)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .overlay(
                    Button(action: {
                        showingTextEditor = true
                    }) {
                        Text("Добавить текст")
                    }
                    .padding()
                    , alignment: .topTrailing
                )
            }
            HStack {
                Button(action: applyFilter) {
                    Text("Применить фильтр")
                }
                Spacer()
                Button(action: saveImage) {
                    Text("Сохранить")
                }
            }
            .padding()
        }
        .sheet(isPresented: $showingTextEditor) {
            TextEditorView(text: $text, onSave: addText)
        }
    }

    func applyFilter() {
        // Реализация применения фильтров с использованием Core Image
    }

    func saveImage() {
        // Реализация сохранения изображения
    }

    func addText() {
        // Реализация добавления текста на изображение
    }
}
