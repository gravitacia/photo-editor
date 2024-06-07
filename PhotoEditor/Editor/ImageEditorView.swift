//
//  ImageEditorView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI
import PencilKit

struct ImageEditorView: View {
    @State private var image: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    @State private var canvasView = PKCanvasView()

    var body: some View {
        VStack {
            if let image = image {
                ZStack {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.1))

                    CanvasView(canvasView: $canvasView)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            } else {
                Text("Tap to select an image")
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $image)
        }
        .padding()
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}

struct ImageEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ImageEditorView()
    }
}

