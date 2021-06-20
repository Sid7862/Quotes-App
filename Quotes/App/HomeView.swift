//
//  HomeView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var quotesVM = QuotesViewModel()
    private var gridItemLayout = [GridItem(.flexible())]
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: Constants.fontBlack, size: 20)!]
        self.quotesVM.fetchQuote(for: 1)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if let quotes = quotesVM.quoteModel?.results {
                    ForEach(quotes) { quote in
                        NavigationLink(destination: QuoteDetailView(data: quote)) {
                            QuoteCardView(quoteText: quote.content , author: quote.author)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .offset(y: 12)
                    if let quoteTotalCount = quotesVM.quoteModel?.totalCount {
                        if quoteTotalCount > quotes.count {
                            ProgressView()
                                .padding()
                                .progressViewStyle(CircularProgressViewStyle())
                                .onAppear(perform: {
                                    if let page = quotesVM.quoteModel?.page {
                                        self.quotesVM.fetchQuote(for: page + 1)
                                    }
                                })
                        }
                    }
                }
            } //: LAZYVGRID
        } //: SCROLLVIEW
    }
}

// MARK: PREVIEW -

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
