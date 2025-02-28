//
//  ThirdView.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import ComposableArchitecture
import SwiftUI

struct ThirdView: View {
  let store: StoreOf<ThirdFeature>
  
  var body: some View {
    ZStack {
      Color.purple
      VStack {
        Text("ThirdView")
        Spacer()
          .frame(height: 30)
        Button("pop") {
          store.send(.pop)
        }
        .buttonStyle()
      }
    }
  }
}

@Reducer
struct ThirdFeature {
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
