//
//  ViewController.h
//  LinkifyDemo
//
//  Created by Shin Usami on 2013/12/02.
//  Copyright (c) 2013 Studio Ousia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIWebView *webView;
    IBOutlet UITextField *webAddress;
    IBOutlet UIActivityIndicatorView *active;
}

- (IBAction)closeText;

@end
