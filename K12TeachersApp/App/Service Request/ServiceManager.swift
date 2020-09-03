//
//  ServiceManager.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

enum serviceError: Error {
    case noInternet
    case didNotReceive(title: String)
    case custom(title: String)
    case defaultError(error: NSError)
    case unknownObject
    case unknownError
}

// Preparing localized description
extension serviceError {
    var errorDescription: String! {
        switch self {
        case .noInternet:
            return "Please check your internet connection and try again."
        case .unknownObject:
            return "Received unknown object from server."
        case .unknownError:
            return "Received unknown error from server."
        case .didNotReceive(let title):
            return "Did not receive \(title)"
        case .custom(let title):
            return title
        case .defaultError(let error):
            return error.localizedDescription
        }
    }
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}
