//
//  ContentView.swift
//  Lab7
//
//  Created by Sofiia Beliak on 2026-02-25.
//

import SwiftUI

struct ContentView: View {
    
    let books = ["Harry Potter", "The Great Gatsby", "Atomic Habits", "The Hobbit"]
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Welcome to the Book App 📚")
                    .font(.title2)
                    .padding()
                
                List(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(title: book)) {
                        Text(book)
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}

struct DetailView: View {
    
    var title: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Selected Book:")
                .font(.headline)
            
            Text(title)
                .font(.title)
                .bold()
            
            NavigationLink(destination: InfoView()) {
                Text("Go to Info Screen")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top)
            
        }
        .padding()
        .navigationTitle("Detail")
    }
}

struct InfoView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("About This App")
                .font(.title2)
                .bold()
            
            Text("This app demonstrates multi-screen navigation using NavigationStack in SwiftUI.")
                .multilineTextAlignment(.center)
                .padding()
            
            NavigationLink(destination: ContentView()) {
                Text("Go Back to Home")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
        }
        .padding()
        .navigationTitle("Info")
    }
}
