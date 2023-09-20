//
//  CustomerViewCell.swift
//  DemoTestKoombea
//
//  Created by Fulvio A. Moya on 20/9/23.
//

import SwiftUI

struct CustomerViewCell: View {
    var customer: Customer
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: customer.pictureURL))
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(12)
            
            VStack(alignment: .leading) {
                Text(customer.firstName)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.2)
                
                Text(customer.email)
                    .font(.subheadline)
                    .minimumScaleFactor(0.2)
            }
            
        }
    }
}

struct CustomerViewCell_Previews: PreviewProvider {
    static var previews: some View {
        // TODO: COptimize this code
        CustomerViewCell(customer: CustomerViewModel().list.first!)
    }
}
