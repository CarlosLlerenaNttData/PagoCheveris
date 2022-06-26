//
//  NetworkingError.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

public enum NetworkingError: Error {
    
    case apiError(Int, error: Decodable)
    case invalidRequestError(String)
    case invalidResponse
    case parsingError(Error, String)
    case unauthorized
    case unexpectedError(Error)
}
