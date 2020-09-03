//
//  ReportDiaryVC.swift
//  K12TeachersApp
//
//  Created by K12 Techno Services Dinesh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

class ReportDiaryVC: BaseVC {
    
    @IBOutlet weak var gradeTF: UITextField!
    @IBOutlet weak var chapterTF: UITextField!
    @IBOutlet weak var recapeTF: UITextField!
    @IBOutlet weak var classWorkTF: UITextField!
    @IBOutlet weak var summaryTF: UITextField!
    @IBOutlet weak var experimentsTF: UITextField!
    @IBOutlet weak var homeworkTF: UITextField!
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var submitReportBtn: UIButton!
    @IBOutlet weak var optionalLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var filesCollectionView: UICollectionView!
    
    var payload1 = [String: Any]()
    
    var appTextFields = [UITextField]()
    var diaryReportVM = ReportDiartViewModel()
    
    //Grade PICKER VIEW
    var thePickerView = UIPickerView()
    var theGradeToolBar = UIToolbar()
    var academicDetails : [Academic_profile]? = SessionManager.academic_profile
    var gradeID = String()
    var sectionId = String()
    var subjectId = String()
    var chapterId = String()
    
    var sectionMappingId = Int()
    var subjectMappingId = Int()
    
    //CollectionView media
    var forMedia = [MediaData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Daily Report"
        UpdateUI()
        CollectionViewUIUpdate()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardDidHideNotification, object: nil)
        
