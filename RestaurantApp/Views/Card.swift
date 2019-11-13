//
//  Card.swift
//  RestaurantApp
//
//  Created by Diego Salazar Arp on 12-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct Card: View {
    
    var image = ""
    var name = ""
    var weburl = ""
    var rating = ""
    
    var body: some View {
        
        
        NavigationLink(destination: Register(url: weburl, name: name)) {
            
            HStack {
                AnimatedImage(url: URL(string: image)!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(name).fontWeight(.heavy)
                    Text("rating: " + String((rating)))
                }.padding(.vertical, 10)
                
            }
            
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
