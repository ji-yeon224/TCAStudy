//
//  UserRepository.swift
//  TCAStudy
//
//  Created by Jiyeon on 3/3/25.
//

import Foundation

// 추상화
protocol UserRepository {
    func fetchUserInfo() -> String
}

// 구현체
final class UserRepositoryImpl: UserRepository {
    func fetchUserInfo() -> String {
        return "User Data"
    }
}

