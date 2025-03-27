//
//  SystemCameraViewDemo.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2025/3/27.
//  Copyright © 2025 Run Liao. All rights reserved.
//

import SwiftUI
import AVFoundation

struct SystemCameraViewDemo: View {
    @State private var showCamera = false
    @State private var previewImage: UIImage?
    @State private var videoURL: URL?
    
    var body: some View {
        VStack {
            if let image = previewImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            
//            if let url = videoURL {
//                VideoPlayer(player: AVPlayer(url: url))
//                    .frame(height: 300)
//            }
            
            Button("打开相机") {
                showCamera.toggle()
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            SystemCameraView(
                mediaTypes: [.photo, .video],
                onMediaPicked: { result in
                    switch result {
                    case .success(let media):
                        switch media {
                        case .photo(let image):
                            previewImage = image
//                            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        case .video(let url):
                            videoURL = url
//                            UISaveVideoAtPathToSavedPhotosAlbum(url.path, nil, nil, nil)
                        }
                    case .failure(let error):
                        print("错误: \(error)")
                    }
                }
            ).ignoresSafeArea()
        }
    }
}

#Preview {
    SystemCameraViewDemo()
}
