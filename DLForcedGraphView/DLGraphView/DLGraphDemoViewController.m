#import "DLGraphDemoViewController.h"
#import "DLForcedGraphView.h"
#import "DLEdge.h"

@interface DLGraphDemoViewController () <DLGraphSceneDelegate>

@end

@implementation DLGraphDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showDebugInfo];

    
//    self.graphView.graphScene.attraction = 50;
//    self.graphView.graphScene.repulsion = 0.01;
    
    DLGraphScene *scene = self.graphView.graphScene;
    scene.graphDelegate = self;

//    NSArray *edges = @[
//        DLMakeEdge(0, 1),
//        DLMakeEdge(1, 2),
//        DLMakeEdge(2, 3),
//        DLMakeEdge(3, 0),
//        DLMakeEdge(3, 4),
//        DLMakeEdge(4, 5),
//        DLMakeEdge(4, 6),
//        DLMakeEdge(4, 7),
//        DLMakeEdge(4, 8),
//        DLMakeEdge(4, 9),
//        DLMakeEdge(4, 10),
//    ];
    
    NSMutableArray *edges = [[NSMutableArray alloc] init];
    int max = 50;
    for (int i = 0; i < max; i++) {
        //for (int j = i+1; j < max; j++) {
        int j = rand() % 5;
        
        [edges addObject:DLMakeEdge(i, j)];
        //}
    }

    [scene addEdges:edges];

    [scene performSelector:@selector(removeEdge:) withObject:DLMakeEdge(0, 1) afterDelay:4.0];
    [scene performSelector:@selector(addEdge:) withObject:DLMakeEdge(0, 1) afterDelay:7.0];
}

- (void)showDebugInfo
{
    self.graphView.showsDrawCount = YES;
    self.graphView.showsNodeCount = YES;
    self.graphView.showsFPS = YES;
    self.graphView.showsPhysics = YES;
}

- (DLForcedGraphView *)graphView
{
    return (DLForcedGraphView *)self.view;
}

//- (IBAction)attractionDidChange:(UISlider *)sender
//{
//    self.graphView.graphScene.attraction = sender.value;
//}
//
//- (IBAction)repulsionDidChange:(UISlider *)sender
//{
//    self.graphView.graphScene.repulsion = sender.value;
//}

#pragma mark - DLGraphSceneDelegate

- (void)configureVertex:(SKShapeNode *)vertex atIndex:(NSUInteger)index
{
    vertex.strokeColor = vertex.fillColor = [SKColor greenColor];
    SKLabelNode *label = [SKLabelNode node];
    label.text = [@(index) stringValue];
    [vertex addChild:label];
}


@end