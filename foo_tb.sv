`include "foo_tb_mon_intf.svh"
`include "foo_tb_stim_intf.svh"
`include "tb_env.svh"

program foo_tb
 (
  interface u_foo_stim_intf,
  interface u_foo_mon_intf
);

  event keep_going;

  tb_env env;

  initial begin
    env = new("env");
    env.set_mon_intf(u_foo_mon_intf);
    env.set_stim_intf(u_foo_stim_intf);
    env.run();

    @keep_going;
  end

endprogram

