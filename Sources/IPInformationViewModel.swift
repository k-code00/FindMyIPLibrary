//
//  IPInformationViewModel.swift
//
//
//  Created by Kojo on 22/11/2023.
//

import Foundation
import Combine

public class IPInformationViewModel: ObservableObject {
    @Published public var ipInformation: IPInformation?
    @Published public var errorMessage: String?
    @Published public var isLoading = false
    @Published public var showAlert = false

    public init() {}  // Public initializer

    public func getIPInformation() {
        self.isLoading = true
        fetchIPInformation { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let info):
                    self?.ipInformation = info
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
}
