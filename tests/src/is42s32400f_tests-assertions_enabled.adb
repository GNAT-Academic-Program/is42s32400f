procedure Is42s32400f_Tests.Assertions_Enabled is
begin
   begin
      pragma Assert (False, "Should raise");
   exception
      when others =>
         return; -- properly raised
   end;
   raise Program_Error with "Assertion did not raise";
end Is42s32400f_Tests.Assertions_Enabled;
