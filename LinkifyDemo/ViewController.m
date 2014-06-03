//
//  ViewController.m
//  LinkifyDemo
//
//  Created by Shin Usami on 2013/12/02.
//  Copyright (c) 2013 Studio Ousia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSInteger *webViewLoadingCount;
@end

@implementation ViewController


- (IBAction)closeText
{
    NSString *url = [webAddress text];
    NSURL *parsedURL;
    
    if ([url hasPrefix:@"http://"]) {
        parsedURL = [NSURL URLWithString:url];
    } else {
        NSString *rer = [NSString stringWithFormat:@"http://%@", url];
        parsedURL = [NSURL URLWithString:rer];
        rer = [webAddress text];
    }
        
    NSURLRequest* req = [NSURLRequest requestWithURL:parsedURL];
    [webView loadRequest:req];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    webView.delegate = self;
    NSString *initialUrl = @"http://news.yahoo.com";
    NSURLRequest* req = [NSURLRequest requestWithURL:[NSURL URLWithString:initialUrl]];
    [webView loadRequest:req];

}

- (void)webViewDidStartLoad:(UIWebView *)view
{
    webAddress.text = webView.request.URL.absoluteString;
    webAddress.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.webViewLoadingCount++;
}

- (void)webViewDidFinishLoad:(UIWebView *)view
{
    self.webViewLoadingCount--;
    if (self.webViewLoadingCount > 0) {
        // Loading
		return;
	}
    
    // Load finished
	[webView stringByEvaluatingJavaScriptFromString:@"(function(){if(!window.linkified){var d=document,s=d.createElement('script');s.type='text/javascript';s.src='http://127.0.0.1:6543/api/linkify.js?key=776cc8970adb37d4d68edc654ee3401af4ef2362';d.getElementsByTagName('head')[0].appendChild(s);window.linkified=true;}})()"]; // ja api key: 414fe115ad13fbb1deb75e731fa07a89e59791f4

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
     self.webViewLoadingCount--;
     if (self.webViewLoadingCount > 0) {
         // Loading
         return;
     }
}

@end
