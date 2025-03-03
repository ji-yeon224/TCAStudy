//
//  UserDependency.swift
//  TCAStudy
//
//  Created by Jiyeon on 3/3/25.
//

import ComposableArchitecture

struct UserRepositoryDependency: DependencyKey {
  static let liveValue: UserRepository = UserRepositoryImpl()
}

struct UserInfoUseCaseDependency: DependencyKey {
  static let liveValue: UserInfoUseCase = UserInfoUseCaseImpl(repository: DependencyValues().userRepository)
}

extension DependencyValues {
  var userRepository: UserRepository {
    get { self[UserRepositoryDependency.self] }
    set { self[UserRepositoryDependency.self] = newValue }
  }
  
  var userInfoUseCase: UserInfoUseCase {
    get { self[UserInfoUseCaseDependency.self] }
    set { self[UserInfoUseCaseDependency.self] = newValue }
  }
}

