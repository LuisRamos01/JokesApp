//
//  ContentView.swift
//  JokesApp
//
//  Created by luis ramos on 19/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = JokeViewModel(service: JokeService())
    var body: some View {
        VStack {
            if viewModel.isloading {
                ProgressView("Cargando Chiste")
            }else if let error = viewModel.errorMessage{
                Text(error).foregroundColor(.red)
            }else if let joke = viewModel.joke{
                
                Text(joke.setup).font(.headline).multilineTextAlignment(.center)
                
                Text(joke.punchline)
                    .font(.subheadline).foregroundColor(.secondary).multilineTextAlignment(.center)
            } else {
                Text("presiona el boton para obtener un nuevo chiste ").foregroundColor(.gray).multilineTextAlignment(.center)
            }
            Button(action: {
                viewModel.fetchRandomJoke()
            }) {
                Text("Nuevo Chiste")
                    .font(.headline).padding().frame(width: .infinity, height: 50).background(.blue).foregroundStyle(.white).cornerRadius(10)
            }
            
            
            
        }
        .padding()
        .onAppear() {
            viewModel.fetchRandomJoke()
        }
    }
}

#Preview {
    ContentView()
}
