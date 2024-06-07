//
//  DrawingView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 07.06.2024.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 10)
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {}
}
