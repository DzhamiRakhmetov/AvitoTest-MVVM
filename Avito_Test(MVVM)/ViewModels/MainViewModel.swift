//
//  MainViewModel.swift
//  Avito_Test(MVVM)
//
//  Created by Dzhami on 08.10.2023.
//

import Foundation

class MainViewModel {
    
    var advertismentsData = Dynamic(AdvertisementResponse(advertisements: []))
    
    func fetchAdvertisments() {
        NetworkManager<AdvertisementResponse>.fetch(for: URL(string: API.baseURLString)!) { result in
            switch result {
            case .success(let response):
                self.advertismentsData.value = response
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
