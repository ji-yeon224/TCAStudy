//
//  FirstView.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
  let store: StoreOf<FirstFeature>
  
  var body: some View {
    ZStack {
      Color.yellow
      VStack {
        Text("FirstView")
        Button("push") {
          store.send(.push)
        }
        .buttonStyle()
        Button("pop") {
          store.send(.pop)
        }
        .buttonStyle()
      }
    }
  }
}

@Reducer
struct FirstFeature {
  @ObservableState
  struct State: Equatable {
    
  }
  
  enum Action {
    case push
    case pop
    case delegate(Delegate)
    enum Delegate {
      case push
    }
  }
  
  @Dependency(\.dismiss) var dismiss
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .push:
        return .send(.delegate(.push))
      case .pop:
        return .run { _ in
          await self.dismiss()
        }
      case .delegate:
        return .none
        
      }
    }
  }
}
