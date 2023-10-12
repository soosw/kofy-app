//
//  HomeView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 04/10/23.
//

import SwiftUI

enum TabItems: Int, CaseIterable {
    case home = 0
    case history
    case add
    case doctors
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Diario"
        case .history:
            return "Historial"
        case .add:
            return "add"
        case .doctors:
            return "Doctores"
        case .profile:
            return "Perfil"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .history:
            return "list.bullet.clipboard"
        case .add:
            return "plus"
        case .doctors:
            return "staroflife"
        case .profile:
            return "person.fill"
        }
    }
}

extension HomeView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
            VStack(spacing: 10) {
                Spacer()
                
                Image(systemName: imageName)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(isActive ? .blue : .gray)
                    .frame(width: 25, height: 25)
                
                Text(title)
                    .font(.system(size: 13))
                    .foregroundColor(isActive ? .blue : .gray)
                
                Spacer()
            }
            .frame(width: .infinity , height: 60)
    }
    
    func CustomAddButton(imageName: String, title: String, isActive: Bool) -> some View {
            ZStack{
                Image(systemName: imageName)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
            }
            .padding()
            .background(.red)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .frame(width: .infinity , height: 60)
    }
}


struct HomeView: View {
    @State var popupIsShown = false
    @State var selectedTab = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    DailyView()
                        .tag(0)
                    
                    HistoryListView()
                        .tag(1)
                    
                    DoctorListView()
                        .tag(3)
                    
                    ProfileView()
                        .tag(4)
                }
                .ignoresSafeArea(.keyboard, edges: .bottom)
                
                ZStack {
                    HStack(spacing: 31) {
                        ForEach((TabItems.allCases), id: \.self) { item in
                            Button {
                                if (item.title != "add") {
                                    selectedTab = item.rawValue
                                } else {
                                    popupIsShown = true
                                }
                            } label: {
                                if (item.title != "add") {
                                    CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                                } else {
                                    CustomAddButton(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                                }
                            }
                            .sensoryFeedback(trigger: popupIsShown) { oldValue, newValue in
                                return .impact(flexibility: .solid, intensity: 0.5)
                            }
                        }
                    }
                    .frame(width: geometry.size.width)
                    .padding([.top], 6)
                }
                .background(.ultraThinMaterial)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .frame(width: geometry.size.width)
            .popup(isPresented: $popupIsShown) {
                BottomPopupView {
                    NewSessionPopupView(popupIsShown: $popupIsShown)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
