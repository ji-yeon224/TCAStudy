//
//  TabFeature.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import ComposableArchitecture

@Reducer
struct TabFeature {
  struct State: Equatable {
  }
  
  enum Action {
  }
  var body: some ReducerOf<Self> {
//    Scope(state: \.tab1, action: \.tab1) {
//      CounterFeature()
//    }
//    Scope(state: \.tab2, action: \.tab2) {
//      ContactsFeature()
//    }
//    Scope(state: \.tab3, action: \.tab3) {
//      RootFeature()
//    }._printChanges()
    Reduce { state, action in
      return .none
    }
  }
}

