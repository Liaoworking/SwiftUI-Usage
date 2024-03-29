////
////  SnapCarouselView.swift
////  SwiftUI-Usage
////
////  Created by Run Liao on 2020/5/31.
////  Copyright © 2020 Run Liao. All rights reserved.
////
//
//// original Source Code: https://gist.github.com/xtabbas/97b44b854e1315384b7d1d5ccce20623
//
//import SwiftUI
//
//struct SnapCarousel: View {
//    @EnvironmentObject var UIState: UIStateModel
//    
//    var body: some View {
//        let spacing: CGFloat = 0
//        let widthOfHiddenCards: CGFloat = 0 /// UIScreen.main.bounds.width - 10
//        let cardHeight: CGFloat = 279
//        
//        let items = [
//            Card(id: 0, name: "Hey"),
//            Card(id: 1, name: "Ho"),
////            Card(id: 2, name: "Lets"),
////            Card(id: 3, name: "Go")
//        ]
//        
////        return Canvas {
////            /// TODO: find a way to avoid passing same arguments to Carousel and Item
////            Carousel(
////                numberOfItems: CGFloat(items.count),
////                spacing: spacing,
////                widthOfHiddenCards: widthOfHiddenCards
////            ) {
////                ForEach(items, id: \.self.id) { item in
////                    Item(
////                        _id: Int(item.id),
////                        spacing: spacing,
////                        widthOfHiddenCards: widthOfHiddenCards,
////                        cardHeight: cardHeight
////                    ) {
////                        HStack {
////                            Text("\(item.name)")
////                            Image(systemName: "wifi")
////                        }
////                    }
////                    .foregroundColor(Color.white)
////                    .background(Color.green)
////                    .cornerRadius(8)
////                    .shadow(color: Color("shadow1"), radius: 4, x: 0, y: 4)
////                    .transition(AnyTransition.slide)
////                    .animation(.spring())
////                }
////
////            }
////        }
//        return HStack {
//            Carousel(
//                numberOfItems: CGFloat(items.count),
//                spacing: spacing,
//                widthOfHiddenCards: widthOfHiddenCards
//            ) {
//                ForEach(items, id: \.self.id) { item in
//                    Item(
//                        _id: Int(item.id),
//                        spacing: spacing,
//                        widthOfHiddenCards: widthOfHiddenCards,
//                        cardHeight: cardHeight
//                    ) {
//                        HStack {
//                            Text("\(item.name)")
//                            Image(systemName: "wifi")
//                        }
//                    }
//                    .foregroundColor(Color.white)
//                    .background(Color.green)
//                    .cornerRadius(8)
//                    .shadow(color: Color("shadow1"), radius: 4, x: 0, y: 4)
//                    .transition(AnyTransition.slide)
//                    .animation(.spring())
//                }
//            }
//        }
//    }
//}
//
//struct Card: Decodable, Hashable, Identifiable {
//    var id: Int
//    var name: String = ""
//}
//
//public class UIStateModel: ObservableObject {
//    @Published var activeCard: Int = 0
//    @Published var screenDrag: Float = 0.0
//    @Published var screenDragOffsetY: Float = 0.0
//
//}
//
//struct Carousel<Items : View> : View {
//    let items: Items
//    let numberOfItems: CGFloat //= 8
//    let spacing: CGFloat //= 16
//    let widthOfHiddenCards: CGFloat //= 32
//    let totalSpacing: CGFloat
//    let cardWidth: CGFloat
//    
//    @GestureState var isDetectingLongPress = false
//    
//    @EnvironmentObject var UIState: UIStateModel
//        
//    @inlinable public init(
//        numberOfItems: CGFloat,
//        spacing: CGFloat,
//        widthOfHiddenCards: CGFloat,
//        @ViewBuilder _ items: () -> Items) {
//        
//        self.items = items()
//        self.numberOfItems = numberOfItems
//        self.spacing = spacing
//        self.widthOfHiddenCards = widthOfHiddenCards
//        self.totalSpacing = (numberOfItems - 1) * spacing
//        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
//        
//    }
//    
//    var body: some View {
//        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
//        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
//        let leftPadding = widthOfHiddenCards + spacing
//        let totalMovement = cardWidth + spacing
//                
//        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
//        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)
//
//        var calcOffset = Float(activeOffset)
//        
//        if (calcOffset != Float(nextOffset)) {
//            calcOffset = Float(activeOffset) + UIState.screenDrag
//        }
//        
//        return HStack(alignment: .center, spacing: spacing) {
//            items
//        }
//        .offset(x: CGFloat(calcOffset), y: CGFloat(UIState.screenDragOffsetY))
//        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
//            print(currentState.translation.width)
//            self.UIState.screenDrag = Float(currentState.translation.width)
//            self.UIState.screenDragOffsetY = Float(currentState.translation.height)
//        }.onEnded { value in
//            self.UIState.screenDrag = 0
//            self.UIState.screenDragOffsetY = 0
//            if (value.translation.width < -50) {
//                print("🐔\(self.UIState.activeCard)")
//                if self.UIState.activeCard == Int(self.numberOfItems - 1) {
//                    return
//                }
//                self.UIState.activeCard = self.UIState.activeCard + 1
//                let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                impactMed.impactOccurred()
//            }
//            
//            if (value.translation.width > 50) {
//                print("🐶\(self.UIState.activeCard)")
//                if self.UIState.activeCard == 0 {
//                    return
//                }
//                self.UIState.activeCard = self.UIState.activeCard - 1
//                let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                impactMed.impactOccurred()
//            }
//        })
//    }
//}
//
//struct Canvas<Content : View> : View {
//    let content: Content
//    @EnvironmentObject var UIState: UIStateModel
//    
//    @inlinable init(@ViewBuilder _ content: () -> Content) {
//        self.content = content()
//    }
//    
//    var body: some View {
//        content
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//            .background(Color.red.edgesIgnoringSafeArea(.all))
//    }
//}
//
//struct Item<Content: View>: View {
//    @EnvironmentObject var UIState: UIStateModel
//    let cardWidth: CGFloat
//    let cardHeight: CGFloat
//
//    var _id: Int
//    var content: Content
//
//    @inlinable public init(
//        _id: Int,
//        spacing: CGFloat,
//        widthOfHiddenCards: CGFloat,
//        cardHeight: CGFloat,
//        @ViewBuilder _ content: () -> Content
//    ) {
//        self.content = content()
//        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
//        self.cardHeight = cardHeight
//        self._id = _id
//    }
//
//    var body: some View {
//        content
//            .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight, alignment: .center)
//    }
//}
//
//struct SnapCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        SnapCarousel()
//    }
//}
