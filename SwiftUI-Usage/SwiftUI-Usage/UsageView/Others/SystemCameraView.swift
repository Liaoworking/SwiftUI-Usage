import SwiftUI
import AVFoundation
import UIKit
import MobileCoreServices

// MARK: - 统一媒体结果类型
enum MediaResult {
    case photo(UIImage)
    case video(URL)
}

// MARK: - SwiftUI 相机控件
struct SystemCameraView: UIViewControllerRepresentable {
    // 配置参数
    var mediaTypes: [MediaType] = [.photo] // 支持的类型（.photo 或 .video）
    var videoQuality: UIImagePickerController.QualityType = .typeHigh // 视频质量
    var allowsEditing: Bool = false // 是否允许编辑
    
    // 统一回调闭包
    var onMediaPicked: ((Result<MediaResult, CameraError>) -> Void)?
    
    // 错误类型
    enum CameraError: Error {
        case noCameraAvailable
        case permissionDenied
        case mediaTypeNotSupported
    }
    
    // 支持的媒体类型
    enum MediaType {
        case photo
        case video
    }
    
    // MARK: - Coordinator 处理代理
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: SystemCameraView
        
        init(parent: SystemCameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 统一处理媒体结果
            let result: Result<MediaResult, CameraError>
            
            if let image = info[.originalImage] as? UIImage {
                result = .success(.photo(image))
            } else if let videoURL = info[.mediaURL] as? URL {
                result = .success(.video(videoURL))
            } else {
                result = .failure(.mediaTypeNotSupported)
            }
            
            parent.onMediaPicked?(result)
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    // MARK: - 创建 UIKit 控制器
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        // 配置媒体类型
        let utTypes = mediaTypes.map { type -> String in
            switch type {
            case .photo: return UTType.image.identifier
            case .video: return UTType.movie.identifier
            }
        }
        
        // 检查权限和设备支持
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            onMediaPicked?(.failure(.noCameraAvailable)) // 取消视为权限拒绝
            return picker
        }
        
        guard UIImagePickerController.availableMediaTypes(for: .camera)?.contains(where: { utTypes.contains($0) }) == true else {
            onMediaPicked?(.failure(.mediaTypeNotSupported)) // 取消视为权限拒绝
            return picker
        }
        
        // 动态请求权限
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if !granted {
                DispatchQueue.main.async {
                    onMediaPicked?(.failure(.permissionDenied)) // 取消视为权限拒绝
                }
            }
        }
        
        // 配置相机参数
        picker.sourceType = .camera
        picker.mediaTypes = utTypes
        picker.videoQuality = videoQuality
        picker.allowsEditing = allowsEditing
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

