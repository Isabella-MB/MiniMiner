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
    
    func getRandomStock(callback: ([Int]) -> ())
    {
        let stockName = stockStrings[Int(arc4random_uniform(UInt32(stockStrings.count)))]
        
        let urlString:String = ("http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.historicaldata where symbol = \"" + stockName + "\" and startDate = \"2016-01-01\" and endDate = \"2016-12-01\" &format=json&env=http://datatables.org/alltables.env").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                print(error?.localizedDescription)
            }
            else{
                do{
                    
                    var stockHighs = [Int]()
                    
                    let jsonDict = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    
                    if let quotes = ((jsonDict.object(forKey: "query") as AnyObject).object(forKey: "results") as AnyObject).object(forKey: "quote") as? NSArray
                    {
                        for quote in quotes{
                            stockHighs.append(Int(((quote as AnyObject).object(forKey: "high") as! Float) * 100))
                        }
                    }
                }
                catch let jsonError as NSError {
                    print(jsonError.localizedDescription)
                }
            }
        })
        
        task.resume()
    }
}
