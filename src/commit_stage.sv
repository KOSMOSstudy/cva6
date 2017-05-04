// Author: Florian Zaruba, ETH Zurich
// Date: 15.04.2017
// Description: Commits to the architectural state resulting from the scoreboard.
//
// Copyright (C) 2017 ETH Zurich, University of Bologna
// All rights reserved.
//
// This code is under development and not yet released to the public.
// Until it is released, the code is under the copyright of ETH Zurich and
// the University of Bologna, and may contain confidential and/or unpublished
// work. Any reuse/redistribution is strictly forbidden without written
// permission from ETH Zurich.
//
// Bug fixes and contributions will eventually be released under the
// SolderPad open hardware license in the context of the PULP platform
// (http://www.pulp-platform.org), under the copyright of ETH Zurich and the
// University of Bologna.
//
import ariane_pkg::*;

module commit_stage (
    input logic                 clk_i,      // Clock
    input logic                 rst_ni,     // Asynchronous reset active low

    output priv_lvl_t           priv_lvl_o,  // privilege level out
    output exception            exception_o, // take exception to controller and if

    // from scoreboard
    input  scoreboard_entry     commit_instr_i,
    output logic                commit_ack_o,

    // to register file
    output  logic[4:0]          waddr_a_o,
    output  logic[63:0]         wdata_a_o,
    output  logic               we_a_o

);

    assign waddr_a_o = commit_instr_i.rd;
    assign wdata_a_o = commit_instr_i.result;

    // commit instruction
    // write register file
    always_comb begin : commit
        // default assignments
        commit_ack_o = 1'b0;
        we_a_o       = 1'b0;
        if (commit_instr_i.valid) begin
            we_a_o       = 1'b1;
            commit_ack_o = 1'b1;
        end
    end

    // CSR logic

    // privilege check

    // exception logic
endmodule