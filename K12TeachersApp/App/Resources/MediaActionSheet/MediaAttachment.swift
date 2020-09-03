//
//  AttachmentGlobal.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 25/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices
import AVFoundation
import Photos


class MediaAttachment: NSObject, UIDocumentMenuDelegate, UIDocumentPickerDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    static let shared = MediaAttachment()
    fileprivate var currentVC: UIViewController?
    
//    let audioRecorder = AudioRecorder()
    
    //MARK: - Internal Properties
    var imagePickedBlock: ((_ image : UIImage , _ fileExtension : String , _ mimetype : String) -> Void)?
    var videoPickedBlock: ((_ url : NSURL , _ fileExtension : String , _ mimetype : String) -> Void)?
    var filePickedBlock: ((URL) -> Void)?
    
    
    override init(){
        super.init()
    }
    
    enum AttachmentType: String{
        case camera, videoRecord, video, photoLibrary
    }
    
    
    //MARK: - Constants
    struct Constants {
        static let actionFileTypeHeading = "Add a File"
        static let actionFileTypeDescription = "Choose a filetype to add..."
        static let camera = "Camera"
        static let phoneLibrary = "Gallery"
        static let videoRecord = "Video Recorder"
        static let video = "Video"
        static let audioRecord = "Audio"
        static let file = "File"
        
        
        static let alertForPhotoLibraryMessage = "App does not have access to your photos. To enable access, tap settings and turn on Photo Library Access."
        
        static let alertForCameraAccessMessage = "App does not have access to your camera. To enable access, tap settings and turn on Camera."
        
        static let alertForVideoLibraryMessage = "App does not have access to your video. To enable access, tap settings and turn on Video Library Access."
        
        
        static let settingsBtnTitle = "Settings"
        static let cancelBtnTitle = "Cancel"
        
    }
    
    
    
    //MARK: - showAttachmentActionSheet
    // This function is used to show the attachment sheet for image, video, photo and file.
    func showAttachmentActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: Constants.actionFileTypeHeading, message: Constants.actionFileTypeDescription, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: Constants.camera, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .camera, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: Constants.phoneLibrary, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .photoLibrary, vc: self.currentVC!)
        }))
        
        actionSheet.addAction(UIAlertAction(title: Constants.video, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .video, vc: self.currentVC!)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: Constants.videoRecord, style: .default, handler: { (action) -> Void in
            self.authorisationStatus(attachmentTypeEnum: .videoRecord, vc: self.currentVC!)
            
        }))
       
