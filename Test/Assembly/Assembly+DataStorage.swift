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

private var encoder: JSONEncoder {
    JSONEncoder()
}
private var decoder: JSONDecoder {
    JSONDecoder()
}
