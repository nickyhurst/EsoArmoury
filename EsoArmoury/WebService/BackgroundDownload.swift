//
//  BackgroundDownload.swift
//  EsoArmoury
//
//  Created by walnut on 2/19/20.
//  Copyright © 2020 walnut. All rights reserved.
//

import Foundation

class BackgroundDownload : ObservableObject {

    private lazy var urlSession: URLSession = {
      let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier ?? "").backgrouns")
      config.isDiscretionary = true
      config.sessionSendsLaunchEvents = true
      return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()

}
