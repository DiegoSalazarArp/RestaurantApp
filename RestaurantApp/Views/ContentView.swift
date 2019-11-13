//
//  ContentView.swift
//  RestaurantApp
//
//  Created by Diego Salazar Arp on 12-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var obs = Observer()
    
    var body: some View {

        NavigationView{
            List(obs.datas) { i in

                Card(image: i.image, name: i.name, weburl: i.webUrl, rating: i.rating)
                
            }.navigationBarTitle("Restaurantes cercas:")
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
