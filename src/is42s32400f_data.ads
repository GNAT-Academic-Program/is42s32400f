with MT;     use MT;
with System;

--  IS42S32400F data plane — memory-mapped access.
--  No bus formals: after init the chip appears directly at Base.

generic
   Base   : System.Address;
   Length : UInt32;
package IS42S32400F_Data is

   function Base_Address return System.Address;
   function Buffer_Size  return UInt32;

   function Reserve
     (Amount : UInt32;
      Align  : UInt32 := Standard'Maximum_Alignment)
      return System.Address;

end IS42S32400F_Data;