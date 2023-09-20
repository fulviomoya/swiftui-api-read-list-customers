//
//  ContentView.swift
//  DemoTestKoombea
//
//  Created by Fulvio A. Moya on 20/9/23.
//

import SwiftUI

struct CustomerListView: View {
    @StateObject var viewModel = CustomerViewModel()

    var body: some View {
        List(viewModel.list, id: \.id) { customer in
           CustomerViewCell(customer: customer)
        }.onAppear {
            viewModel.getCustomerList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListView()
    }
}
