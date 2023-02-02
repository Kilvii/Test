//
//  UserDefaultsStorage.swift
//  Test
//
//  Created by User on 01.02.2023.
//


import Foundation

final class UserDefaultsStorage: DataStorage {
    
    init(encoder: JSONEncoder, decoder: JSONDecoder, userDefaults: UserDefaults) {
        self.encoder = encoder
        self.decoder = decoder
        self.userDefaults = userDefaults
    }
    
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let userDefaults: UserDefaults
    
    func save<Value: Codable>(value: Value, key: String) {
        guard let data = try? encoder.encode(value) else{
            return
        }
        
        userDefaults.set(data, forKey: key)
    }
    func value<Value: Codable>(key:String) -> Value? {
        guard let data = userDefaults.data(forKey: key) else{
            return nil
        }
        
        return try? decoder.decode(Value.self, from: data)
    }
    
}
