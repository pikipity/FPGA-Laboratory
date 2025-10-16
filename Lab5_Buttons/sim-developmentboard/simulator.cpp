//#include <verilated.h>          // defines common routines
#include <GL/glut.h>
#include <thread>
#include <iostream>
#include <atomic>

#include "VDevelopmentBoard.h"            // from Verilating "display.v"

using namespace std;

void wait_10ns() {
    for (volatile int i = 0; i < 100; ++i) {
        // Adjust loop count based on calibration
    }
}

VDevelopmentBoard* display;              // instantiation of the model

uint64_t main_time = 0;         // current simulation time
double sc_time_stamp() {        // called by $time in Verilog
    return main_time;
}

// to wait for the graphics thread to complete initialization
bool gl_setup_complete = false;

// 640X480 VGA sync parameters
const int LEFT_PORCH		= 	48;
const int ACTIVE_WIDTH		= 	640;
const int RIGHT_PORCH		= 	16;
const int HORIZONTAL_SYNC	=	96;
const int TOTAL_WIDTH		=	800;

const int TOP_PORCH			= 	33;
const int ACTIVE_HEIGHT		= 	480;
const int BOTTOM_PORCH		= 	10;
const int VERTICAL_SYNC		=	2;
const int TOTAL_HEIGHT		=	525;

// Active region offsets
const int H_ACTIVE_START = 144; // H_SYNC(96) + H_BACK(40) + H_LEFT(8) from Verilog
const int V_ACTIVE_START = 35;  // V_SYNC(2) + V_BACK(25) + V_TOP(8) from Verilog

// pixels are buffered here
float graphics_buffer[ACTIVE_WIDTH][ACTIVE_HEIGHT][3] = {};

// calculating each pixel's size in accordance to OpenGL system
// each axis in OpenGL is in the range [-1:1]
// 重新计算VGA像素大小，保持原始比例
float pixel_w = 2.0 / ACTIVE_WIDTH * 0.8f;
float pixel_h = 2.0 / ACTIVE_HEIGHT * 0.8f;

bool restart_triggered = false;

// 在全局变量区域添加LED状态变量
std::atomic<int> leds_state[5] = {1, 1, 1, 1, 1}; // 初始状态为灭(1)

const int WINDOW_WIDTH = 800;  // 窗口宽度
const int WINDOW_HEIGHT = 600; // 窗口高度
const int VGA_DISPLAY_HEIGHT = 480; // VGA显示区域高度
const int LED_DISPLAY_HEIGHT = 100; // LED显示区域高度

// 添加圆形绘制函数
void drawCircle(float cx, float cy, float r, int num_segments) {
    glBegin(GL_TRIANGLE_FAN);
    for(int i = 0; i < num_segments; i++) {
        float theta = 2.0f * 3.1415926f * float(i) / float(num_segments);
        float x = r * cosf(theta);
        float y = r * sinf(theta);
        glVertex2f(x + cx, y + cy);
    }
    glEnd();
}

// gets called periodically to update screen
void render(void) {
    glClear(GL_COLOR_BUFFER_BIT);

    // 绘制VGA显示区域背景
    glColor3f(0.1f, 0.1f, 0.1f);
    glRectf(-1.0f, -1.0f, 1.0f, 1.0f);

    // 绘制VGA显示区域标题
    glColor3f(1.0f, 1.0f, 1.0f);
    glRasterPos2f(-0.9f, 0.9f);
    std::string vga_title = "VGA screen";
    for (char c : vga_title) {
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, c);
    }
    
    // convert pixels into OpenGL rectangles
    for(int i = 0; i < ACTIVE_WIDTH; i++){
        for(int j = 0; j < ACTIVE_HEIGHT; j++){
            glColor3f(graphics_buffer[i][j][0], graphics_buffer[i][j][1], graphics_buffer[i][j][2]);
            // 调整VGA显示位置，使其位于VGA区域中心
            float x1 = (i * pixel_w - 0.8f) * 0.8f;
            float y1 = (-j * pixel_h + 0.6f) * 0.8f+0.3f;
            float x2 = ((i+1) * pixel_w - 0.8f) * 0.8f;
            float y2 = (-(j+1) * pixel_h + 0.6f) * 0.8f+0.3f;
            glRectf(x1, y1, x2, y2);
        }
    }

    // 绘制LED显示区域背景
    glColor3f(0.2f, 0.2f, 0.2f);
    glRectf(-1.0f, -1.0f, 1.0f, -0.8f);

    // 绘制LED显示区域标题
    glColor3f(1.0f, 1.0f, 1.0f);
    glRasterPos2f(-0.9f, -0.85f);
    std::string led_title = "LED";
    for (char c : led_title) {
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, c);
    }

    // 绘制LED
    float led_spacing = 1.6f / 6.0f; // LED之间的间距
    float led_radius = 0.04f;        // LED半径
    
    for(int i = 0; i < 5; i++){
        float x_pos = -0.8f + (i+1) * led_spacing;
        float y_pos = -0.9f;
        
        // 绘制LED底座
        glColor3f(0.3f, 0.3f, 0.3f);
        drawCircle(x_pos, y_pos, led_radius * 1.2f, 20);
        
        // 根据状态绘制LED
        if(leds_state[i] == 0){
            // LED亮
            glColor3f(1.0f, 0.0f, 0.0f); // 红色
        } else {
            // LED灭
            glColor3f(0.1f, 0.0f, 0.0f); // 暗红色
        }
        drawCircle(x_pos, y_pos, led_radius, 20);
        
        // 绘制LED编号
        glColor3f(1.0f, 1.0f, 1.0f);
        glRasterPos2f(x_pos - 0.01f, y_pos - 0.06f);
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15, '1' + i);
    }
    
    glFlush();
}



