//
//  CustomTagView.swift
//  eGym-app
//
//  Created by Eduard Ferré Sánchez on 14/2/24.
//

import SwiftUI

struct CustomTagView: Layout {
    var alignment: Alignment = .leading
    var spacing: CGFloat = 10
    init(alignment: Alignment, spacing: CGFloat) {
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return .init(width: proposal.width ?? 0, height: proposal.height ?? 0)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var origin = bounds.origin
        let maxWidth = bounds.width
        
        var row: ([LayoutSubviews.Element], Double) = ([], 0.0)
        var rows: [([LayoutSubviews.Element], Double)] = []
        
        for view in subviews {
            let viewSize = view.sizeThatFits(proposal)
            if (origin.x + viewSize.width + spacing) > maxWidth {
                row.1 = (bounds.maxX - origin.x + bounds.minX + spacing)
                rows.append(row)
                row.0.removeAll()
                origin.x = bounds.origin.x
                row.0.append(view)
                origin.x += (viewSize.width + spacing)
            } else {
                row.0.append(view)
                origin.x += (viewSize.width + spacing)
            }
        }
        
        if !row.0.isEmpty {
            row.1 = (bounds.maxX - origin.x + bounds.minX + spacing)
            rows.append(row)
        }
        origin = bounds.origin
        
        for row in rows {
            origin.x = (alignment == .leading ? bounds.minX : (alignment == .trailing ? row.1 : row.1 / 2))
            for view in row.0 {
                let viewSize = view.sizeThatFits (proposal)
                view.place (at: origin, proposal: proposal)
                origin.x += (viewSize.width + spacing)
            }
            let maxHeight = row.0.compactMap{ view -> CGFloat? in
                return view.sizeThatFits(proposal).height
            }.max() ?? 0
            origin.y += (maxHeight + spacing)
        }
    }
}
