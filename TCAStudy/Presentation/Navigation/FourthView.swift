//
//  FourthView.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import SwiftUI
import ComposableArchitecture

struct FourthView: View {
  let store: StoreOf<FourthFeature>
  
    var body: some View {
      VStack {
        Text("4th view")
        Button("pop") {
          store.send(.pop)
        }
        .buttonStyle()
      }
    }
}

@Reducer
struct FourthFeature {
  @ObservableState
  struct State: Equatable {
    
  }
  
  enum Action {
    case pop
  }
  
  @Dependency(\.dismiss) var dismiss
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .pop:
        return .run { _ in
          await self.dismiss()
        }
      }
    }
  }
}
