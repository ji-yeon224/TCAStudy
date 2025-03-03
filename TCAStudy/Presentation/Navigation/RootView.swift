//
//  RootView.swift
//  TCAStudy
//
//  Created by Jiyeon on 2/28/25.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
  @Bindable var store: StoreOf<RootFeature>
  
  var body: some View {
    NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
      VStack {
        Text(store.userInfo)
        Button("View1_1stView") {
          store.send(.pushToFeature(.first))
        }
        .buttonStyle()
        
        Button("View2_4thView") {
          store.send(.pushToFeature(.fourth))
        }
        .buttonStyle()
      }
    } destination: { store in
      NavigationHandler(store: store)
    }
    .onAppear {
      store.send(.getUserInfo)
    }
    
  }
  
}


@Reducer
struct RootFeature {
  @ObservableState
  struct State: Equatable {
    var path = StackState<PathFeature.State>()
    var userInfo: String = ""
  }
  
  enum Action {
    case getUserInfo
    case path(StackActionOf<PathFeature>)
    case pushToFeature(FeatureType)
  }
  
  @Dependency(\.userInfoUseCase) var userInfoUseCase
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .getUserInfo:
        state.userInfo = userInfoUseCase.getUserInfo()
        return .none
      case let .pushToFeature(featureType):
        state.path.append(featureType.toPathState())
        return .none
      case .path(.element(id: _, action: .firstFeature(.delegate(.push)))):
        state.path.append(FeatureType.second.toPathState())
        return .none
      case .path(.element(id: _, action: .secondFeature(.delegate(.push)))):
        state.path.append(FeatureType.third.toPathState())
        return .none
      case .path:
        return .none
        
      }
    }
    .forEach(\.path, action: \.path)
  }
  
}






#Preview {
  RootView(store: Store(initialState: RootFeature.State(), reducer: {
    RootFeature()
  }))
}

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.caption)
      .padding()
      .background(Color.black.opacity(0.1))
      .cornerRadius(10)
      .foregroundStyle(.black)
  }
}

extension View {
  func buttonStyle() -> some View {
    modifier(ButtonModifier())
  }
}
