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
    
    // MARK: BODY -
    
    var body: some View {
        Text(quoteText)
            .font(.body)
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}

// MARK: PREVIEW -

struct QuoteCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCardView(quoteText: "This is test")
            .previewLayout(.sizeThatFits)
    }
}
