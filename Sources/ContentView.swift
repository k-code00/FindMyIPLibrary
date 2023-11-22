//
//  SwiftUIView.swift
//  
//
//  Created by Kojo on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = IPInformationViewModel()
    
    var body: some View {
        List {
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .padding()
            } else if let ipInfo = viewModel.ipInformation {
                Section(header: Text("IP Address")) {
                    Menu {
                        Button(action: {}) {
                            Text("Version: \(ipInfo.version ?? "Unknown")")
                        }
                        Button(action: {}) {
                            Text("City: \(ipInfo.city ?? "Unknown")")
                        }
                        Button(action: {}) {
                            Text("Region: \(ipInfo.region ?? "Unknown")")
                        }
                    } label: {
                        HStack {
                            Text(ipInfo.ip ?? "Unknown")
                                .fontWeight(.light)
                                .foregroundColor(.blue)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                    .menuStyle(DefaultMenuStyle())
                }
            } else if viewModel.errorMessage != nil {
                Section {
                    Text("Error: Refresh To Find IP")
                        .foregroundColor(.red)
                }
            }
        }
        .refreshable {
            viewModel.getIPInformation()
        }
        .onAppear {
            viewModel.getIPInformation()
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text("Error"),
                message: Text("Cannot Find IP"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
