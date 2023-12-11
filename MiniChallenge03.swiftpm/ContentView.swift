import SwiftUI
import SpriteKit

struct ContentView: View {
    @State var currentScene: SKScene = LoveScene(size: CGSize(width: 1194, height: 834))
    
    var body: some View {
        SpriteView(scene: currentScene)
            .ignoresSafeArea()
    }
}