// timer to periodically update the screen
void glutTimer(int t) {
    glutPostRedisplay(); // re-renders the screen
    glutTimerFunc(t, glutTimer, t);
}

// handle up/down/left/right arrow keys
std::atomic<int> keys[5] = {1, 1, 1, 1, 1};
// int key_prev_state[5] = {1, 1, 1, 1, 1};
void keyPressed(unsigned char key, int x, int y) {
    switch(key) {
        case 'a':
            keys[0] = 0;
				restart_triggered = true;
            break;
        case 's':
            keys[1] = 0;
            break;
        case 'd':
            keys[2] = 0;
            break;
        case 'f':
            keys[3] = 0;
            break;
		  case 'g':
            keys[4] = 0;
            break;
    }
}
void keyReleased(unsigned char key, int x, int y) {
    switch(key) {
        case 'a':
            keys[0] = 1;
            break;
        case 's':
            keys[1] = 1;
            break;
        case 'd':
            keys[2] = 1;
            break;
        case 'f':
            keys[3] = 1;
            break;
		  case 'g':
            keys[4] = 1;
            break;
    }
}

// initiate and handle graphics
void graphics_loop(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE);
    glutInitWindowSize(WINDOW_WIDTH, WINDOW_HEIGHT);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("VGA and LED Simulator");
    glutDisplayFunc(render);
    glutSetKeyRepeat(GLUT_KEY_REPEAT_OFF);
    glutKeyboardFunc(keyPressed);
    glutKeyboardUpFunc(keyReleased);
    
    gl_setup_complete = true;

    // re-render every 16ms, around 60Hz
    glutTimerFunc(16, glutTimer, 16);
    glutMainLoop();
}

// tracking VGA signals
int coord_x = 0;
int coord_y = 0;
bool pre_h_sync = 0;
bool pre_v_sync = 0;



// we only want the input to last for one or few clocks
// void discard_input() {
//     display->reset = 1;
//     display->B2 = 1;
//     display->B3 = 1;
//     display->B4 = 1;
// 	 display->B5 = 1;
// }

// set Verilog module inputs based on arrow key inputs
void apply_input() {
	
    // for (int i = 0; i < 5; i++) {
    //     // 检测下降沿（按键按下）
    //     if (key_prev_state[i] == 1 && keys[i] == 0) {
    //         // 下降沿，触发按键按下
    //         switch (i) {
    //             case 0: display->reset = 0; break;
    //             case 1: display->B2 = 0; break;
    //             case 2: display->B3 = 0; break;
    //             case 3: display->B4 = 0; break;
    //             case 4: display->B5 = 0; break;
    //         }
    //     }
    //     // 检测上升沿（按键释放）
    //     else if (key_prev_state[i] == 0 && keys[i] == 1) {
    //         // 上升沿，触发按键释放
    //         switch (i) {
    //             case 0: display->reset = 1; break;
    //             case 1: display->B2 = 1; break;
    //             case 2: display->B3 = 1; break;
    //             case 3: display->B4 = 1; break;
    //             case 4: display->B5 = 1; break;
    //         }
    //     }
    // }
    // for (int i = 0; i < 5; i++) {
    //     // 更新前一个状态
    //     key_prev_state[i] = keys[i];
    // }
    display->reset = keys[0];
    display->B2 = keys[1];
    display->B3 = keys[2];
    display->B4 = keys[3];
    display->B5 = keys[4];
}

