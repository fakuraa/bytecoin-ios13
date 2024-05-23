//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Fadil Kurniawan on 23/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel : Codable {
    let time, assetIDBase, assetIDQuote : String
    let rate : Double
    
    enum CodingKeys : String, CodingKey {
        case time
        case assetIDBase = "asset_id_base"
        case assetIDQuote = "asset_id_quote"
        case rate
    }
}
