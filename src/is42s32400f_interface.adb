with IS42S32400F_Control;
with IS42S32400F_Data;

package body IS42S32400F_Interface is

   package Ctrl is new IS42S32400F_Control
     (Driver_FMC_RCC_Enable    => Driver_FMC_RCC_Enable,
      Driver_FMC_RCC_Reset     => Driver_FMC_RCC_Reset,
      Driver_FMC_Config        => Driver_FMC_Config,
      Driver_Send_Cmd          => Driver_Send_Cmd,
      Driver_Busy              => Driver_Busy,
      Driver_Is_Initialized    => Driver_Is_Initialized,
      Driver_Set_Refresh_Count => Driver_Set_Refresh_Count);

   package Data is new IS42S32400F_Data
     (Base   => Base,
      Length => Length);

   procedure Configure      is begin Ctrl.Configure;      end Configure;
   procedure Init_Sequence  is begin Ctrl.Init_Sequence;  end Init_Sequence;
   function  Busy           return Boolean is (Ctrl.Busy);
   function  Is_Initialized return Boolean is (Ctrl.Is_Initialized);

   function Base_Address return System.Address is (Data.Base_Address);
   function Buffer_Size  return UInt32          is (Data.Buffer_Size);

   function Reserve
     (Amount : UInt32;
      Align  : UInt32 := Standard'Maximum_Alignment)
      return System.Address
   is (Data.Reserve (Amount, Align));

end IS42S32400F_Interface;