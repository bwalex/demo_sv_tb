`ifndef _TB_CLASSES_SVH
`define _TB_CLASSES_SVH

virtual class tb_component;
  string name;
  tb_component parent;

  function new(string name, tb_component parent = null);
    this.name = name;
    this.parent = parent;
  endfunction

  virtual task run();
  endtask
endclass

`endif
