//
//  DetailViewModel .swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import Foundation

class DetailViewModel {
    
    var detailData = Dynamic(Detail(id: "", title: "", price: "", location: "", imageURL: "", createdDate: "", description: "", email: "", phoneNumber: "", address: ""))
    
    func fetchDetailedAdvertisment(id: String) {
        NetworkManager<Detail>.fetch(for: URL(string: API.getURLFor(id: id))!) { result in
            switch result {
            case .success(let response):
                self.detailData.value = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
