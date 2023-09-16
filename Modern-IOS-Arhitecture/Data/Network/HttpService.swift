//
//  HttpService.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import Alamofire

protocol HttpService {
    var sessionManger: Session { get set }
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
