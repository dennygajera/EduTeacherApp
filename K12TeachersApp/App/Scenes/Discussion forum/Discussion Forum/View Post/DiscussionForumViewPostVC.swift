//
//  DiscussionForumViewPostVC.swift
//  EduvateParentPortal
//
//  Created by K12 Techno Services Dinesh on 26/07/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit
import WebKit
//import RichEditorView
//import IQKeyboardManagerSwift
class DiscussionForumViewPostVC: UIViewController, WKNavigationDelegate, UIGestureRecognizerDelegate {
//    @IBOutlet weak var viewPostTableView: UITableView!
    
    @IBOutlet weak var holder_View: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var comtentWebView: WKWebView!
    @IBOutlet weak var webHeightConstriant: NSLayoutConstraint!
//    @IBOutlet weak var editorToolBar: RichEditorToolbar!
//    @IBOutlet weak var editorView: RichEditorView!
    @IBOutlet weak var editorViewHeight: NSLayoutConstraint!
    @IBOutlet weak var coloursCollecrionView: UICollectionView!
    @IBOutlet weak var colloursHeightConstant: NSLayoutConstraint!
//    @IBOutlet weak var editorToolBarHeight: NSLayoutConstraint!
    var contentString = ""
    var toolItem = ""
    var isTextImage:Bool = false
    var isTextFiled:Bool = false
    
    let colors: [UIColor] = [.black,.white,.red,.orange,.yellow,.green,.blue,.purple,.systemRed,.darkGray,.darkText,.systemPink,.brown,.cyan,.gray,.black]
//    var studentInfo : StudentInfo? = nil
//    var getPostDetails : DiscussionForumPostListModelResults? = nil
   
    override func viewDidLoad() {
        super.viewDidLoad()
        BasicMethods()
        holder_View.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        holder_View.layer.cornerRadius = 24.0
        holder_View.clipsToBounds = true
        
        colloursHeightConstant.constant = 0
        editorViewHeight.constant = 0
        
//        editorView.delegate = self
//           editorView.inputAccessoryView = editorToolBar
//           editorView.placeholder = "Type some text..."
//           editorToolBar.delegate = self
//           editorToolBar.editor = editorView
//
//           let item = RichEditorOptionItem(image: nil, title: "Clear") { toolbar in
//               toolbar.editor?.html = ""
//           }
//        var options = editorToolBar.options
//        options.append(item)
//        editorToolBar.options = options
//        addDoneButtonOnKeyboard()
//        IQKeyboardManager.shared.enable = false
        
//        editorToolBar.options = [RichEditorDefaultOption.undo,RichEditorDefaultOption.redo,RichEditorDefaultOption.italic,RichEditorDefaultOption.bold,RichEditorDefaultOption.image,RichEditorDefaultOption.textBackgroundColor,RichEditorDefaultOption.textColor,RichEditorDefaultOption.alignLeft,RichEditorDefaultOption.alignRight,RichEditorDefaultOption.alignCenter,RichEditorDefaultOption.header(2),RichEditorDefaultOption.header(3),RichEditorDefaultOption.header(4),RichEditorDefaultOption.header(5),RichEditorDefaultOption.orderedList,RichEditorDefaultOption.outdent,RichEditorDefaultOption.orderedList,RichEditorDefaultOption.unorderedList,RichEditorDefaultOption.clear]
//
        coloursCollecrionView.register(UINib(nibName: "ColoursCell", bundle: nil), forCellWithReuseIdentifier: "ColoursCell")
        editorViewHeight.constant = 0
    }
    // MARK: - KeyBoardMethods

