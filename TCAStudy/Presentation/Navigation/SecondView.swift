//
//  SecondView.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
  let store: StoreOf<SecondFeature>
  
  var body: some View {
    ZStack {
      Color.brown
      VStack {
        Text("Second View")
        Spacer()
          .frame(height: 30)
        
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

//#Preview {
//    SecondView()
//}

@Reducer
struct SecondFeature {
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
        return .run { send in
          await send(.delegate(.push))
        }
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
