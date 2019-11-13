//
//  Register.swift
//  RestaurantApp
//
//  Created by Diego Salazar Arp on 12-11-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct Register: View {
    
    var url = ""
    var name = ""
    var body: some View {

        WebView(url: url).navigationBarTitle(name)

    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
