//
//  CustomerViewModel.swift
//  DemoTestKoombea
//
//  Created by Fulvio A. Moya on 20/9/23.
//

import Foundation

protocol CustomerViewModelProtocol {
    func getCustomerList()
}

class CustomerViewModel: ObservableObject, CustomerViewModelProtocol {
    @Published var list: [Customer] = []
    
    func getCustomerList()  {
        NetworkManager.shared.getUser { [weak self] result in
            switch result {
            case .success(let listOfCustomer):
                self?.list = listOfCustomer
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            }
        }
    }
}
