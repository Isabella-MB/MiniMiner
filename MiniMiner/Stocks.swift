//
//  YQL.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

extension String {
    var lines: [String] {
        var result: [String] = []
        enumerateLines { line, _ in result.append(line) }
        return result
    }
}

class StockManager{
    var stockStrings: [String] = []
    
    func loadStocks(){
        if let path = Bundle.main.path(forResource: "Stocks", ofType: "txt")
        {
            do{
                let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                
                stockStrings = content.lines
                
            } catch _ as NSError {
                return
            }
        }
    }
    
    func getRandomStock() -> Stock
    {
        let stockName = stockStrings[Int(arc4random_uniform(UInt32(stockStrings.count)))]
        
        let urlString:String = ("http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.quotes where symbol IN +(\"" + stockName + "\")+&format=json&env=http://datatables.org/alltables.env").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var stock: Stock?
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                print(error?.localizedDescription)
            }
            else{
                do{
                    let jsonDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    let quotes = ((jsonDict.object(forKey: "query")! as AnyObject).object(forKey: "results")! as AnyObject).object(forKey: "quote")!
                    
                    stock = Stock(change: 0, previousClose: 0, name: stockName)
                    
                    if let changeString = (quotes as AnyObject).object(forKey: "Change") as? String
                    {
                        if let change = Float(changeString){
                            stock!.change = change
                        }
                    }
                    
                    if let previousCloseString = (quotes as AnyObject).object(forKey: "PreviousClose") as? String
                    {
                        if let previousClose = Float(previousCloseString){
                            stock!.previousClose = previousClose
                        }
                    }
                    
                    if(stock!.change == 0 || stock!.previousClose == 0){
                        self.getRandomStock()
                    }
                }
                catch let jsonError as NSError {
                    print(jsonError.localizedDescription)
                }
            }
        })
        
        task.resume()
        
        return stock!
    }
    
    func unloadStocks() {
        stockStrings = []
    }
}

struct Stock{
    var change: Float
    var previousClose: Float
    var name: String
}
