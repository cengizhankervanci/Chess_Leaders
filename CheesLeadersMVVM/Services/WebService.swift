//
//  WebService.swift
//  CheesLeadersMVVM
//
//  Created by Cengizhan Kervancı on 1.06.2023.
//

import Foundation

class WebService{
    func downloadData(url : URL , completion : @escaping(LeadersModel?)->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                print(error?.localizedDescription as Any)
                completion(nil)
            }
            else if let data = data{
                let decodedJSON = try? JSONDecoder().decode(LeadersModel.self, from: data)
                if let myData = decodedJSON{
                    completion(myData)
                }
            }
        }.resume()
    }
}
