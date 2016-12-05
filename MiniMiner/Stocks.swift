//
//  YQL.swift
//  MiniMiner
//
//  Created by Elias Bickel (student LM) on 12/5/16.
//  Copyright © 2016 Pixelaborate. All rights reserved.
//

import Foundation
import SpriteKit

class Stocks{
    class var instance : Stocks {
        struct Static {
            static let instance : Stocks = Stocks()
        }
        return Static.instance
    }
    
    func getStock()
    {
        let urlString:String = ("http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.quotes where symbol IN +(\"AAPL\")+&format=json&env=http://datatables.org/alltables.env").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        var quotes: AnyObject?
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            
            if(error != nil){
                print(error?.localizedDescription)
            }
            else{
                do{
                    let jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    quotes = jsonDict.objectForKey("query")!.objectForKey("results")!.objectForKey("quote")!.objectForKey("Ask")!
                    print(quotes)
                }
                catch let jsonError as NSError {
                    print(jsonError.localizedDescription)
                }
            }
        })
        
        task.resume()
    }
}