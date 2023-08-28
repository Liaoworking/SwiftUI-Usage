// Authoer: The SwiftUI Lab
// Full article: https://swiftui-lab.com/scrollview-pull-to-refresh/
import SwiftUI

struct PullToRefreshDemo: View {
    @ObservedObject var model = MyModel()
    @State private var alternate: Bool = true
    
    let array = Array<String>(repeating: "Hello", count: 100)
    let transaction = Transaction(animation: .easeInOut(duration: 2.0))
    
    var body: some View {
        
        return VStack(spacing: 0) {
//            HeaderView(title: "Dog Roulette")
            
            RefreshableScrollView(height: 10, refreshing: self.$model.loading) {
                
                DogView(dog: self.model.dog).padding(30).background(Color(UIColor.systemBackground))
                
            }.background(Color(UIColor.secondarySystemBackground))
        }
    }
    
    struct HeaderView: View {
        var title = ""
        
        var body: some View {
            VStack {
                Color(UIColor.systemBackground).frame(height: 30).overlay(Text(self.title))
                Color(white: 0.5).frame(height: 3)
            }
        }
    }
    
    struct DogView: View {
        let dog: Dog
        
        var body: some View {
            VStack {
                Image(dog.picture, defaultSystemImage: "questionmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 160)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .padding(2)
                    .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
                    .shadow(radius: 3)
                    .padding(4)
                
                Text(dog.name).font(.largeTitle).fontWeight(.bold)
                Text(dog.origin).font(.headline).foregroundColor(.blue)
                Text(dog.description)
                    .lineLimit(nil)
                    .frame(height: 1000, alignment: .top)
                    .padding(.top, 20)
            }
        }
    }
}

extension Image {
    init(_ name: String, defaultImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(defaultImage)
        }
    }
    
    init(_ name: String, defaultSystemImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(systemName: defaultSystemImage)
        }
    }
    
}



struct Dog: Identifiable {
    let id = UUID()
    let name:String
    let picture: String
    let origin: String
    var description: String = ""
}

let dogs: [Dog] = [
    Dog(name: "Airedale Terrier", picture: "airedale-terrier", origin: "United Kingdom", description: "The Airedale Terrier (often shortened to 'Airedale'), also called Bingley Terrier and Waterside Terrier, is a dog breed of the terrier type that originated in the valley (dale) of the River Aire, in the West Riding of Yorkshire, England.[1] It is traditionally called the 'King of Terriers' because it is the largest of the terrier breeds. The Airedale was bred from the Old English Black and Tan Terrier (now known as the Welsh Terrier), the Bull Terrier, the Otterhound and probably some other Terrier breeds, and has contributed to other dog breeds, such as the Yorkshire Terrier. Originally to serve as a versatile hunting and all around working farm dog, in Britain this breed has also been used as a war dog, guide dog and police dog. In the United States, this breed has been used to hunt big game, upland birds, and water fowl, and serve in many other working capacities."),
    Dog(name: "Alaskan Malamute", picture: "alaskan-malamute", origin: "Alaska", description: "Although it is believed that the first dogs arrived in the Americas 12,000 years ago, people and their dogs did not settle in the Arctic until the Paleo-Eskimo people 4,500 years ago, followed by the Thule people 1,000 years ago, with both originating from Siberia.[2] Malamutes were thought to be bred by the Malemiut Inupiaq people of Alaska's Norton Sound region"),
    Dog(name: "Basset Hound", picture: "basset-hound", origin: "France", description: "The Basset Hound is a short-legged breed of dog in the hound family. The Basset is a scent hound that was originally bred for the purpose of hunting hare. Their sense of smell and ability to ground-scent is second only to the Bloodhound.[1] Basset Hounds are one of six recognised 'basset'-type breeds in France. The name basset is derived from the French word bas, meaning 'low', with the attenuating suffix -et—together meaning 'rather low'. Basset Hounds are usually bicolours or tricolours of standard hound colouration."),
    Dog(name: "Dogo Argentino", picture: "dogo-argentino", origin: "Argentina", description: "The Dogo Argentino is a large, white, muscular breed of dog that was developed in Argentina primarily for the purpose of big-game hunting, including wild boar.[1][2] The breeder, Antonio Nores Martínez, also wanted a dog that would exhibit steadfast bravery and willingly protect its human companion. It was first bred in 1928 from the Cordoba Dog, along with a wide array of other breeds, including the Great Dane"),
    Dog(name: "Irish Setter", picture: "irish-setter", origin: "Ireland", description: "The Irish Setter (Irish: sotar rua,[1] literally 'red setter') is a setter, a breed of gundog, and family dog. The term Irish Setter is commonly used to encompass the show-bred dog recognised by the American Kennel Club as well as the field-bred Red Setter recognised by the Field Dog Stud Book."),
    Dog(name: "Samoyed Dog", picture: "samoyed", origin: "Northern Russia", description: "The Samoyed (/ˈsæməjɛd/ SAM-ə-yed or /səˈmɔɪ.ɛd/ sə-MOY-ed;[1] Russian: Самое́дская соба́ка or Самое́д) is a breed of large herding dog that descended from the Nenets herding laika, a spitz-type dog, with a thick, white, double-layer coat. It takes its name from the Samoyedic peoples of Siberia. These nomadic reindeer herders bred the fluffy white dogs to help with the herding. An alternative name for the breed, especially in Europe, is Bjelkier.")
]

