//
//  AuthorQuoteListView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 20/06/21.
//

import SwiftUI

struct AuthorQuoteListView: View {
    
    // MARK: PROPERTIES -
    
    @ObservedObject var quotesVM = QuotesViewModel()
    var authorSlug: String
    var authorName: String
    var totalQuotes: Int
    private var gridItemLayout = [GridItem(.flexible())]
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.colorScheme) var colorScheme
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image("back")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            }
        }
    }
    
    init(authorSlug: String , authorName: String , totalQuotes: Int) {
        self.authorSlug = authorSlug
        self.authorName = authorName
        self.totalQuotes = totalQuotes
        self.quotesVM.fetchQuoteWithAuthorSlug(with: self.authorSlug, for: 1)
    }
    
    // MARK: BODY -
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 12) {
                if let quotes = quotesVM.quoteModel?.results {
                    ForEach(quotes) { quote in
                        QuoteCardView(quoteText: quote.content, author: "", authorVisible: false)
                    }
                    .offset(y: 12)
                    if let quoteTotalCount = quotesVM.quoteModel?.totalCount {
                        if quoteTotalCount > quotes.count {
                            ProgressView()
                                .padding()
                                .progressViewStyle(CircularProgressViewStyle())
                                .onAppear(perform: {
                                    if let page = quotesVM.quoteModel?.page {
                                        self.quotesVM.fetchQuoteWithAuthorSlug(with: self.authorSlug, for: page + 1)
                                    }
                                })
                        }
                    }
                }
            } //: LAZYVGRID
        } //: SCROLLVIEW
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack(alignment: .center, spacing: 0){
                    Text(authorName)
                        .font(.custom(Constants.fontBlack, size: 16))
                    Text("\(totalQuotes)")
                        .font(.custom(Constants.fontRegular, size: 14))
                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.7) : .black.opacity(0.5))
                }
            }
        }
    }
}

struct AuthorQuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorQuoteListView(authorSlug: "" , authorName: "" , totalQuotes: 0)
    }
}
