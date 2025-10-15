// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VDevelopmentBoard.h for the primary calling header

#include "VDevelopmentBoard.h"
#include "VDevelopmentBoard__Syms.h"

//==========

void VDevelopmentBoard::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VDevelopmentBoard::eval\n"); );
    VDevelopmentBoard__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("DevelopmentBoard.v", 3, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void VDevelopmentBoard::_eval_initial_loop(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("DevelopmentBoard.v", 3, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void VDevelopmentBoard::_sequent__TOP__1(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_sequent__TOP__1\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 
        = ((IData)(vlTOPp->reset) & (~ (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25)));
}

VL_INLINE_OPT void VDevelopmentBoard::_sequent__TOP__3(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_sequent__TOP__3\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    SData/*9:0*/ __Vdly__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h;
    // Body
    __Vdly__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h 
        = vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h;
    if (vlTOPp->reset) {
        vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_data 
            = ((0x40U > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x))
                ? 0xf800U : (((0x40U <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                              & (0x80U > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                              ? 0xfc00U : (((0x80U 
                                             <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                            & (0xc0U 
                                               > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                            ? 0xffe0U
                                            : (((0xc0U 
                                                 <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                & (0x100U 
                                                   > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                ? 0x7e0U
                                                : (
                                                   ((0x100U 
                                                     <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                    & (0x140U 
                                                       > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                    ? 0x7ffU
                                                    : 
                                                   (((0x140U 
                                                      <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                     & (0x180U 
                                                        > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                     ? 0x1fU
                                                     : 
                                                    (((0x180U 
                                                       <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                      & (0x1c0U 
                                                         > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                      ? 0xf81fU
                                                      : 
                                                     (((0x1c0U 
                                                        <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                       & (0x200U 
                                                          > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                       ? 0U
                                                       : 
                                                      (((0x200U 
                                                         <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                        & (0x240U 
                                                           > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                        ? 0xffffU
                                                        : 
                                                       (((0x240U 
                                                          <= (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)) 
                                                         & (0x280U 
                                                            > (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_x)))
                                                         ? 0xd69aU
                                                         : 0U))))))))));
        __Vdly__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h 
            = ((0x31fU == (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h))
                ? 0U : (0x3ffU & ((IData)(1U) + (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h))));
        vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v 
            = (((0x20cU == (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v)) 
                & (0x31fU == (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h)))
                ? 0U : (0x3ffU & ((0x31fU == (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h))
                                   ? ((IData)(1U) + (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v))
                                   : (IData)(vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v))));
    } else {
        vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pix_data = 0U;
        __Vdly__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h = 0U;
        vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_v = 0U;
    }
    vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h 
        = __Vdly__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__vga_ctrl_inst__DOT__cnt_h;
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

void VDevelopmentBoard::_eval(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_eval\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((((IData)(vlTOPp->clk) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk))) 
         | ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->__Vclklast__TOP__reset)))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
    }
    if ((((IData)(vlTOPp->__VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25) 
          & (~ (IData)(vlTOPp->__Vclklast__TOP____VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25))) 
         | ((~ (IData)(vlTOPp->reset)) & (IData)(vlTOPp->__Vclklast__TOP__reset)))) {
        vlTOPp->_sequent__TOP__3(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clk = vlTOPp->clk;
    vlTOPp->__Vclklast__TOP__reset = vlTOPp->reset;
    vlTOPp->__Vclklast__TOP____VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 
        = vlTOPp->__VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25;
    vlTOPp->__VinpClk__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 
        = vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25;
}

VL_INLINE_OPT QData VDevelopmentBoard::_change_request(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_change_request\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData VDevelopmentBoard::_change_request_1(VDevelopmentBoard__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_change_request_1\n"); );
    VDevelopmentBoard* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    __req |= ((vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 ^ vlTOPp->__Vchglast__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25));
    VL_DEBUG_IF( if(__req && ((vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 ^ vlTOPp->__Vchglast__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25))) VL_DBG_MSGF("        CHANGE: ../RTL/pll.v:10: DevelopmentBoard.vga_colorbar_inst.pll_inst.clk_25\n"); );
    // Final
    vlTOPp->__Vchglast__TOP__DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25 
        = vlTOPp->DevelopmentBoard__DOT__vga_colorbar_inst__DOT__pll_inst__DOT__clk_25;
    return __req;
}

#ifdef VL_DEBUG
void VDevelopmentBoard::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VDevelopmentBoard::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((B2 & 0xfeU))) {
        Verilated::overWidthError("B2");}
    if (VL_UNLIKELY((B3 & 0xfeU))) {
        Verilated::overWidthError("B3");}
    if (VL_UNLIKELY((B4 & 0xfeU))) {
        Verilated::overWidthError("B4");}
    if (VL_UNLIKELY((B5 & 0xfeU))) {
        Verilated::overWidthError("B5");}
}
#endif  // VL_DEBUG
