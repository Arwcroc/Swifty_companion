//
//  OAuth.swift
//  Swifty_Companion
//
//  Created by Téo Froissart on 22/05/2024.
//

//import Foundation
//import OAuth2
//
//
//func getUID() -> String {
//    if let _UID = ProcessInfo.processInfo.environment["API_UID"] {
//        return String(_UID)
//    } else {
//        return ("Missing environment variable: API_UID")
//    }
//}
//
//
//func getSecret() -> String {
//    if let _secret = ProcessInfo.processInfo.environment["API_SECRET"] {
//        return String(_secret)
//    } else {
//        return ("Missing environment variable: API_SECRET")
//    }
//}
//
//
//class API42Class {
//    var oAuth2Client: OAuth2ClientCredentials
//    init() {
//        self.oAuth2Client = OAuth2ClientCredentials(settings: [
//            "client_id": getUID(),
//            "client_secret": getSecret(),
//            "authorize_uri": "https://github.com/login/oauth/authorize",
//            "token_uri": "https://github.com/login/oauth/access_token",   // code grant only
//            "redirect_uris": ["ftintra://oauth/callback"],   // register your own "myapp" scheme in Info.plist
////            "scope": "user repo:status",
////            "secret_in_body": true,    // Github needs this
////            "keychain": false,         // if you DON'T want keychain integration
//        ] as OAuth2JSON)
//    }
//    
//    func    getToken() {
//            let tokenUrl = URL(string: "https://api.intra.42.fr/oauth/token/info")!
//            let req = oAuth2Client.request(forURL: tokenUrl)
//            perform(request: req) { response in
//                do {
//                    let dict = try response.responseJSON()
//                    dump(dict)
//                }
//                catch let error {
//                    print(error)
//                }
//            }
//        }
//}

//
//import Foundation
//import OAuth2
//
//
//func getUID() -> String {
//    if let _UID = ProcessInfo.processInfo.environment["API_UID"] {
//        return String(_UID)
//    } else {
//        return ("Missing environment variable: API_UID")
//    }
//}
//
//
//func getSecret() -> String {
//    if let _secret = ProcessInfo.processInfo.environment["API_SECRET"] {
//        return String(_secret)
//    } else {
//        return ("Missing environment variable: API_SECRET")
//    }
//}
//
//
//class API42Class {
//    var oAuth2Client: OAuth2CodeGrant
//    init() {
//        self.oAuth2Client = OAuth2CodeGrant(settings: [
//            "client_id": getUID(),
//            "client_secret": getSecret(),
//            "authorize_uri": "https://github.com/login/oauth/authorize",
//            "token_uri": "https://github.com/login/oauth/access_token",   // code grant only
//            "redirect_uris": ["ftintra://oauth/callback"],   // register your own "myapp" scheme in Info.plist
////            "scope": "user repo:status",
////            "secret_in_body": true,    // Github needs this
////            "keychain": false,         // if you DON'T want keychain integration
//        ] as OAuth2JSON)
//    }
//}
//


//import SwiftyJSON
//
//class API42Class {
//    var token: [String: Any]? = nil
//    
//    func generate_token() {
//        var UID: String = ""
//        var secret: String = ""
//        
//        if let _UID = ProcessInfo.processInfo.environment["API_UID"] {
//            UID = String(_UID)
//        } else {
//            print("Missing environment variable: API_UID")
//            exit(0)
//        }
//        if let _secret = ProcessInfo.processInfo.environment["API_SECRET"] {
//            secret = String(_secret)
//        } else {
//            print("Missing environment variable: API_SECRET")
//            exit(0)
//        }
//        
//        let queryParams = "?"
//            + "grant_type=client_credentials&"
//            + "client_id=\(UID)&"
//            + "client_secret=\(secret)"
//        let url = URL(string: "https://api.intra.42.fr/oauth/token" + queryParams)!
//        var httpRequest = URLRequest(url: url)
//        httpRequest.httpMethod = "POST"
//        httpRequest.setValue("application/x-www-form-urlencoded",
//                             forHTTPHeaderField: "Content-Type")
//        
//        let semaphore = DispatchSemaphore(value: 0)
//        let task = URLSession.shared.dataTask(with: httpRequest,
//                    completionHandler: {(data, response, error) in
//            if error != nil {
//                print("Error: error generating 42api token")
//                return
//            }
//            if let datas = data {
//                do {
//                    if let json = try JSONSerialization.jsonObject(
//                        with: datas, options: .mutableContainers)
//                        as? [String: Any] {
//                            self.token = json
//                            if let error = self.token?["error_description"] {
//                                print("TOKEN ERROR: ")
//                                print(error)
//                                print("Maybe you should recreate new 42API app (https://profile.intra.42.fr/oauth/applications/new)")
//                                print("Or maybe you should regenerate secret of existing app (https://profile.intra.42.fr/oauth/applications/12855)")
//                                exit(0)
//                            }
//                            print("token generated")
//                         }
//                } catch let error {
//                        print("Error: " + error.localizedDescription)
//                }
//            } else {
//                print("Error: no datas returned when trying to generate 42api token")
//                return
//            }
//            semaphore.signal()
//        })
//        task.resume()
//        semaphore.wait()
//    }
//}
//
//let API42 = API42Class()
