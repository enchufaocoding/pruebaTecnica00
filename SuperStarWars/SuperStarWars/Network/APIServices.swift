//
//  APIServices.swift
//  SuperStarWars
//
//  Created by Jose Alberto Rosario Castillo on 11/12/25.
//

import Foundation

actor APIServices {
    static let baseURL = "https://swapi.dev/api"

    static func fetchCharacter(pageNum: Int) async throws -> PaginationResponse {
        guard let url = URL(string: "\(baseURL)/people/?page=\(pageNum)") else {
            throw APIServiceError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(PaginationResponse.self, from: data)
        } catch {
            throw APIServiceError.decoding(error)
        }
    }

    static func fetchFilms(url: URL) async throws -> FilmsModel {
        let (data, _) = try await URLSession.shared.data(from: url)
        do {
            return try JSONDecoder().decode(FilmsModel.self, from: data)
        } catch {
            throw APIServiceError.decoding(error)
        }
    }

    static func fetchFilm(id: Int) async throws -> FilmsModel {
        guard let url = URL(string: "\(baseURL)/films/\(id)/") else { throw APIServiceError.invalidURL }
        return try await fetchFilms(url: url)
    }
}
