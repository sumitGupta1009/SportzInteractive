//
//  File.swift
//  DreamInteractive
//
//  Created by Sumit Gupta on 05/02/21.
//

import Foundation
import UIKit

class ServiceInteractor {
    func getJson(completion: @escaping () -> Void) {
        let urlString = ""
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data {
                    let decoder = JSONDecoder()
//                    if let json = try? decoder.decode(Response.self, from: data) {
                    completion()
//                    }
                }
            }
        }
    }
}
