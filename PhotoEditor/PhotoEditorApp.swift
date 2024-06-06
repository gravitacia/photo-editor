//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Александр Косарский on 06.06.2024.
//

import SwiftUI
import FirebaseCore

@main
struct PhotoEditorApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
