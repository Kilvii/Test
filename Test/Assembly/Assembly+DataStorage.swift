//
//  Assembly+DataStorage.swift
//  Test
//
//  Created by User on 01.02.2023.
//

import Foundation

extension Assembly {
    var dataStorage: DataStorage {
        UserDefaultsStorage(encoder: JSONEncoder(), decoder: JSONDecoder(), userDefaults: UserDefaults.standard)
    }
}
var encoder: JSONEncoder {
    JSONEncoder()
}
var decoder: JSONDecoder {
    JSONDecoder()
}