        hideKeyboardWhenTappedAround()
        
    }
    // Note: Below function moves view up when keyboard appears
    @objc func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else{
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
        scrollView.contentInset = UIEdgeInsets.zero
    }
    fileprivate func UpdateUI() {
        appTextFields = [gradeTF, chapterTF, recapeTF, classWorkTF, summaryTF, experimentsTF, homeworkTF] // for common textfield functions
        appTextFields.forEach {$0.backgroundColor = UIColor.appSideMenuBackgroundColor}
        appTextFields.forEach {$0.delegate = self}
        appTextFields.forEach({$0.textColor = UIColor.appMainTitleColor})
        appTextFields.forEach {$0.font = UIFont.appSubTitleFont}
        self.chapterTF.isHidden = true
        
        //Placeholder font style and text
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.appSubTitleColor,
            NSAttributedString.Key.font : UIFont.appSubTitleFont // Note the !
        ]
        gradeTF.attributedPlaceholder = NSAttributedString(string: "Select Grade, Section and Subject", attributes:attributes)
        chapterTF.attributedPlaceholder = NSAttributedString(string: "Select Chapter", attributes:attributes)
        recapeTF.attributedPlaceholder = NSAttributedString(string: "Recap of Previous class", attributes:attributes)
        classWorkTF.attributedPlaceholder = NSAttributedString(string: "Details of classwork", attributes:attributes)
        summaryTF.attributedPlaceholder = NSAttributedString(string: "End summary check", attributes:attributes)
        experimentsTF.attributedPlaceholder = NSAttributedString(string: "Experiments/demos/videos any other tools used", attributes:attributes)
        homeworkTF.attributedPlaceholder = NSAttributedString(string: "Homework given", attributes:attributes)
        submitReportBtn.backgroundColor = UIColor.appButtonBackgroundColor
        submitReportBtn.setTitleColor(UIColor.appButtonTitleColor, for: .normal)
        submitReportBtn.layer.cornerRadius = btnCornerRadius
        submitReportBtn.titleLabel?.font = UIFont.appButtonTitleFont
        uploadImageButton.layer.cornerRadius = btnCornerRadius
        uploadImageButton.backgroundColor = UIColor.appButtonBackgroundColor
        uploadImageButton.setTitleColor(UIColor.appButtonTitleColor, for: .normal)
        uploadImageButton.titleLabel?.font = UIFont.appSubTitleFont
        uploadImageButton.setTitle("Select Files", for: .normal)
        bgView.backgroundColor = UIColor.appBackgroundColor
        pickerViewUIUpdate()
    }
    
    func pickerViewUIUpdate(){
        thePickerView.delegate = self
        thePickerView.dataSource = self
        //BARBUTTON FOR Grade
        let genDoneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(gradeDone))
        let genSpcBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let genCancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(gradeCancel))
        theGradeToolBar.setItems([genCancelBtn, genSpcBtn ,genDoneBtn], animated: true)
        theGradeToolBar.isUserInteractionEnabled = true
        theGradeToolBar.isTranslucent = true
        theGradeToolBar.sizeToFit()
        gradeTF.inputView = thePickerView
        gradeTF.inputAccessoryView = theGradeToolBar
        chapterTF.inputView = thePickerView
        chapterTF.inputAccessoryView = theGradeToolBar
        theGradeToolBar.barStyle = .default
        theGradeToolBar.isTranslucent = true
        theGradeToolBar.sizeToFit()
        theGradeToolBar.tintColor = .black
        theGradeToolBar.backgroundColor = .darkGray
    }
    @objc func gradeDone(){
        if(gradeTF.isFirstResponder){
            if(gradeTF.text == ""){
                self.gradeID = academicDetails?[0].grade_id?.description ?? ""
                self.sectionId = academicDetails?[0].section_id?.description ?? ""
                self.subjectId = academicDetails?[0].subject_id?.description ?? ""
                self.sectionMappingId = academicDetails?[0].section_mapping_id ?? 0
                self.subjectMappingId = academicDetails?[0].subject_mapping_id ?? 0
                gradeTF.text = "\(academicDetails?[0].grade_name ?? "") - \(academicDetails?[0].section_name ?? "") - \(academicDetails?[0].subject_name ?? "")"
                getChapters(subject_id: subjectId, grade_id: gradeID)
            } else {
                getChapters(subject_id: subjectId, grade_id: gradeID)
            }
            gradeTF.resignFirstResponder()
        } else {
            if(chapterTF.text == ""){
                self.chapterId = diaryReportVM.getChaptersInfo?[0].id?.description ?? ""
                self.chapterTF.text = diaryReportVM.getChaptersInfo?[0].chapter_name
            }
            chapterTF.resignFirstResponder()
        }
    }
    
    @objc func gradeCancel(){
        if(gradeTF.isFirstResponder){
            gradeTF.resignFirstResponder()
        } else {
            chapterTF.resignFirstResponder()
        }
    }
    
    func CollectionViewUIUpdate(){
        filesCollectionView.register(ReportDiaryFilesCVCell.cellNib, forCellWithReuseIdentifier: ReportDiaryFilesCVCell.cellId)
        filesCollectionView.backgroundColor = .clear
        filesCollectionView.delegate = self
        filesCollectionView.dataSource = self
    }
    
    @IBAction func uploadBtn(_ sender: Any) {
        MediaAttachment.shared.showAttachmentActionSheet(vc: self)
        MediaAttachment.shared.imagePickedBlock = { (image,filePath,mimetype) in
            let data = image.jpegData(compressionQuality: 0.7)
            self.forMedia.append(MediaData(withMedia : data! as NSData ,forKey: "file0", mimetype: mimetype , fileExtantion: filePath , Type: "image",url : "")!)
            self.filesCollectionView.reloadData()
        }
        MediaAttachment.shared.videoPickedBlock = {(url,fileExtension ,mimetype) in
            let videStr = url.absoluteString
            UserDefaults.standard.set(videStr, forKey: "videoStr")
            do {
                let videoData = try Data(contentsOf: url as URL) as NSData
                self.forMedia.append(MediaData(withMedia : videoData ,forKey: "file0", mimetype: mimetype , fileExtantion: fileExtension , Type: "video",url : videStr!)!)
                self.filesCollectionView.reloadData()
            } catch {
                print("Unable to load data: \(error)")
            }
        }
        MediaAttachment.shared.filePickedBlock = {(filePath) in
            /* get your file path url here */
            let videStr = filePath.absoluteString
            UserDefaults.standard.set(videStr, forKey: "fileStr")
            let data = NSData(contentsOf: filePath as URL)!
            let fileExtension =  filePath.pathExtension
            let mimetype = MediaAttachment.shared.mimeTypeFromFileExtension(fileExtension: fileExtension)
            print(mimetype as Any)
            self.forMedia.append(MediaData(withMedia : data ,forKey: "file0", mimetype: mimetype ?? "", fileExtantion: fileExtension , Type: "file", url: "")!)
            self.filesCollectionView.reloadData()
        }
    }
    
    @IBAction func submitReportBtn(_ sender: Any) {
        payload1["section_mapping_id"] = self.sectionMappingId
        payload1["subject_mapping_id"] = self.subjectMappingId
        payload1["recap"] = recapeTF.text ?? ""
        payload1["summary"] = summaryTF.text ?? ""
        payload1["classwork"] = classWorkTF.text ?? ""
        payload1["homework"] = homeworkTF.text ?? ""
        payload1["support_materials"] = experimentsTF.text ?? ""
        payload1["chapter_id"] = self.chapterId
        payload1["file0"] = forMedia
        diaryReportVM.postReportDiary(payload: payload1 as JSON) {
            DispatchQueue.main.async {
                //                printMe(object: <#T##Any#>)
                self.showAlertOnWindow(title: "Success", message: "SussesPosted", titles: ["OK"]) { (key) in
                    if(key) == "OK"{
                        
                    }
                }
            }
        }
    }
    
}
extension ReportDiaryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK:- Picker view delegates
extension ReportDiaryVC : UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(gradeTF.isFirstResponder) {
            return academicDetails?.count ?? 0
        } else {
            return diaryReportVM.getChaptersInfo?.count ?? 0
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(gradeTF.isFirstResponder) {
            return "\(academicDetails?[row].grade_name ?? "") - \(academicDetails?[row].section_name ?? "") - \(academicDetails?[row].subject_name ?? "")"
        } else {
            return diaryReportVM.getChaptersInfo?[row].chapter_name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(gradeTF.isFirstResponder) {
            self.gradeID = academicDetails?[row].grade_id?.description ?? ""
            self.sectionId = academicDetails?[row].section_id?.description ?? ""
            self.subjectId = academicDetails?[row].subject_id?.description ?? ""
            self.sectionMappingId = academicDetails?[row].section_mapping_id ?? 0
            self.subjectMappingId = academicDetails?[row].subject_mapping_id ?? 0
            self.gradeTF.text = "\(academicDetails?[row].grade_name ?? "") - \(academicDetails?[row].section_name ?? "") - \(academicDetails?[row].subject_name ?? "")"
        } else {
            self.chapterId = diaryReportVM.getChaptersInfo?[row].id?.description ?? ""
            self.chapterTF.text = diaryReportVM.getChaptersInfo?[row].chapter_name
        }
    }
}

