//
//  Data.swift
//  RestaurantApp
//
//  Created by Diego Salazar Arp on 12-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SDWebImageSwiftUI
import SwiftUI

class Observer: ObservableObject {
    
    @Published var  datas = [Datatype]()
    
    init() {
        let url1 = "https://developers.zomato.com/api/v2.1/geocode?lat=-33.4592298&lon=-70.645348"
        let key = "c913841060ea614f7c0f5b5f120a21cb"
        
        let url = URL(string: url1)
        var request = URLRequest(url: url!)
        
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(key, forHTTPHeaderField: "user-key")
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { (data, _, _) in
            
            do {
                let fetch = try JSONDecoder().decode(Type.self, from: data!)
                print(fetch)
                
                
                
                for i in fetch.nearby_restaurants{
                    
                    DispatchQueue.main.async {
                        self.datas.append(Datatype(id: i.restaurant.id, name: i.restaurant.name, image: i.restaurant.thumb, rating: i.restaurant.user_rating.aggregate_rating, webUrl: i.restaurant.url))
                    }
                    
                    
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}

struct Datatype : Identifiable {
    
    var id : String
    var name: String
    var image: String
    var rating: String
    var webUrl: String
    
}

struct Type: Decodable{
    
    var nearby_restaurants: [Type1]
}

struct  Type1: Decodable {
    
    var restaurant: Type2
}

struct Type2: Decodable {
    
    var id: String
    var name: String
    var url: String
    var thumb: String
    var user_rating: Type3
}

struct Type3: Decodable {
    
    var aggregate_rating: String
}
