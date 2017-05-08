//
//  FViewController.m
//  WSTest
//
//  Created by wangshen on 17/1/24.
//  Copyright © 2017年 LP_Macmini. All rights reserved.
//

#import "FViewController.h"

@interface FViewController ()

@property (nonatomic , copy) NSString *testString;

@end

@implementation FViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    //使用组的方式  -
    
//    dispatch_queue_t queue = dispatch_queue_create("com.wangshen", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"task 1 on %@",[NSThread currentThread]);
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"task 2 on %@",[NSThread currentThread]);
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"task 3 on %@",[NSThread currentThread]);
//    });
//    
////    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
////    NSLog(@"子线程中的任务全部执行完成");
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"子线程中的任务全部执行完成");
//    });
    
    

#pragma mark - 使用信号量
//    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
//    dispatch_async(queue, ^{
//        dispatch_semaphore_signal(sem);
//        NSLog(@"task 1 on %@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        dispatch_semaphore_signal(sem);
//        NSLog(@"task 2 on %@",[NSThread currentThread]);
//    });
//    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
//    NSLog(@"以上线程中的任务执行完毕");

//    dispatch_get_global_queue(<#long identifier#>, <#unsigned long flags#>)
    
    
#pragma mark - 使用 墙 barrier
//    dispatch_queue_t queue = dispatch_queue_create("cc.imguiqing", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue, ^{
//        NSLog(@"task 1 on %@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"task 2 on %@",[NSThread currentThread]);
//    });
//    dispatch_barrier_async(queue, ^{
//        NSLog(@"barrier ==========");
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"task 3 on %@",[NSThread currentThread]);
//    });
    
    
    
    
    
#pragma mark - 使用 NSOPerationQueue
//    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];  //主队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init]; //自定义队列
//    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
//        //任务执行
//        NSLog(@"task 1 on %@",[NSThread currentThread]);
//        for (NSInteger i = 0; i < 100; i ++ ) {
//            NSLog(@"---");
//        }
//        NSLog(@"task 1 on %@  完成",[NSThread currentThread]);
//
//    }];
//    
//    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
//        //任务执行
//        NSLog(@"task 2 on %@",[NSThread currentThread]);
//    }];
//    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
//        //任务执行
//        NSLog(@"task 3 on %@",[NSThread currentThread]);
//    }];
////    [operation1 addDependency:operation2];
////    [operation3 addDependency:operation1];
////    queue.maxConcurrentOperationCount = 1;
//    [queue addOperation:operation1];
//    [queue addOperation:operation2];
//    [queue addOperation:operation3];
//    
//    [queue waitUntilAllOperationsAreFinished];
//    NSLog(@"三个线程中的任务 全部执行完毕之后 -");
   
#pragma mark - 使用NSTHread

//    NSThread *

//    __block NSMutableArray *testArray = [NSMutableArray array];
//    __block NSCondition *condition = [[NSCondition alloc] init];
////    dispatch_get_global_queue(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), 0)
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        self.testString = @"1";
////        [condition lock];
////        while (testArray.count == 0) {
////            NSLog(@"等待 - 数组里面有东西");
////            [condition wait];
////        }
////        NSLog(@"数组里面已经有值了");
////        [testArray removeAllObjects];
////        [condition unlock];
//        
//    });
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
////        [condition lock];
////        [testArray addObject:@"1"];
////        NSLog(@"数组中有一个值");
////        [condition signal];
////        [condition unlock];
//        self.testString = @"2";
//    });
//
//    
//    // Do any additional setup after loading the view.
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"发通知" style:UIBarButtonItemStylePlain target:self action:@selector(itemAction:)];
//    self.navigationItem.rightBarButtonItem = item;
////    NSInvocation (
    
}

- (void)itemAction:(UIBarButtonItem *)sender{
    
    
//    NSMethodSignature *sing = [FViewController instanceMethodSignatureForSelector:@selector(testFunc:)];
//    NSInvocation *invication = [NSInvocation invocationWithMethodSignature:sing];
//    invication.target= self;
//    invication.selector = @selector(testFunc:);
//    NSString *string = @"11111111";
//    [invication setArgument:&string atIndex:2];
//    [invication invoke];
//    
   
//    dispatch_asyn c(dispatch_get_global_queue(0, 0), ^{
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"test" object:nil];
//    });
}

- (void)testFunc:(NSString *)string{
//    NSException *excp = [NSException exceptionWithName:@"这是我测试的错误" reason:@"未知错误" userInfo:@{}];
//    [excp raise];
//    NSLog(@"%@",string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
