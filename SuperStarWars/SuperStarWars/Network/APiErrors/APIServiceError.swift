//
//  APIServiceError.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation

enum APIServiceError: Error {
    case network(Error)
    case decoding(Error)
    case invalidURL
}
