//
//  UserInfoUseCase.swift
//  TCAStudy
//
//  Created by Jiyeon on 3/3/25.
//

import Foundation

// 추상화
protocol UserInfoUseCase {
    func getUserInfo() -> String
}


// 구현체
final class UserInfoUseCaseImpl: UserInfoUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func getUserInfo() -> String {
        return repository.fetchUserInfo()
    }
}
