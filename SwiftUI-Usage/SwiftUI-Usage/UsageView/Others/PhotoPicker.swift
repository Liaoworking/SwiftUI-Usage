//
//  PhotoPicker.swift
//  SwiftUI-Usage
//
//  Created by Run Liao on 2019/9/22.
//  Copyright © 2019 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Photos

struct ImagePickerDemo: View {
    
    @State var isShown: Bool = false
    @State var upperImage: Image = Image(systemName: "lightbulb.fill")
    
    var body: some View {
        VStack {
            upperImage.resizable().frame(width: 200, height: 200, alignment: .center)
            Button(action: {
                self.isShown.toggle()
            }) {
                Text("showImagePicker")
            }.sheet(isPresented: $isShown) {
                ImagePicker(isShown: self.$isShown, image: self.$upperImage)
            }
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {

@Binding var isShown: Bool
@Binding var image: Image

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @Binding var isShown: Bool
    @Binding var image: Image

    init(isShown: Binding<Bool>, image: Binding<Image>) {
        _isShown = isShown
        _image = image
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        image = Image(uiImage: uiImage)
        isShown = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShown = false
    }
}

    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

}


#if DEBUG
struct ImagePickerDemo_Preview: PreviewProvider {
    static var previews: ImagePickerDemo {
        return ImagePickerDemo()
    }
}
#endif
