set prjDir "my_xapp1338"
set top "design_1_wrapper"
set bitDir  "./Bitstreams"

if { ![file exists "./Bitstreams"]} { 
   file mkdir Bitstreams
}

#placeholder
open_checkpoint $prjDir/$prjDir.runs/impl_1/${top}_routed.dcp
set_property CONFIG_MODE S_SELECTMAP32 [current_design]
write_bitstream -force -cell inst_count $bitDir/inst_count_placeholder.bit
write_debug_probes -force $bitDir/${top}_placeholder.ltx

#write compressed top level bitstream
set_property bitstream.general.compress true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 51.0 [current_design]
set_property CONFIG_MODE SPIx8 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 8 [current_design]
write_bitstream -force -no_partial_bitfile $bitDir/${top}.bit
close_project

#count up
open_checkpoint $prjDir/$prjDir.runs/child_0_impl_1/${top}_routed.dcp
set_property CONFIG_MODE S_SELECTMAP32 [current_design]
write_bitstream -force -cell inst_count $bitDir/inst_count_counting_up_partial.bit
write_debug_probes -force $bitDir/${top}_counting_up.ltx
close_project

#count down
open_checkpoint $prjDir/$prjDir.runs/child_1_impl_1/${top}_routed.dcp
set_property CONFIG_MODE S_SELECTMAP32 [current_design]
write_bitstream -force -cell inst_count $bitDir/inst_count_counting_down_partial.bit
write_debug_probes -force $bitDir/${top}_counting_down.ltx
close_project
