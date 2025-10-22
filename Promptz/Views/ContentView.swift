//
//  ContentView.swift
//  Promptz
//
//  Created by Francisco Jean on 21/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresentingCreateNote = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color(.systemBackground)
                    .ignoresSafeArea()
                
                // Aquí irán las notas más adelante
                
                // Botón flotante
                Button(action: {
                    isPresentingCreateNote = true
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(.tint))
                        .shadow(radius: 3)
                }
                .padding(.trailing, 25)
                .fullScreenCover(isPresented: $isPresentingCreateNote) {
                    CreateNoteView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
