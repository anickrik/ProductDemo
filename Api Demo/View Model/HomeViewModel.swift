//
//  HomeViewModel.swift
//  Api Demo
//
//  Created by Rishi on 01/02/23.
//

import Foundation

class HomeViewModel {
    
    weak var  vc : HomeViewController?
    var arrProducts = [ProductModel]()
    
    func getOfferData() {
        
        guard let apiURL = URL(string: Constant.Apis.offerApi) else { return }
         
        let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            //Error
            guard error == nil else {
                print("inFirstErrorCase")
                print(error?.localizedDescription ?? "")
                return
            }
            
            if let responseData = data {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    print("API: \(apiURL)\nAPI Result: \(jsonResponse)")
                    
                    let userResponse = try JSONDecoder().decode([ProductModel].self, from: responseData)
                    
                    self.arrProducts.append(contentsOf: userResponse)
                    
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                    
                } catch let err {
                    print(err)
                }
            }
        }
        task.resume()
    }
    
}
