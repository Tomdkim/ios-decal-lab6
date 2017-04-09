//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"

        static let buttonHeight: CGFloat = 100
        static let buttonMargin: CGFloat = 128
        static let buttonCornerRadius: CGFloat = 10
        static let buttonTextSize: CGFloat = 24
        static let buttonColor = UIColor.white
        static let viewColor = UIColor.red
        static let textColor = UIColor.red
        
        static let titleTextSize: CGFloat = 36
    
    }

    // TODO: instantiate the views needed for your project
    var myTitle: UILabel = {
        let myTitle = UILabel()
        myTitle.frame = CGRect(x: 0
, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.2)
//        myTitle.backgroundColor = UIColor.orange
        myTitle.textColor = UIColor.black
        myTitle.font = UIFont(name: "Avenir", size: Constants.titleTextSize)
        myTitle.textAlignment = NSTextAlignment.center
        myTitle.text = "Login View Controller"
        return myTitle
    }()
    
    var myView: UIView = {
        let myView = UIView()
        myView.frame = CGRect(x: 0
            , y: UIScreen.main.bounds.midY/2, width: UIScreen.main.bounds.size.width * 0.9, height: UIScreen.main.bounds.size.height * 0.3)
        myView.backgroundColor = UIColor.white
        myView.layer.cornerRadius = Constants.buttonCornerRadius
        myView.layer.masksToBounds = true
        return myView
    }()
    
    var id: UITextField = {
        let myId = UITextField()
        myId.frame = CGRect(x:, y:, width:, height:)
        
        return myId
    }()

    
    var button: UIButton = {
        // first create a button to be returned by the closure
        let myButton = UIButton()
        
        // configure the text of the button
        myButton.setTitle("Login", for: .normal)
        myButton.titleLabel?.font = UIFont(name: "Avenir", size: Constants.buttonTextSize)
        myButton.titleLabel?.numberOfLines = 2
        myButton.titleLabel?.textAlignment = .center
        myButton.setTitleColor(Constants.textColor, for: .normal)
        
        // configure button itself
        myButton.backgroundColor = Constants.buttonColor
        // makes the corners of the cell rounded, instead of squared off
        myButton.layer.cornerRadius = Constants.buttonCornerRadius
        myButton.layer.masksToBounds = true
        
        // Since we specified that the button is equal
        // to the closure's return value (`button = { ... }())
        // `button` will now equal `myButton`
        return myButton
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        
        // TODO: layout your views using frames or AutoLayout
        myView.center = view.center
//        myTitle.center = view.center
        
        // Calculate the width of the button based off the size of the view
        let buttonWidth: CGFloat = UIScreen.main.bounds.size.width * 0.6
        
        // Create the frame for the button (necessary if not using constraints)
        // I set the x and y values to 0 since I use button.center, so they do not matter
        // I could use x and y to position my view, but this is extra math
        button.frame = CGRect(x: 0, y: 0, width: buttonWidth, height: Constants.buttonHeight)
        
        // This puts my button at the center x and y of the superview (view)
        button.center = view.center
        
        // This is how you link buttons to methods programmatically (if we
        // were using a storyboard we would control drag to our IBAction instead)
        // `addTarget` takes in 3 parameters
        //     1. target: this is where the action method is defined (in our case,
        //          this is our MainViewController, or self)
        //     2. action: the method we want to be called when the button (or other
        //          UI element) is interacted with
        //     3. for: (controlEvents) here we tell Xcode when we want the action
        //          to be called. In this case, I put ".touchDown" since I want
        //          "goToNextView" to be called every time the user touches down on the button
        button.addTarget(self, action: #selector(goToNextView), for: .touchDown)
        
        // IMPORTANT: this adds our button to the view. If you do not call this,
        // the button will never show up on the screen
        self.view.addSubview(myTitle)
        self.view.addSubview(myView)
        myView.addSubview(button)
    }
    
    // TODO: create an IBAction for your login button
    @IBAction func goToNextView(sender: UIButton) {
        let secondView = LoginViewController()
        // presents the viewController specified, and calls whatever is passed
        // in for `completion` once the view is presented. Since I don't have
        // any use for a completion handler, I just put a print statement inside
        // for fun (I could've left it nil as well)
        self.present(secondView, animated: true, completion: {
            print("This is called after the Second View Controller is presented!")
        })
    }
    
//    // initializer for CGRect. This returns a rectangle with the given size and
//    // position that can be used to set the frame of your UI elements.
//    CGRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -
//    
//    // returns the size of the user's screen (you can use this to get the width and height of the screen)
//    UIScreen.main.bounds.size
//    
//    // returns the center x coordinate of the user's screen (CGFloat)
//    UIScreen.main.bounds.midX
//    
//    // returns the center y coordinate of the user's screen (CGFloat)
//    UIScreen.main.bounds.midY
//    
//    // returns the CGPoint at the center of "view" (remember, ViewControllers have a
//    // default "view" associated with them. This is the white (or blue in our app) background
//    // that you see when the View Controller appears on the screen). Since this view is the same
//    // size as the device's screen, you may use it instead of UIScreen.main to get the sizing information you need.
//    view.center
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
