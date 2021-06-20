//
//  QuoteCardView.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 18/06/21.
//

import SwiftUI

struct QuoteCardView: View {
    
    // MARK: PROPERTIES -
    
    var quoteText: String = ""
    var author: String = ""
    var authorVisible: Bool = true
    
    // MARK: BODY -
    
    var body: some View {
        VStack {
            HStack {
                
                let quoteContent =
                Text("\" ")
                    .font(.custom(Constants.fontBlackItalic, size: 25))
                + Text(quoteText)
                    .font(.custom(Constants.fontBold, size: 20))
                
                quoteContent
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: authorVisible ? 5 : 15, trailing: 15))
                
                Spacer()
            }
            if authorVisible {
                HStack {
                    Spacer()
                    Text("- \(author)")
                        .font(.custom(Constants.fontItalic, size: 17))
                        .padding(EdgeInsets(top: 5, leading: 15, bottom: 15, trailing: 15))
                }
            }
        }
        .background(Constants.appSecondary)
        .cornerRadius(5)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

// MARK: PREVIEW -

struct QuoteCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCardView(quoteText: "This is test" , author: "Albert Einstien")
            .previewLayout(.sizeThatFits)
    }
}
