//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Onur Bulut on 4.10.2023.
//

import Foundation

protocol NetworkService{
    func download(_ resourse: String) async throws -> [User]
    var type: String {get}
}
