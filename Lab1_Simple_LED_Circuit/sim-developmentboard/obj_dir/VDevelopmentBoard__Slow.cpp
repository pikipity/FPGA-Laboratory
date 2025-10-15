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

void VDevelopmentBoard::_eval_initial(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_eval_initial\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
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
    vlTOPp->_combo__TOP__1(vlSymsp);
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
}
