// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDevelopmentBoard.h for the primary calling header

#include "VDevelopmentBoard.h"
#include "VDevelopmentBoard__Syms.h"

//==========

VL_CTOR_IMP(VDevelopmentBoard) {
    VDevelopmentBoard__Syms* __restrict vlSymsp = __VlSymsp = new VDevelopmentBoard__Syms(this, name());
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VDevelopmentBoard::__Vconfigure(VDevelopmentBoard__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    Verilated::timeunit(-9);
    Verilated::timeprecision(-12);
}

VDevelopmentBoard::~VDevelopmentBoard() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = NULL);
}

void VDevelopmentBoard::_settle__TOP__2(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_settle__TOP__2\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->h_sync = (0x5fU >= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h));
    vlTOPp->v_sync = (1U >= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v));
    vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x 
        = ((((0x8fU <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h)) 
             & (0x30fU > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h))) 
            & ((0x23U <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v)) 
               & (0x203U > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v))))
            ? (0x3ffU & ((IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h) 
                         - (IData)(0x8fU))) : 0x3ffU);
    vlTOPp->rgb = ((((0x90U <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h)) 
                     & (0x310U > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h))) 
                    & ((0x23U <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v)) 
                       & (0x203U > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v))))
                    ? (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_data)
                    : 0U);
}

void VDevelopmentBoard::_eval_initial(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_eval_initial\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__reset = vlTOPp->reset;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 
        = vlTOPp->__VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25;
}

void VDevelopmentBoard::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::final\n"); );
    // Variables
    VDevelopmentBoard__Syms* __restrict vlSymsp = this->__VlSymsp;
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VDevelopmentBoard::_eval_settle(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_eval_settle\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
}

void VDevelopmentBoard::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_ctor_var_reset\n"); );
    // Body
    clk = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    B2 = VL_RAND_RESET_I(1);
    B3 = VL_RAND_RESET_I(1);
    B4 = VL_RAND_RESET_I(1);
    B5 = VL_RAND_RESET_I(1);
    h_sync = VL_RAND_RESET_I(1);
    v_sync = VL_RAND_RESET_I(1);
    rgb = VL_RAND_RESET_I(16);
    led1 = VL_RAND_RESET_I(1);
    led2 = VL_RAND_RESET_I(1);
    led3 = VL_RAND_RESET_I(1);
    led4 = VL_RAND_RESET_I(1);
    led5 = VL_RAND_RESET_I(1);
    DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x = VL_RAND_RESET_I(10);
    DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_data = VL_RAND_RESET_I(16);
    DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 = VL_RAND_RESET_I(1);
    DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h = VL_RAND_RESET_I(10);
    DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v = VL_RAND_RESET_I(10);
    __VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 = VL_RAND_RESET_I(1);
    __Vchglast__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 = VL_RAND_RESET_I(1);
}
