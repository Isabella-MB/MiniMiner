//
//  YQL.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class StockManager{
    var stockStrings: [String] = []
    var stocks: [Stock] = []
    
    func loadStocks(){
        if let path = NSBundle.mainBundle().pathForResource("Stocks", ofType: "txt")
        {
            do{
                let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
                
                content.enumerateLines { self.stockStrings.append($0.line) }
                
            } catch _ as NSError {
                return
            }
        }
    }
    
    func setRandomStocks()
    {
        let stockName = stockStrings[Int(arc4random_uniform(UInt32(stockStrings.count)))]
        
        let urlString:String = ("http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.quotes where symbol IN +(\"" + stockName + "\")+&format=json&env=http://datatables.org/alltables.env").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        var stock: Stock?
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                print(error?.localizedDescription)
            }
            else{
                do{
                    let jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    let quotes = jsonDict.objectForKey("query")!.objectForKey("results")!.objectForKey("quote")!
                    
                    stock = Stock(change: 0, previousClose: 0, name: stockName)
                    
                    if let changeString = quotes.objectForKey("Change") as? String
                    {
                        if let change = Float(changeString){
                            stock!.change = change
                        }
                    }
                    
                    if let previousCloseString = quotes.objectForKey("PreviousClose") as? String
                    {
                        if let previousClose = Float(previousCloseString){
                            stock!.previousClose = previousClose
                        }
                    }
                    
                    print(stock!)
                }
                catch let jsonError as NSError {
                    print(jsonError.localizedDescription)
                }
            }
        })
        
        task.resume()
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