`include "foo_tb_mon_intf.svh"
`include "foo_tb_stim_intf.svh"

module foo_tb_bindings();

  bind top_level_tb foo_tb_mon_intf  u_foo_mon_intf ( .* );
  bind top_level_tb foo_tb_stim_intf u_foo_stim_intf ( .* );

  bind top_level_tb foo_tb u_foo_tb (
    u_foo_stim_intf,
    u_foo_mon_intf
  );
endmodule