//MARK:- API Call
extension ReportDiaryVC {
    func getChapters(subject_id: String, grade_id: String){
        ProgressHud.showActivityIndicator(uiView: self.view)
        diaryReportVM.getChapters(subject_id: subject_id, grade_id: grade_id, is_academic: "True") {
            DispatchQueue.main.async {
                if(self.diaryReportVM.getChaptersInfo?.count == 0){
                    self.chapterTF.isHidden = true
                    self.gradeID = ""
                    self.sectionId = ""
                    self.subjectId = ""
                    self.sectionMappingId = 0
                    self.subjectMappingId = 0
                    self.gradeTF.text = ""
                } else {
                    self.chapterTF.isHidden = false
                }
                
                ProgressHud.hideActivityIndicator(uiView: self.view)
            }
        }
    }
}

//MARK:- Collection view delegates
extension ReportDiaryVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return forMedia.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReportDiaryFilesCVCell.cellId, for: indexPath) as! ReportDiaryFilesCVCell
        cell.cellMedia = forMedia[indexPath.row]
        cell.deleteButton.addTarget(self, action: #selector(removeAction(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func removeAction(sender: UIButton){
        
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.filesCollectionView)
        let indexPath = self.filesCollectionView.indexPathForItem(at: buttonPosition)
        
        forMedia.remove(at: indexPath!.row)
        
        filesCollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
}
