//
//  PullToRefreshView.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/15.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import SwiftUI

struct PullToRefreshView: View {
    
    struct Item: Identifiable {
        let id = UUID()
        let color: Color
        let contentHeight: CGFloat
    }
    
    @State private var items: [Item] = []
    @State private var headerRefreshing: Bool = false
    @State private var footerRefreshing: Bool = false
    @State private var noMore: Bool = false
    
    var body: some View {
        ScrollView {
            if items.count > 0 {
                RefreshHeader(refreshing: $headerRefreshing, action: {
                    self.reload()
                }) { progress in
                    if self.headerRefreshing {
                        SimpleRefreshingView()
                    } else {
                        SimplePullToRefreshView(progress: progress)
                    }
                }
            }
            
            ForEach(items) { item in
                SimpleCell(item: item)
            }
             
            if items.count > 0 {
                RefreshFooter(refreshing: $footerRefreshing, action: {
                    self.loadMore()
                }) {
                    if self.noMore {
                        Text("No more data !")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        SimpleRefreshingView()
                            .padding()
                    }
                }
                .noMore(noMore)
                .preload(offset: 50)
            }
        }
        .enableRefresh()
        .overlay(Group {
            if items.count == 0 {
                ActivityIndicator(style: .medium)
            } else {
                EmptyView()
            }
        })
        .onAppear { self.reload() }
    }
    
    func reload() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.items = PullToRefreshView.generateItems(count: 20)
            self.headerRefreshing = false
            self.noMore = false
        }
    }
    
    func loadMore() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.items += PullToRefreshView.generateItems(count: 10)
            self.footerRefreshing = false
            self.noMore = self.items.count > 50
        }
    }
}

extension PullToRefreshView {
    
    static func generateItems(count: Int) -> [Item] {
        (0 ..< count).map { _ in
            Item(
                color: Color(
                    red: Double.random(in: 0 ..< 255) / 255,
                    green: Double.random(in: 0 ..< 255) / 255,
                    blue: Double.random(in: 0 ..< 255) / 255
                ),
                contentHeight: CGFloat.random(in: 100 ..< 200)
            )
        }
    }
}


struct PullToRefreshView_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshView()
    }
}
