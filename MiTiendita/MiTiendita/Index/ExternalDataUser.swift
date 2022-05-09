//
//  ExternalDataUser.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 06/05/22.
//

import Foundation

class ExternalDataUser{
    func getUserWithToken (token: String, url: String, delegate: ExternalDataUserDelegate){
        
        let url = URL(string: url)!
        // prepare json data
        let json: [String: Any] = ["State": 1]
        _ = try? JSONSerialization.data(withJSONObject: json)
        // create post request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // insert json data to the request
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let datos = data, error == nil else {return}
            do{
                let respuesta = try JSONDecoder().decode(User.self, from: datos)
                delegate.onRecivedDataUser(data: respuesta)
            }catch (let error as NSError){
                delegate.onResponseFaillure(error: error)
            }
        }
        task.resume()
    }
}

protocol ExternalDataUserDelegate {
    func onRecivedDataUser(data: User)
    func onResponseFaillure(error: NSError)
}

extension ExternalDataUserDelegate {
    func onRecivedDataUser(data: User){
        
    }
    func onResponseFaillure(error: NSError){
        
    }
}
