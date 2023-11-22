//
//  IPInformationViewModel.swift
//
//
//  Created by Kojo on 22/11/2023.
//

import Foundation
import Combine

public class IPInformationViewModel: ObservableObject {
    @Published var ipInformation: IPInformation?
    @Published var errorMessage: String?
    @Published var isLoading = false
    @Published var showAlert = false

    //fetching IP information.
    func getIPInformation() {
        self.isLoading = true  //start of a network request
        fetchIPInformation { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false  //end of a network request
                switch result {
                case .success(let info):
                    //if successful, update ipInformation
                    self?.ipInformation = info
                case .failure(let error):
                    //if failure, update the errorMessage and set showAlert to true
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
}
