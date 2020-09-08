--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : test_gcd.vhw
-- /___/   /\     Timestamp : Mon Sep 07 14:36:05 2020
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: test_gcd
--Device: Xilinx
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
library work;
use work.all;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY test_gcd IS
END test_gcd;

ARCHITECTURE testbench_arch OF test_gcd IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT gcd
        PORT (
            rst : In std_logic;
            clk : In std_logic;
            go_i : In std_logic;
            x_i : In std_logic_vector (3 DownTo 0);
            y_i : In std_logic_vector (3 DownTo 0);
            d_o : Out std_logic_vector (3 DownTo 0)
        );
    END COMPONENT;

    SIGNAL rst : std_logic := '0';
    SIGNAL clk : std_logic := '0';
    SIGNAL go_i : std_logic := '0';
    SIGNAL x_i : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL y_i : std_logic_vector (3 DownTo 0) := "0000";
    SIGNAL d_o : std_logic_vector (3 DownTo 0) := "0000";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 100 ns;

    BEGIN
        UUT : gcd
        PORT MAP (
            rst => rst,
            clk => clk,
            go_i => go_i,
            x_i => x_i,
            y_i => y_i,
            d_o => d_o
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                rst <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  185ns
                WAIT FOR 85 ns;
                go_i <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  385ns
                WAIT FOR 200 ns;
                rst <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  585ns
                WAIT FOR 200 ns;
                rst <= '1';
                go_i <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  785ns
                WAIT FOR 200 ns;
                rst <= '0';
                go_i <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  985ns
                WAIT FOR 200 ns;
                rst <= '1';
                -- -------------------------------------
                WAIT FOR 215 ns;

            END PROCESS;

    END testbench_arch;

