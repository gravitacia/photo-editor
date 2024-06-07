//
//  TextOverlay.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 07.06.2024.
//

import SwiftUI

struct TextOverlay: View {
    @Binding var text: String

    var body: some View {
        TextField("Введите текст", text: $text)
            .padding()
            .background(Color.white)
            .border(Color.black, width: 1)
    }
}
