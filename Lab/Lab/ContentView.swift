//
//  ContentView.swift
//  Lab
//
//  Created by Sofiia Beliak on 2026-02-25.
//
import SwiftUI

struct ContentView: View {
    @State private var output: Int = 0
    @State private var step: Int = 2   // starts like the sample (Step = 2)

    var body: some View {
        VStack(spacing: 18) {

            // Title bar
            Text("Lab Exercise")
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: 260, height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 2)
                )
                .padding(.top, 16)

            // Main card (phone-like)
            ZStack {
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.yellow.opacity(0.45))
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.blue.opacity(0.6), lineWidth: 2)
                    )
                    .frame(width: 280, height: 420)

                VStack(spacing: 22) {

                    // Logo
                    Group {
                        if UIImage(named: "gbc_logo") != nil {
                            Image("gbc_logo")
                                .resizable()
                                .scaledToFit()
                        } else {
                            // If you didn't add an image asset, this placeholder shows
                            Image(systemName: "building.columns.fill")
                                .resizable()
                                .scaledToFit()
                                .padding(18)
                                .foregroundStyle(.blue)
                        }
                    }
                    .frame(width: 110, height: 90)

                    // Output textbox
                    Text("\(output)")
                        .font(.system(size: 34, weight: .bold))
                        .frame(width: 120, height: 48)
                        .background(Color.white)
                        .cornerRadius(4)

                    // Subtract and Add buttons
                    HStack(spacing: 28) {
                        Button(action: { output -= step }) {
                            Text("-")
                                .font(.system(size: 28, weight: .bold))
                                .frame(width: 72, height: 44)
                                .foregroundColor(.black)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(4)
                        }

                        Button(action: { output += step }) {
                            Text("+")
                                .font(.system(size: 28, weight: .bold))
                                .frame(width: 72, height: 44)
                                .foregroundColor(.black)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(4)
                        }
                    }

                    // Reset and Step buttons
                    HStack(spacing: 18) {
                        Button(action: { output = 0 }) {
                            Text("Reset")
                                .font(.headline)
                                .frame(width: 110, height: 44)
                                .foregroundColor(.white)
                                .background(Color.green)
                                .cornerRadius(4)
                        }

                        Button(action: {
                            step = (step == 1) ? 2 : 1
                        }) {
                            Text("Step = \(step)")
                                .font(.headline)
                                .frame(width: 110, height: 44)
                                .foregroundColor(.white)
                                .background(Color.orange)
                                .cornerRadius(4)
                        }
                    }
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
