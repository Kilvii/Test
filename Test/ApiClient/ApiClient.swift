//
//  ApiClient.swift
//  Test
//
//  Created by User on 03.02.2023.
//

import Foundation

class ApiClient {

    init(decoder: JSONDecoder ) {
        self.decoder = decoder
    
    }
    
    private let decoder: JSONDecoder
    
    private enum dataError: Error{
        case errorJSONdata
    }
    
    
    //<Value: Decodable>
    func profile(completion: @escaping (Result<ResponseBody<ProfileResponseDate>?, Error>) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let self = self else{
                return
            }
            
            //print("start background \(Thread.isMainThread)" )
            
            guard let url = Bundle.main.url(forResource: "Profile", withExtension: "json") else{
                return
            }
            
            
            guard let data = try? Data.init(contentsOf: url) else {
                return
            }
            
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            
            self.decoder.dateDecodingStrategy = .formatted(formatter)
            self.decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            
            let responseBody = try? self.decoder.decode(ResponseBody<ProfileResponseDate>.self, from: data)
            
            //print("start \(Thread.isMainThread)" )
            
            if (responseBody?.data?.profile?.id != nil && responseBody?.data?.profile?.firstName != nil && responseBody?.data?.profile?.lastName != nil){
                DispatchQueue.main.async {
                    completion(.success(responseBody))
                }
            }
            else{
                DispatchQueue.main.async {
                    completion(.failure(dataError.errorJSONdata))
                }
            }
            
            
            //print("finish \(Thread.isMainThread)" )
        }
        
    }
    
}

//extension DateFormatter {
//    static let yearMonthDay: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        return formatter
//    }()
//}