    func addKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }

    func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillAppear(_ notification: Notification?) {
        let keyboardFrameBegin = notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue
        let keyboardFrameBeginRect = keyboardFrameBegin?.cgRectValue
        print(keyboardFrameBeginRect as Any)
        
        guard !isTextFiled else {
            return
        }
        editorViewHeight.constant = 50
        
    }
    func addDoneButtonOnKeyboard(){
        
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
//        editorView.inputAccessoryView = doneToolbar
        
    }

    @objc func doneButtonAction(){
        self.view.endEditing(true)
        editorViewHeight.constant = 0
        colloursHeightConstant.constant = 0
        
    }
    //MARK:- TextFiledDelegate

    func textFieldDidBeginEditing(_ textField: UITextField) {
        isTextFiled = true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        isTextFiled = false
    }
    fileprivate func BasicMethods() {
           if #available(iOS 13, *) {
               self.overrideUserInterfaceStyle = .light
           }
           
           if let savedPerson = UserDefaults.standard.object(forKey: "studentInfoSaved") as? Data {
               let decoder = JSONDecoder()
//               if let loadedPerson = try? decoder.decode(StudentInfo.self, from: savedPerson) {
//                   self.studentInfo = loadedPerson
//                   // set profile image to navigation bar
//
//               }
               
           }
//        self.titleLabel.text = self.getPostDetails?.title
//
//        comtentWebView.loadHTMLString(self.getPostDetails?.description ?? "", baseURL: nil)
        comtentWebView.navigationDelegate = self
        comtentWebView.scrollView.isScrollEnabled = false
        comtentWebView.backgroundColor = .clear
        comtentWebView.scrollView.showsVerticalScrollIndicator = false
        comtentWebView.scrollView.showsHorizontalScrollIndicator = false
        
    }
    
//    @IBAction func btnComment(_ sender: Any) {
//        print("editorView.html = \(editorView.html)")
//    }
//    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
//        ProgressHud.sharedProgessHud.hideActivityIndicator(uiView: view)
//        
//        webView.evaluateJavaScript("document.readyState", completionHandler: { (complete, error) in
//            
//            let textSize = 300
//            let javascript = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '\(textSize)%'"
//            webView.evaluateJavaScript(javascript) { (response, error) in
//                print()
//            }
//            
//            webView.evaluateJavaScript("document.documentElement.scrollHeight", completionHandler: { (height, error) in
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    //                self.webViewHieghtConstranint?.constant = height as! CGFloat
//                    self.webHeightConstriant.constant = webView.scrollView.contentSize.height
//                }
//            })
//            
//        })
//    }
    
}
//extension DiscussionForumViewPostVC : RichEditorDelegate{
//
//    func richEditor(_ editor: RichEditorView, contentDidChange content: String){
//
//        if content.isEmpty {
//            contentString = "HTML Preview"
//        } else {
//            contentString = content
////            htmlTextView.text = content
//        }
//
//    }
//}

//extension DiscussionForumViewPostVC : RichEditorToolbarDelegate{
//    
//    func richEditorToolbarChangeTextColor(_ toolbar: RichEditorToolbar) {
//        toolItem = "TextColour"
//        colloursHeightConstant.constant = 25
//        
//    }
//
//    func richEditorToolbarChangeBackgroundColor(_ toolbar: RichEditorToolbar) {
//        toolItem = "BackGroundColur"
//        colloursHeightConstant.constant = 25
//    }
//
//    func richEditorToolbarInsertImage(_ toolbar: RichEditorToolbar) {
//        isTextImage = true
////        self.takeImageAction(isInserLink: true)
//    }
//
//
//    func richEditorToolbarInsertLink(_ toolbar: RichEditorToolbar) {
//        
//        if toolbar.editor?.hasRangeSelection == true {
//            //editorView.editor?.insertLink("http://github.com/cjwirth/RichEditorView", title: "Github Link")
//            editorView.insertLink("https://www.hackingwithswift.com/articles/117/the-ultimate-guide-to-timer", title: "Github Link")
//        }
//    }
//}
extension DiscussionForumViewPostVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

//MARK: CollectiViewMethods

{
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return colors.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell =  coloursCollecrionView.dequeueReusableCell(withReuseIdentifier: "ColoursCell", for: indexPath) as! ColoursCell
    cell.colourView.backgroundColor = colors[indexPath.row]
    return cell
    
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 30, height: 30)
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    guard toolItem == "TextColour" else {
//        editorToolBar.editor?.setTextColor(colors[indexPath.row])
        return
    }
//    editorToolBar.editor?.setTextBackgroundColor(colors[indexPath.row])
    colloursHeightConstant.constant = 0
    
}

}
