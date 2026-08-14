package IS42S32400F_Types is
   pragma Pure;

   --  IS42S32400F chip parameters
   CAS_Latency    : constant := 2;
   Column_Bits    : constant := 8;
   Row_Bits       : constant := 12;
   Data_Width     : constant := 16;
   Internal_Banks : constant := 4;

   --  Timing (ns) at SDCLK = 100 MHz (period = 10 ns)
   SDCLK_Period_Ns : constant := 10;
   TRAS_Ns         : constant := 42;
   TRC_Ns          : constant := 60;
   TXSR_Ns         : constant := 67;
   Refresh_Count   : constant := 1542;  --  (15.625μs / 10ns) - 20 = 1542

   --  Mode register: burst=1, sequential, CAS=2, single write
   Mode_Register : constant := 16#0220#;

   --  FMC SDCMR.MODE field values
   CMD_CLK_Enable  : constant := 1;
   CMD_PALL        : constant := 2;
   CMD_AutoRefresh : constant := 3;
   CMD_LoadMode    : constant := 4;

end IS42S32400F_Types;