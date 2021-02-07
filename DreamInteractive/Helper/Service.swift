//
//  File.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 05/02/21.
//

import Alamofire
import Foundation
import SwiftyJSON
import UIKit

public class ServiceInteractor {
    private static let urlString = "https://cricket.yahoo.net/sifeeds/cricket/live/json/sapk01222019186652.json"

    static func hitJson(completionHandler: @escaping ([String]?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let urlReq = URLRequest(url: url)

        Alamofire.request(urlReq).responseJSON { response in

            switch response.result {
            case let .success(_json):
//                print("Success with JSON: \(_json)")
                let json = JSON(_json)
                guard let matchInfoModel = json["Nuggets"].arrayObject as? [String] else { return completionHandler([]) }
                print("matchInfoModel \(matchInfoModel) \(matchInfoModel.count)")
                completionHandler(matchInfoModel)
            case let .failure(error):
                print(error)
                completionHandler(nil)
            }
        }
    }
}
