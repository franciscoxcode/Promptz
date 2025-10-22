//
//  CreateNoteView.swift
//  Promptz
//
//  Created by Francisco Jean on 21/10/25.
//

import SwiftUI

struct CreateNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var noteText: String = ""
    @FocusState private var isEditorFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                ZStack(alignment: .topLeading) {
                    if noteText.isEmpty {
                        Text("Dump your prompts...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                    }
                    
                    TextEditor(text: $noteText)
                        .scrollContentBackground(.hidden)
                        .padding(8)
                        .frame(maxHeight: .infinity)
                        .focused($isEditorFocused)
                }
            }
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isEditorFocused = true
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                    .bold()
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    CreateNoteView()
}
