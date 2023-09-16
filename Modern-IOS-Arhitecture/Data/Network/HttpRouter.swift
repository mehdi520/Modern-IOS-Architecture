//
//  HttpRouter.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import Alamofire

protocol HttpRouter: URLRequestConvertible {
    var baseUrlString: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    func body() throws -> Data?

    func request(usingHttpService service: HttpService) throws -> DataRequest
}

extension HttpRouter {
    
    var parameter: Parameters? { return nil }
    func body() throws -> Data? { return nil }
    var bodyParam : Parameters? {return nil}
    
    func asURLRequest() throws -> URLRequest {
                var url =  try baseUrlString.asURL()
                var urlRequest = URLRequest(url: url.appendingPathComponent(path))
                urlRequest.httpMethod = method.rawValue
                urlRequest.headers = headers ?? []
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
               
      
        return urlRequest
    }
    
    func request(usingHttpService service: HttpService) throws -> DataRequest {
        return try service.request(asURLRequest())
    }
}