void update_leds(){
    // 更新LED状态
    leds_state[0] = display->led1;
    leds_state[1] = display->led2;
    leds_state[2] = display->led3;
    leds_state[3] = display->led4;
    leds_state[4] = display->led5;
}

void display_eval(){
    apply_input();
    display->eval();
    update_leds();
}


// simulate for a single clock
void tick() {
    // // 上升沿
    // display->clk = 0;
    // display_eval();
    
    // 等待一小段时间模拟时钟上升
    wait_10ns();
    main_time++;
    display->clk = 1;
    display_eval();
    
    // 下降沿
    wait_10ns();
    main_time++;
    display->clk = 0;
    display_eval();
}

// globally reset the model
void reset() {
    display->reset = 0; // 复位信号初始为高电平（不复位）
    display->B2 = 1;
    display->B3 = 1;
    display->B4 = 1;
    display->B5 = 1;
    display->clk = 0;
    display->eval();
    // 执行多个时钟周期确保完全复位
    for(int i = 0; i < 10; i++) {
        tick();
    }
	 display->reset = 1;
	 
	 // 重置图形缓冲区
    for(int i = 0; i < ACTIVE_WIDTH; i++) {
        for(int j = 0; j < ACTIVE_HEIGHT; j++) {
            graphics_buffer[i][j][0] = 0.0f;
            graphics_buffer[i][j][1] = 0.0f;
            graphics_buffer[i][j][2] = 0.0f;
        }
    }
	 
	 // 重置VGA信号跟踪变量
    coord_x = 0;
    coord_y = 0;
    pre_h_sync = 0;
    pre_v_sync = 0;
	
	// 重置按键状态
    for (int i = 0; i < 5; i++) {
        keys[i] = 1;
        // key_prev_state[i] = 1;
    }
	 
	 // 清除重启标志
    restart_triggered = false;
	 
	 
}



// read VGA outputs and update graphics buffer
void sample_pixel() {
    //discard_input();
	
// 	static int debug_count = 0;
//    if (debug_count % 1000 == 0) {
//         cout << "key 1 " << keys[1] << endl;
//        cout << "key 1: " << keys[1] << endl;
//    }
//    debug_count++;
    
    coord_x = (coord_x + 1) % TOTAL_WIDTH;

    if(display->h_sync && !pre_h_sync){ // on positive edge of h_sync (active high)
        // re-sync horizontal counter: reset to 0 and increment vertical counter
        coord_x = 0;
        coord_y = (coord_y + 1) % TOTAL_HEIGHT;
    }

    if(display->v_sync && !pre_v_sync){ // on positive edge of v_sync (active high)
        // re-sync vertical counter: reset to 0
        coord_y = 0;

        
    }

    if(coord_x >= H_ACTIVE_START && coord_x < H_ACTIVE_START + ACTIVE_WIDTH && 
       coord_y >= V_ACTIVE_START && coord_y < V_ACTIVE_START + ACTIVE_HEIGHT){
        int x_index = coord_x - H_ACTIVE_START;
        int y_index = coord_y - V_ACTIVE_START;
        int rgb = display->rgb;
        graphics_buffer[x_index][y_index][0] = float((rgb & 0xF800) >> 11) / 31.0f;
        graphics_buffer[x_index][y_index][1] = float((rgb & 0x07E0) >> 5) / 63.0f;
        graphics_buffer[x_index][y_index][2] = float((rgb & 0x001F) ) / 31.0f;
    }

    pre_h_sync = display->h_sync;
    pre_v_sync = display->v_sync;
}



int main(int argc, char** argv) {
    // create a new thread for graphics handling
    thread thread(graphics_loop, argc, argv);
    // wait for graphics initialization to complete
    while(!gl_setup_complete);

    Verilated::commandArgs(argc, argv);   // remember args

    // create the model
    display = new VDevelopmentBoard;

    // reset the model
    reset();

    // cycle accurate simulation loop
    while (!Verilated::gotFinish()) {
		 if (restart_triggered) {
        reset();
    }
		
        tick();
        // update_leds();
        // apply_input(); // inputs are pulsed once each new frame
        tick();
        // update_leds();
        // apply_input(); // inputs are pulsed once each new frame
        // the clock frequency of VGA is half of that of the whole model
        // so we sample from VGA every other clock
        sample_pixel();
    }

    display->final();
    delete display;
}

