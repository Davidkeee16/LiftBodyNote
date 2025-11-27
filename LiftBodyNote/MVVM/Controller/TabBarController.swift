//
//  TabBarController.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 27/11/2025.
//

import SwiftUI

// MARK: - AppTabs

enum TabBar: Hashable {
    case home
    case catalog
    case body
    case calendar
    case progress
}

struct TabBarController: View {
    
    // MARK: - State
    
    @State private var selectedTab: TabBar = .home
    
    // MARK: - Body
    var body: some View {
        TabView(selection: $selectedTab) {
            // MARK: - HomeTab
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Image(selectedTab == .home ? "HomeTabBold" : "HomeTab")
            }
            .tag(TabBar.home)
            
            // MARK: - CatalogTab
            NavigationStack {
                CatalogView()
            }
            .tabItem {
                
                Image(selectedTab == .catalog ? "CatalogTabBold" : "CatalogTab")
                Text("Catalog")
            }
            .tag(TabBar.catalog)
            
            // MARK: - BodyTab
            NavigationStack {
                
            }
            .tabItem {
                Image(selectedTab == .body ? "BodyTabBold" :"BodyTab")
                Text("Body")
            }
            .tag(TabBar.body)
            
            // MARK: - CalendarTab
            NavigationStack {
                
            }
            .tabItem {
                Image(selectedTab == .calendar ? "CalendarTabBold" : "CalendarTab")
            }
            .tag(TabBar.calendar)
            // MARK: - ProgressTab
            NavigationStack {
                
            }
            .tabItem {
                Image(selectedTab == .progress ? "ProgressTabBold" : "ProgressTab")
            }
            .tag(TabBar.progress)
        }
    }
}

#Preview {
    TabBarController()
}
