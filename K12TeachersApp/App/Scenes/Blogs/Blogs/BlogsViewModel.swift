//
//  BlogsViewModel.swift
//  K12TeachersApp
//
//  Created by Santosh on 21/08/20.
//  Copyright © 2020 K12 Techno Services. All rights reserved.
//

import UIKit

struct blogsTypeModel {
    var blogType: String?
    var blogVC: String?
}

class BlogsViewModel: NSObject {

    var blogsTopicArray: [blogsTypeModel] = [
        blogsTypeModel(blogType: "View Blogs", blogVC: "ViewBlogsVC"),
        blogsTypeModel(blogType: "Published Blogs", blogVC: "PublishedBlogsVC"),
        blogsTypeModel(blogType: "Blogs DashBoard", blogVC: "BlogsDashBoardVC"),
    ]
    
}
