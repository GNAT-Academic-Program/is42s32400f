with MT;     use MT;
with System;

generic
   with procedure Driver_FMC_RCC_Enable;
   with procedure Driver_FMC_RCC_Reset;
   with procedure Driver_FMC_Config
     (CAS_Latency       : Positive;
      Column_Bits       : Positive;
      Row_Bits          : Positive;
      Data_Width        : Positive;
      Internal_Banks    : Positive;
      Clock_Period      : Positive;
      Load_To_Active    : Positive;
      Exit_Self_Refresh : Positive;
      Self_Refresh_Time : Positive;
      Row_Cycle_Delay   : Positive;
      Write_Recovery    : Positive;
      RP_Delay          : Positive;
      RCD_Delay         : Positive);
   with procedure Driver_Send_Cmd
     (Mode                : Natural;
      Auto_Refresh_Number : Natural := 1;
      Mode_Register       : Natural := 0);
   with function  Driver_Busy           return Boolean;
   with function  Driver_Is_Initialized return Boolean;
   with procedure Driver_Set_Refresh_Count (Count : Natural);
   Base   : System.Address;
   Length : UInt32;
package IS42S32400F_Interface is

   --  Control
   procedure Configure;
   procedure Init_Sequence;
   function  Busy           return Boolean;
   function  Is_Initialized return Boolean;

   --  Data
   function Base_Address return System.Address;
   function Buffer_Size  return UInt32;
   function Reserve
     (Amount : UInt32;
      Align  : UInt32 := Standard'Maximum_Alignment)
      return System.Address;

end IS42S32400F_Interface;