class MyModel: ObservableObject {
    @Published var loading: Bool = false {
        didSet {
            if oldValue == false && loading == true {
                self.load()
            }
        }
    }
    
    @Published var dog: Dog = dogs[0]
    
    var idx = 0
    
    func load() {
        // Simulate async task
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            
            // Next Dog
            self.idx = (self.idx+1) < dogs.count ? (self.idx+1) : 0
            
            self.loading = false
            
            self.dog = dogs[self.idx]
        }
    }
}


struct RefreshableScrollView<Content: View>: View {
    @State private var previousScrollOffset: CGFloat = 0
    @State private var scrollOffset: CGFloat = 0
    @State private var frozen: Bool = false
    @State private var rotation: Angle = .degrees(0)
    
    var threshold: CGFloat = 80
    @Binding var refreshing: Bool
    let content: Content

    init(height: CGFloat = 80, refreshing: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.threshold = height
        self._refreshing = refreshing
        self.content = content()

    }
    
    var body: some View {
        return VStack {
            ScrollView {
                ZStack(alignment: .top) {
//                    MovingView()
                    
                    VStack { self.content }.alignmentGuide(.top, computeValue: { d in (self.refreshing && self.frozen) ? -self.threshold : 0.0 })
                    
                    SymbolView(height: self.threshold, loading: self.refreshing, frozen: self.frozen, rotation: self.rotation)
                }
            }
            .background(FixedView())
            .onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
                self.refreshLogic(values: values)
            }
        }
    }
    
    func refreshLogic(values: [RefreshableKeyTypes.PrefData]) {
        DispatchQueue.main.async {
            // Calculate scroll offset
            let movingBounds = values.first { $0.vType == .movingView }?.bounds ?? .zero
            let fixedBounds = values.first { $0.vType == .fixedView }?.bounds ?? .zero
            
            self.scrollOffset  = movingBounds.minY - fixedBounds.minY
            
            self.rotation = self.symbolRotation(self.scrollOffset)
            
            // Crossing the threshold on the way down, we start the refresh process
            if !self.refreshing && (self.scrollOffset > self.threshold && self.previousScrollOffset <= self.threshold) {
                self.refreshing = true
            }
            
            if self.refreshing {
                // Crossing the threshold on the way up, we add a space at the top of the scrollview
                if self.previousScrollOffset > self.threshold && self.scrollOffset <= self.threshold {
                    self.frozen = true

                }
            } else {
                // remove the sapce at the top of the scroll view
                self.frozen = false
            }
            
            // Update last scroll offset
            self.previousScrollOffset = self.scrollOffset
        }
    }
    
    func symbolRotation(_ scrollOffset: CGFloat) -> Angle {
        
        // We will begin rotation, only after we have passed
        // 60% of the way of reaching the threshold.
        if scrollOffset < self.threshold * 0.60 {
            return .degrees(0)
        } else {
            // Calculate rotation, based on the amount of scroll offset
            let h = Double(self.threshold)
            let d = Double(scrollOffset)
            let v = max(min(d - (h * 0.6), h * 0.4), 0)
            return .degrees(180 * v / (h * 0.4))
        }
    }
    
    struct SymbolView: View {
        var height: CGFloat
        var loading: Bool
        var frozen: Bool
        var rotation: Angle
        
        
        var body: some View {
            Group {
                if self.loading { // If loading, show the activity control
                    VStack {
                        Spacer()
                        ActivityRep()
                        Spacer()
                    }.frame(height: height).fixedSize()
                        .offset(y: -height + (self.loading && self.frozen ? height : 0.0))
                } else {
                    Image(systemName: "arrow.down") // If not loading, show the arrow
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height * 0.25, height: height * 0.25).fixedSize()
                        .padding(height * 0.375)
                        .rotationEffect(rotation)
                        .offset(y: -height + (loading && frozen ? +height : 0.0))
                }
            }
        }
    }
    
    struct MovingView: View {
        var body: some View {
            GeometryReader { proxy in
                Color.clear.preference(key: RefreshableKeyTypes.PrefKey.self, value: [RefreshableKeyTypes.PrefData(vType: .movingView, bounds: proxy.frame(in: .global))])
            }.frame(height: 0)
        }
    }
    
    struct FixedView: View {
        var body: some View {
            GeometryReader { proxy in
                Color.clear.preference(key: RefreshableKeyTypes.PrefKey.self, value: [RefreshableKeyTypes.PrefData(vType: .fixedView, bounds: proxy.frame(in: .global))])
            }
        }
    }
}

struct RefreshableKeyTypes {
    enum ViewType: Int {
        case movingView
        case fixedView
    }

    struct PrefData: Equatable {
        let vType: ViewType
        let bounds: CGRect
    }

    struct PrefKey: PreferenceKey {
        static var defaultValue: [PrefData] = []

        static func reduce(value: inout [PrefData], nextValue: () -> [PrefData]) {
            value.append(contentsOf: nextValue())
        }

        typealias Value = [PrefData]
    }
}

struct ActivityRep: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<ActivityRep>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityRep>) {
        uiView.startAnimating()
    }
}
