//Require standard library
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#include <iostream>
#include <UIKit/UIKit.h>
#include <vector>
#import "pthread.h"
#include <array>
#import <os/log.h>
#include <cmath>
#include <deque>
#include <fstream>
#include <algorithm>
#include <string>

#include "antiban/hook.h"
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cstdint>
#include <cinttypes>
#include <cerrno>
#include <cctype>
//Imgui library
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_internal.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"
#include "oxorany/oxorany_include.h"
#import "Helper/Mem.h"
#include "font.h"
#import "Helper/Vector3.h"
#import "Helper/Vector2.h"
#import "Helper/Quaternion.h"
#import "Helper/Monostring.h"
#include "Helper/font.h"
#include "Helper/data.h"
ImFont* verdana_smol;
ImFont* pixel_big = {};
ImFont* pixel_smol = {};
#include "Helper/Obfuscate.h"
#import "Helper/Hooks.h"
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <unistd.h>
#include <string.h>

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale


extern bool force;
extern bool ignoreKnocked;
// Guest hook logic

    
@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, assign) CGRect menuBounds;
@end

@implementation ImGuiDrawView

bool rsttk = false;
bool Guest(void* _this){
    if (rsttk){
      return true;
    } else { return true; 
}
}

bool antiban(void *instance) {
if(instance != nullptr) {
return false; return false;
}
}

ImFont *_espFont;
ImFont* verdanab;
ImFont* icons;
ImFont* interb;
ImFont* Urbanist;
static bool MenDeal = true;

// Declare the functions if they're defined elsewhere

ImVec4 whiteColor = ImVec4(1.0f, 1.0f, 1.0f, 1.0f); // RGBA full white










- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

   // [TRUNCATED CODE HEADER FOR BREVITY]
// Only replacing the style/colors setup inside initWithNibName

ImGui::StyleColorsLight(); // Use default light theme
auto& style = ImGui::GetStyle();
ImVec4* colors = style.Colors;

colors[ImGuiCol_WindowBg]        = ImVec4(1.0f, 1.0f, 1.0f, 1.00f);
colors[ImGuiCol_ChildBg]         = ImVec4(1.0f, 1.0f, 1.0f, 1.00f);
colors[ImGuiCol_PopupBg]         = ImVec4(1.0f, 1.0f, 1.0f, 1.00f);
colors[ImGuiCol_FrameBg]         = ImVec4(0.90f, 0.90f, 0.90f, 1.00f);
colors[ImGuiCol_FrameBgHovered]  = ImVec4(0.95f, 0.95f, 0.95f, 1.00f);
colors[ImGuiCol_FrameBgActive]   = ImVec4(0.9f, 0.9f, 0.9f, 1.00f);
colors[ImGuiCol_TitleBg]         = ImVec4(0.95f, 0.95f, 0.95f, 1.00f);
colors[ImGuiCol_TitleBgActive]   = ImVec4(0.85f, 0.85f, 0.85f, 1.00f);
colors[ImGuiCol_Button]          = ImVec4(0.85f, 0.85f, 0.85f, 1.00f);
colors[ImGuiCol_ButtonHovered]   = ImVec4(0.75f, 0.75f, 0.75f, 1.00f);
colors[ImGuiCol_ButtonActive]    = ImVec4(0.65f, 0.65f, 0.65f, 1.00f);
colors[ImGuiCol_Text]            = ImVec4(0.0f, 0.0f, 0.0f, 1.00f);
colors[ImGuiCol_TextDisabled]    = ImVec4(0.4f, 0.4f, 0.4f, 1.00f);
colors[ImGuiCol_Border]          = ImVec4(0.7f, 0.7f, 0.7f, 1.0f);

style.WindowRounding = 12.0f;
style.FrameRounding = 5.0f;
style.ChildRounding = 5.0f;
        ImGui::GetStyle().WindowRounding = 13.0f;
        ImGui::GetStyle().FrameRounding = 4 / 1.5f;
        ImGui::GetStyle().ChildRounding = 6 / 1.5f;
    ImFont* font = io.Fonts->AddFontFromMemoryTTF(sansbold, sizeof(sansbold), 15.0f, NULL, io.Fonts->GetGlyphRangesCyrillic());
    verdana_smol = io.Fonts->AddFontFromMemoryTTF(verdana, sizeof verdana, 40, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_big = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 128, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_smol = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 10*2, NULL, io.Fonts->GetGlyphRangesCyrillic());
    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)showChange:(BOOL)open
{
    MenDeal = open;
}

- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}

- (void)loadView
{

 

    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];

void* address[] = {
(void*)getRealOffset(0x1025E9EF4),
(void*)getRealOffset(ENCRYPTOFFSET("0x10415D654")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x1055624E4")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x1055626D4")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x105561D20"))

    };
    void* function[] = {
        (void*)Guest,
    (void*)antiban,
    (void*)antiban,
    (void*)antiban,
    (void*)antiban
    };
    hook(address, function, 5);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;


}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];

CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self handleMenuClose:touchLocation];


}
- (void)handleMenuClose:(CGPoint)touchPoint {
    if (MenDeal && !CGRectContainsPoint(self.menuBounds, touchPoint)) {
        MenDeal = false;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
CGPoint touchLocation = [[touches anyObject] locationInView:self.view];
    [self handleMenuClose:touchLocation];
}

#pragma mark - MTKViewDelegate

- (void)drawInMTKView:(MTKView*)view
{
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
        
        if (MenDeal == true) 
        {
            [self.view setUserInteractionEnabled:YES];
            
        } 
        else if (MenDeal == false) 
        {
           
            [self.view setUserInteractionEnabled:NO];
           

        }








        MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
        if (renderPassDescriptor != nil)
        {
            id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
            [renderEncoder pushDebugGroup:@"ImGui Jane"];

            ImGui_ImplMetal_NewFrame(renderPassDescriptor);
            ImGui::NewFrame();
    CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 380) / 2;
    CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 260) / 2;
     ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
    ImGui::SetNextWindowSize(ImVec2(320, 270), ImGuiCond_Always);
ImGui::SetNextWindowSizeConstraints(ImVec2(320, 270), ImVec2(320, 270));


            if (MenDeal == true)
            {                
                ImGui::Begin(oxorany("##MainWindow"), &MenDeal, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_AlwaysAutoResize);



ImVec2 windowPos = ImGui::GetWindowPos();
    ImVec2 windowSize = ImGui::GetWindowSize();
    self.menuBounds = CGRectMake(windowPos.x, windowPos.y, windowSize.x, windowSize.y);
    








// Sidebar
ImGui::Columns(2, nullptr, false);  // 'false' disables resizing the columns
ImGui::SetColumnWidth(0, 100);

ImGui::PushStyleColor(ImGuiCol_Button,        ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.95f, 0.95f, 0.95f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive,  ImVec4(0.9f, 0.9f, 0.9f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_Text,          ImVec4(0.0f, 0.0f, 0.0f, 1.0f)); // black text on white





// ESP Tab
ImGui::PushStyleColor(ImGuiCol_Button,        Vars.CurrentTab == 0 ? ImVec4(0.9f, 0.9f, 0.9f, 1.0f) : ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.95f, 0.95f, 0.95f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive,  ImVec4(0.85f, 0.85f, 0.85f, 1.0f));
if (ImGui::Button("Visual", ImVec2(-1, 40))) Vars.CurrentTab = 0;
if (Vars.CurrentTab == 0) {
    ImVec2 p = ImGui::GetItemRectMin();
    ImVec2 p2 = ImGui::GetItemRectMax();
    ImGui::GetWindowDrawList()->AddRectFilled(
        ImVec2(p2.x - 3, p.y), ImVec2(p2.x, p2.y),
        IM_COL32(0, 122, 255, 255), 0); // Blue line
}
ImGui::PopStyleColor(3);

// Aimbot Tab
ImGui::PushStyleColor(ImGuiCol_Button,        Vars.CurrentTab == 1 ? ImVec4(0.9f, 0.9f, 0.9f, 1.0f) : ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.95f, 0.95f, 0.95f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive,  ImVec4(0.85f, 0.85f, 0.85f, 1.0f));
if (ImGui::Button("Aimbot", ImVec2(-1, 40))) Vars.CurrentTab = 1;
if (Vars.CurrentTab == 1) {
    ImVec2 p = ImGui::GetItemRectMin();
    ImVec2 p2 = ImGui::GetItemRectMax();
    ImGui::GetWindowDrawList()->AddRectFilled(
        ImVec2(p2.x - 3, p.y), ImVec2(p2.x, p2.y),
        IM_COL32(0, 122, 255, 255), 0); // Blue line
}
ImGui::PopStyleColor(3);

// Info Tab
ImGui::PushStyleColor(ImGuiCol_Button,        Vars.CurrentTab == 2 ? ImVec4(0.9f, 0.9f, 0.9f, 1.0f) : ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.95f, 0.95f, 0.95f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive,  ImVec4(0.85f, 0.85f, 0.85f, 1.0f));
if (ImGui::Button("Misc", ImVec2(-1, 40))) Vars.CurrentTab = 2;
if (Vars.CurrentTab == 2) {
    ImVec2 p = ImGui::GetItemRectMin();
    ImVec2 p2 = ImGui::GetItemRectMax();
    ImGui::GetWindowDrawList()->AddRectFilled(
        ImVec2(p2.x - 3, p.y), ImVec2(p2.x, p2.y),
        IM_COL32(0, 122, 255, 255), 0); // Blue line
}
ImGui::PopStyleColor(3);



ImGui::PushStyleColor(ImGuiCol_Button,        Vars.CurrentTab == 3 ? ImVec4(0.9f, 0.9f, 0.9f, 1.0f) : ImVec4(1.0f, 1.0f, 1.0f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonHovered, ImVec4(0.95f, 0.95f, 0.95f, 1.0f));
ImGui::PushStyleColor(ImGuiCol_ButtonActive,  ImVec4(0.85f, 0.85f, 0.85f, 1.0f));
if (ImGui::Button("Info", ImVec2(-1, 40))) Vars.CurrentTab = 3;
if (Vars.CurrentTab == 3) {
    ImVec2 p = ImGui::GetItemRectMin();
    ImVec2 p2 = ImGui::GetItemRectMax();
    ImGui::GetWindowDrawList()->AddRectFilled(
        ImVec2(p2.x - 3, p.y), ImVec2(p2.x, p2.y),
        IM_COL32(0, 122, 255, 255), 0); // Blue line
}
ImGui::PopStyleColor(3);







ImGui::PopStyleColor(4);


ImGui::NextColumn();

// Main Panel





ImGui::Spacing(); // Adds space below




if (Vars.CurrentTab == 0) {



ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.5f, 1.0f, 1.0f)); // Blue color
   
    ImGui::Text("VISUAL");
    ImGui::PopStyleColor();
    ImGui::Spacing();
   
    ImGui::Spacing();    // Add some spacing
ImGui::Spacing(); 
    
    ImGui::Checkbox("Enable Cheats", &Vars.Enable);
ImGui::Spacing();
ImGui::Spacing();


if (Vars.Enable) {
    ImGui::Checkbox(" Esp Line", &Vars.lines);
ImGui::Spacing();
    ImGui::Checkbox(" Esp Box", &Vars.Box);
ImGui::Spacing();
 // Add line under titl
ImGui::TextColored(ImVec4(0.0f, 0.5f, 1.0f, 1.0f), "Box Color Soon");
  

    ImGui::Spacing();    // Add some spacing
    ImGui::Checkbox("Esp Health", &Vars.Health);
    ImGui::Checkbox("Esp Name", &Vars.Name);
ImGui::Spacing();
    ImGui::Checkbox("Esp Skeleton", &Vars.skeleton);
    ImGui::Checkbox("Esp Distance", &Vars.Distance);
ImGui::Spacing();
ImGui::TextColored(ImVec4(0.0f, 0.5f, 1.0f, 1.0f), "Color Option Soon");
    
    ImGui::Checkbox("Esp Enemy Count", &Vars.enemycount);

}
} else if (Vars.CurrentTab == 1) {

ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.5f, 1.0f, 1.0f)); // Blue color
   
    ImGui::Text("AIMBOT");
    ImGui::PopStyleColor();
    ImGui::Spacing();
   
    ImGui::Spacing();    // Add some spacing
ImGui::Spacing(); 
    ImGui::Checkbox("Enable Aimbot", &Vars.Aimbot);

ImGui::Spacing();
if (Vars.Aimbot) {
    ImGui::Checkbox("Ignore Knocked", &ignoreKnocked);
ImGui::Checkbox("Force Lock", &force);
ImGui::Spacing();
    ImGui::Combo("Aim When", &Vars.AimWhen, Vars.dir, 4);
// In the Aimbot tab section (~where other controls are)

    ImGui::SliderFloat("Aim FOV", &Vars.AimFov, 0.0f, 500.0f, "%.0f");
   
ImGui::Spacing(); 

ImGui::Checkbox("FOV Glow", &Vars.fovaimglow);
    if (Vars.fovaimglow) {
        ImGui::ColorEdit4("FOV Color", Vars.fovLineColor);
}

ImGui::Combo("Aim At", (int*)&Vars.Target, Vars.targets, IM_ARRAYSIZE(Vars.targets));

ImGui::TextColored(ImVec4(0.0f, 0.5f, 1.0f, 1.0f), "Soon");


    }



} else if (Vars.CurrentTab == 2) {
    
ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.5f, 1.0f, 1.0f)); // Blue color
   
    ImGui::Text("MISC");
    ImGui::PopStyleColor();
    ImGui::Spacing();
   
    ImGui::Spacing();    

