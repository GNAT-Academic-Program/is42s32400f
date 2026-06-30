with System.Storage_Elements; use System.Storage_Elements;
with SDRAM_Types;              use SDRAM_Types;

package body IS42S32400F_Data is

   use type UInt32;  -- Make operators visible

   Current : System.Address := Base;

   function Base_Address return System.Address is (Base);
   function Buffer_Size  return UInt32          is (Length);

   function Reserve
     (Amount : UInt32;
      Align  : UInt32 := Standard'Maximum_Alignment)
      return System.Address
   is
      Rounded : constant UInt32   := (Amount + Align - 1) / Align * Align;
      Offset  : constant UInt32   :=
        UInt32 (To_Integer (Current) - To_Integer (Base));
      Ret     : constant System.Address := Current;
   begin
      if Offset + Rounded > Length then
         raise SDRAM_Error with "IS42S32400F region exhausted";
      end if;
      Current := Current + Storage_Offset (Rounded);
      return Ret;
   end Reserve;

end IS42S32400F_Data;