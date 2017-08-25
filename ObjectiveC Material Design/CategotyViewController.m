//
//  CategotyViewController.m
//  ObjectiveC Material Design
//
//  Created by Gideon Bamuleseyo on 8/22/17.
//  Copyright © 2017 lytestech. All rights reserved.
//

#import "CategotyViewController.h"
#import "AFNetworking.h"

@interface CategotyViewController (){

    NSMutableArray *myArray;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CategotyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self downloadTask];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [_tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"product_cell"];
     UILabel *name = [cell viewWithTag:1];
     name.text = myArray[indexPath.row];
    return cell;
}


- (void)downloadTask{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager GET:@"https://popbottles.000webhostapp.com/getVodka.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        myArray = [[NSMutableArray alloc] init];
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"The dic is %@", dic);
        
        for (NSString *product in[dic valueForKey:@"product_name"]){
            [myArray addObject:product];
            
            
        }
        
        [_tableView reloadData];
        NSLog(@"The array is: %@", myArray);
        // NSDictionary *dic = [NSJSONSerialization dataWithJSONObject:jsonData options:0 error:&error];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)anotherOne{
    
}

@end
