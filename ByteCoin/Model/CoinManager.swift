//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "F41449B5-E2A8-4653-83F2-1BFA9B0E6B91"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getBaseURL()->String{return "\(baseURL)"}
    
    var delegate : CoinDelegate?
    
    func callReq(with urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data:Data?, response:URLResponse?, error:Error?) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let coin =  self.parseJSON(safeData){
                        self.delegate?.didUpdateCoin(data: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data : Data)->CoinModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData : CoinModel = try decoder.decode(CoinModel.self,from: data)
            return decodedData
        }catch{
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func getCoinPrice(for curr: String){
        let url = "\(getBaseURL())/\(curr)?apikey=\(apiKey)"
        callReq(with: url)
    }
    
}