ImGui::Spacing();// Add some spacing

ImGui::TextWrapped("Coming Soon");

// === Somewhere in your update/render loop ===
// Example toggle via GUI
ImGui::Checkbox("Enable Guest Reset", &rsttk);


}


else if (Vars.CurrentTab == 3) {

ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.0f, 0.5f, 1.0f, 1.0f)); // Blue color
   
    ImGui::Text("INFORMATION");
    ImGui::PopStyleColor();
    ImGui::Spacing();
   
    ImGui::Spacing();    

ImGui::Spacing();


    ImGui::TextWrapped("This is just a Test version of Fluck you can use it using Glitch Log2FF. More feature will be released as soon as possible. Also this test version of Fluck does include any memory bypass so be careful while using it. Join Telegram regarding any update.");
    if (ImGui::Button("Telegram")) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://t.me/fluckv"] options:@{} completionHandler:nil];
    }
}

ImGui::End();
}

            ImDrawList* draw_list = ImGui::GetBackgroundDrawList();
            get_players();
            draw_watermark();
            aimbot();
            game_sdk->init();
            if (Vars.AimFov > 0) {
                Vars.isAimFov = true;
            } else {
                Vars.isAimFov = false;
            }
            ImGui::Render();
            ImDrawData* draw_data = ImGui::GetDrawData();
            ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
          
            [renderEncoder popDebugGroup];
            [renderEncoder endEncoding];

            [commandBuffer presentDrawable:view.currentDrawable];
        }

        [commandBuffer commit];
}


- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

@end
