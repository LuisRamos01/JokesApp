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
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                if viewModel.isloading {
                    ProgressView("Cargando Chiste")
                }else if let error = viewModel.errorMessage{
                    Text(error).foregroundColor(.red)
                }else if let joke = viewModel.joke{
                    
                    Text(joke.setup).font(.largeTitle).multilineTextAlignment(.center).italic().foregroundStyle(.white)
                    
                    Text(joke.punchline)
                        .font(.subheadline).foregroundColor(.gray).multilineTextAlignment(.center)
                } else {
                    Text("presiona el boton para obtener un nuevo chiste ").foregroundColor(.gray).multilineTextAlignment(.center)
                }
                Button(action: {
                    viewModel.fetchRandomJoke()
                }) {
                    
                    Text("¡JOKE!")
                        .font(.headline).padding().frame(width: 120, height: 120).background(.red).foregroundStyle(.white).cornerRadius(60)
                }.padding(20)
                
                
                
            }
            .padding()
            .onAppear() {
                viewModel.fetchRandomJoke()
            }
        }
    }
}

#Preview {
    ContentView()
}
