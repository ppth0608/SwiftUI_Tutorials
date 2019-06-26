/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view displaying inforamtion about a hike, including an elevation graph.
*/

import SwiftUI

/*
 When you use the animation(_:) modifier on a view, SwiftUI animates any changes to animatable properties of the view. A view’s color, opacity, rotation, size, and other properties are all animatable.
 */

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        /*
         Use the asymmetric(insertion:removal:) modifier to provide different transitions for when the view appears and disappears.
         */
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale()
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                    .animation(nil)
                
                VStack(alignment: .leading) {
                    Text(verbatim: hike.name)
                        .font(.headline)
                    Text(verbatim: hike.distanceText)
                }
                
                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        /*
                         Try turning off animation for the rotation by adding another animation modifier just above the scaleEffect modifier.
                         */
//                        .animation(nil)
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        /*
                         SwiftUI includes basic animations with predefined or custom easing, as well as spring and fluid animations. You can adjust an animation’s speed, set a delay before an animation starts, or specify that an animation repeats.
                         */
                        .animation(.spring())
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}

#if DEBUG
struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: hikeData[0])
                .padding()
            Spacer()
        }
    }
}
#endif
