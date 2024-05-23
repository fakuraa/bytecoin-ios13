//
//  CoinDelegate.swift
//  ByteCoin
//
//  Created by Fadil Kurniawan on 23/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinDelegate {
    func didUpdateCoin(data : CoinModel)
    func didFailWithError(error : Error)
}
