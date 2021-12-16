//
//  WebService.swift
//  MVVMCryptoExample
//
//  Created by burak ozen on 14.12.2021.
//

import Foundation

class WebService {
    
    func downloadCurrencies (url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
//                bir hata varsa data falan yok  cryptocurrency dizisi boş geliyo gibi diyebiliyoruz
                completion(nil)
            } else if let data = data {
//                json formatındaki bir veriyi işler ve dönüştürür.
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
                
            }
        }.resume()
        
    }
    
    
}
