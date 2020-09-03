//
//  EndPointType.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 19/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
