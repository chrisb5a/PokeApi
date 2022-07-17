//
//  NetworkError.swift
//  FirstPokeApp
//
//  Created by CHRISTIAN BEYNIS on 7/15/22.
//

import Foundation


import Foundation

enum NetworkError: Error {
    case badData
    case badURL
    case other(Error)
}