//        actionSheet.addAction(UIAlertAction(title: Constants.audioRecord, style: .default, handler: { (action) -> Void in
//
//            self.currentVC!.navigationController?.setNavigationBarHidden(true, animated: false)
//            self.currentVC?.view.addSubview(self.audioRecorder)
//            self.audioRecorder.setAnchor(top: self.currentVC?.view.topAnchor, left: self.currentVC?.view.leftAnchor, bottom: self.currentVC?.view.bottomAnchor, right: self.currentVC?.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//
//            self.audioRecorder.currentVC = self.currentVC
//
//        }))
        
        actionSheet.addAction(UIAlertAction(title: Constants.file, style: .default, handler: { (action) -> Void in
            self.documentPicker()
        }))
        
        actionSheet.addAction(UIAlertAction(title: Constants.cancelBtnTitle, style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
    }
    
    //MARK: - Authorisation Status
    // This is used to check the authorisation status whether user gives access to import the image, photo library, video.
    // if the user gives access, then we can import the data safely
    // if not show them alert to access from settings.
    func authorisationStatus(attachmentTypeEnum: AttachmentType, vc: UIViewController){
        currentVC = vc
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            if attachmentTypeEnum == AttachmentType.camera{
                openCamera()
            }
            if attachmentTypeEnum == AttachmentType.photoLibrary{
                photoLibrary()
            }
            if attachmentTypeEnum == AttachmentType.video{
                videoLibrary()
            }
            if attachmentTypeEnum == AttachmentType.videoRecord{
                videoRecord()
            }
            
        case .denied:
            print("permission denied")
            self.addAlertForSettings(attachmentTypeEnum)
        case .notDetermined:
            print("Permission Not Determined")
            PHPhotoLibrary.requestAuthorization({ (status) in
                if status == PHAuthorizationStatus.authorized{
                    // photo library access given
                    print("access given")
                    if attachmentTypeEnum == AttachmentType.camera{
                        self.openCamera()
                    }
                    if attachmentTypeEnum == AttachmentType.photoLibrary{
                        self.photoLibrary()
                    }
                    if attachmentTypeEnum == AttachmentType.video{
                        self.videoLibrary()
                    }
                    if attachmentTypeEnum == AttachmentType.videoRecord{
                        self.videoRecord()
                    }
                }else{
                    print("restriced manually")
                    self.addAlertForSettings(attachmentTypeEnum)
                }
            })
        case .restricted:
            print("permission restricted")
            self.addAlertForSettings(attachmentTypeEnum)
        default:
            break
        }
    }
    
    
    //MARK: - CAMERA PICKER
    //This function is used to open camera from the iphone and
    func openCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            DispatchQueue.main.async {

            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            myPickerController.navigationBar.isTranslucent = false
            myPickerController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            myPickerController.navigationBar.barTintColor = UIColor (red: 0/255.0, green: 131/255.0, blue: 0/255.0, alpha: 1)
                self.currentVC?.present(myPickerController, animated: true, completion: nil)
                
            }
        }else {
                   
         
            let alert = UIAlertController(title: "Alert", message: "Camera UnAvaialable", preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            
            currentVC?.present(alert, animated: true, completion: nil)
                   
            
        }
    }

    
    //MARK: - PHOTO PICKER
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            DispatchQueue.main.async {

            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            myPickerController.navigationBar.isTranslucent = false
            myPickerController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            myPickerController.navigationBar.barTintColor = UIColor (red: 0/255.0, green: 131/255.0, blue: 0/255.0, alpha: 1)
                self.currentVC?.present(myPickerController, animated: true, completion: nil)
            
            }
        }
    }
    
    //MARK: - VIDEO PICKER
    func videoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            DispatchQueue.main.async {

            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            myPickerController.navigationBar.isTranslucent = false
            myPickerController.title = "Videos"
            myPickerController.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            myPickerController.navigationBar.barTintColor = UIColor (red: 0/255.0, green: 131/255.0, blue: 0/255.0, alpha: 1)
            myPickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
                self.currentVC?.present(myPickerController, animated: true, completion: nil)
                
            }
        }
    }

    //MARK : - VIDEO RECORD
    func videoRecord(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            DispatchQueue.main.async {
                
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            imagePicker.navigationBar.isTranslucent = false
            imagePicker.title = "Video"
            imagePicker.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            imagePicker.navigationBar.barTintColor = UIColor (red: 0/255.0, green: 131/255.0, blue: 0/255.0, alpha: 1)
                self.currentVC?.present(imagePicker, animated: true, completion: nil)
                
            }
            
        } else {
            
            let alert = UIAlertController(title: "Alert", message: "Camera UnAvaialable", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            currentVC?.present(alert, animated: true, completion: nil)
            
        }
    }
    
    //MARK: - FILE PICKER
    func documentPicker(){
        
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.black], for: .normal)

        let importMenu = UIDocumentPickerViewController(documentTypes: [String(kUTTypePDF)], in: .import)
        importMenu.delegate = self as UIDocumentMenuDelegate as? UIDocumentPickerDelegate
        importMenu.modalPresentationStyle = .formSheet
        currentVC?.present(importMenu, animated: true, completion: nil)
    }
    
    //MARK: - SETTINGS ALERT
    func addAlertForSettings(_ attachmentTypeEnum: AttachmentType){
        var alertTitle: String = ""
        if attachmentTypeEnum == AttachmentType.camera{
            alertTitle = Constants.alertForCameraAccessMessage
        }
        if attachmentTypeEnum == AttachmentType.photoLibrary{
            alertTitle = Constants.alertForPhotoLibraryMessage
        }
        if attachmentTypeEnum == AttachmentType.video{
            alertTitle = Constants.alertForVideoLibraryMessage
        }
        if attachmentTypeEnum == AttachmentType.videoRecord{
            
            alertTitle = Constants.alertForCameraAccessMessage
        }
        
        let cameraUnavailableAlertController = UIAlertController (title: alertTitle , message: nil, preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: Constants.settingsBtnTitle, style: .destructive) { (_) -> Void in
            let settingsUrl = NSURL(string:UIApplication.openSettingsURLString)
            if let url = settingsUrl {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: Constants.cancelBtnTitle, style: .default, handler: nil)
        cameraUnavailableAlertController .addAction(cancelAction)
        cameraUnavailableAlertController .addAction(settingsAction)
        currentVC?.present(cameraUnavailableAlertController , animated: true, completion: nil)
    }
    
//MARK: - IMAGE PICKER DELEGATE
// This is responsible for image picker interface to access image, video and then responsibel for canceling the picker
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC?.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, pickedImage: UIImage?) {
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        currentVC?.dismiss(animated: true, completion: nil)

        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            
            let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset
            
            
            if asset != nil {
                
                
            asset!.requestContentEditingInput(with: PHContentEditingInputRequestOptions(), completionHandler: { (contentEditingInput, dictInfo) in
                    
           
                if let strURL = contentEditingInput?.fullSizeImageURL?.absoluteString
                {
                            print("IMAGE URL: ", strURL)
                    
                    let fileExtension =  contentEditingInput?.fullSizeImageURL?.pathExtension
                    let mimetype = self.mimeTypeFromFileExtension(fileExtension: fileExtension!)

                    self.imagePickedBlock?(image,fileExtension ?? "",mimetype ?? "")

                }else{
                    
                    self.imagePickedBlock?(image, "jpeg", "image/jpeg")

                    
                }
                
            })
            }else{
                
                self.imagePickedBlock?(image, "jpeg", "image/jpeg")

            }

        } else{
            
            print("Something went wrong in  image")
        }
        
        if let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? NSURL{
            
            print("videourl: ", videoUrl)
            
            let fileExtension =  videoUrl.pathExtension
            let mimetype = mimeTypeFromFileExtension(fileExtension: fileExtension!)
            print(mimetype as Any)
            
            
            //trying compression of video
            let data = NSData(contentsOf: videoUrl as URL)!
            print("File size before compression: \(Double(data.length / 1048576)) mb")
            compressWithSessionStatusFunc(videoUrl, fileExtension: fileExtension! , mimetype: mimetype!)

            
            guard let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
             mediaType == (kUTTypeMovie as String),
             let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL,
             UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
                
            else {
                
                return
            }
            
//            // Handle a movie capture
//            UISaveVideoAtPathToSavedPhotosAlbum(
//                url.path,
//                self,
//                #selector(video(_:didFinishSavingWithError:contextInfo:)),
//                nil)
        }else{
            
            print("Something went wrong in  video")
            
        }
        
    }
    
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        let title = (error == nil) ? "Success" : "Error"
        print(title)
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        print(message)

    }
    
    //MARK: Video Compressing technique
    fileprivate func compressWithSessionStatusFunc(_ videoUrl: NSURL, fileExtension : String , mimetype : String) {
        let compressedURL = NSURL.fileURL(withPath: NSTemporaryDirectory() + NSUUID().uuidString + ".MOV")
        compressVideo(inputURL: videoUrl as URL, outputURL: compressedURL) { (exportSession) in
            guard let session = exportSession else {
                return
            }
            
            switch session.status {
            case .unknown:
                break
            case .waiting:
                break
            case .exporting:
                break
            case .completed:
                guard let compressedData = NSData(contentsOf: compressedURL) else {
                    return
                }
                print("File size after compression: \(Double(compressedData.length / 1048576)) mb")
                
                DispatchQueue.main.async {
                    self.videoPickedBlock?(compressedURL as NSURL ,fileExtension ,mimetype )
                }
                
            case .failed:
                break
            case .cancelled:
                break
            }
        }
    }
    
    // Now compression is happening with medium quality, we can change when ever it is needed
    func compressVideo(inputURL: URL, outputURL: URL, handler:@escaping (_ exportSession: AVAssetExportSession?)-> Void) {
        let urlAsset = AVURLAsset(url: inputURL, options: nil)
        guard let exportSession = AVAssetExportSession(asset: urlAsset, presetName: AVAssetExportPreset1280x720) else {
            handler(nil)
            
            return
        }
        
        exportSession.outputURL = outputURL
        exportSession.outputFileType = AVFileType.mov
        exportSession.shouldOptimizeForNetworkUse = true
        exportSession.exportAsynchronously { () -> Void in
            handler(exportSession)
        }
    }

//MARK: - FILE IMPORT DELEGATE
    func documentMenu(_ documentMenu: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        currentVC?.present(documentPicker, animated: true, completion: nil)

    }
    
    func documentMenu(_ documentMenu: UIDocumentPickerViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        currentVC?.present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("url", url)
        self.filePickedBlock?(url)
    }
    
    //    Method to handle cancel action.
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        currentVC?.dismiss(animated: true, completion: nil)
    }
    
    
    func mimeTypeFromFileExtension(fileExtension: String) -> String? {
        guard let uti: CFString = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, fileExtension as NSString, nil)?.takeRetainedValue() else {
            return nil
        }
        
        guard let mimeType: CFString = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() else {
            return nil
        }
        
        return mimeType as String
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}
