set project PUL_PROJEKT
set top_module tdc_top
set target xc7a35tcpg236-1
set bitstream_file build/${project}.runs/impl_1/${top_module}.bit

proc usage {} {
    puts "usage: vivado -mode tcl -source [info script] -tclargs open"
    exit 1
}

if {($argc != 1) || ([lindex $argv 0] ni {"open" })} {
    usage
}

file mkdir vivado
create_project ${project} vivado -part ${target} -force


read_xdc {

}

read_verilog {

}

read_vhdl {

}

#add_files -fileset sim_1 {
#
#}

set_property top ${top_module} [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

if  {[lindex $argv 0] == "open"} {
    start_gui
} else {
    exit
    }
}
