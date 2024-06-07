//
//  TextEditorView.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var text: String
    var onSave: () -> Void

    var body: some View {
        VStack {
            TextEditor(text: $text)
                .padding()
            Button("Сохранить") {
                onSave()
            }
            .padding()
        }
    }
}
