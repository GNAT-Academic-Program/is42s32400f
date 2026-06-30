with Ada.Real_Time; use Ada.Real_Time;

package body IS42S32400F_Control is

   function Ceil (Num, Den : Positive) return Positive is
     ((Num + Den - 1) / Den);

   procedure Configure is
   begin
      Driver_FMC_RCC_Enable;
      Driver_FMC_RCC_Reset;
      Driver_FMC_Config
        (CAS_Latency       => CAS_Latency,
         Column_Bits       => Column_Bits,
         Row_Bits          => Row_Bits,
         Data_Width        => Data_Width,
         Internal_Banks    => Internal_Banks,
         Clock_Period      => 2,
         Load_To_Active    => 2,
         Exit_Self_Refresh => Ceil (TXSR_Ns, SDCLK_Period_Ns),
         Self_Refresh_Time => Ceil (TRAS_Ns, SDCLK_Period_Ns),
         Row_Cycle_Delay   => Ceil (TRC_Ns,  SDCLK_Period_Ns),
         Write_Recovery    => 2,
         RP_Delay          => 2,
         RCD_Delay         => 2);
   end Configure;

   procedure Init_Sequence is
   begin
      loop exit when not Driver_Busy; end loop;
      Driver_Send_Cmd (CMD_CLK_Enable);

      delay until Clock + Microseconds (100);

      loop exit when not Driver_Busy; end loop;
      Driver_Send_Cmd (CMD_PALL);

      loop exit when not Driver_Busy; end loop;
      Driver_Send_Cmd (CMD_AutoRefresh, Auto_Refresh_Number => 8);

      loop exit when not Driver_Busy; end loop;
      Driver_Send_Cmd (CMD_LoadMode,
                       Mode_Register => IS42S32400F_Types.Mode_Register);

      loop exit when not Driver_Busy; end loop;
      Driver_Set_Refresh_Count (Refresh_Count);
      loop exit when not Driver_Busy; end loop;
   end Init_Sequence;

   function Busy          return Boolean is (Driver_Busy);
   function Is_Initialized return Boolean is (Driver_Is_Initialized);

end IS42S32400F_Control;