//
//  ViewController.m
//  Day5 ios obj c
//
//  Created by Kerolos on 18/04/2025.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webKit;
@property (weak, nonatomic) IBOutlet UITextView *txtView;
@property NSMutableData* data;
@property  NSURL *currentURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _data=[NSMutableData new];
}



- (IBAction)btnAsync:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.facebook.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    
    [connection start];

}
- (IBAction)btnSync:(id)sender {
    NSURL* url = [NSURL URLWithString:@"https://www.facebook.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSString *htmlStr = [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    _txtView.text=htmlStr;
    
    [_webKit loadHTMLString:htmlStr baseURL:url];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];

}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {

    [_data setLength:0];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSString *htmlStr = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
        
        _txtView.text = htmlStr;
        
        [_webKit loadHTMLString:htmlStr baseURL:self.currentURL];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    
    _txtView.text = [NSString stringWithFormat:@"Connection failed"];
    
}
@end
