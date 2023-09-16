//
//  MovieHttpService.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import Alamofire

final class MovieHttpService: HttpService {
    var sessionManger: Session = Session.default
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return sessionManger.request(urlRequest).validate(statusCode: 200..<800)
    }
}
