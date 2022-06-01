
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Final -dir "D:/Xilinx/Final/planAhead_run_3" -part xc3s50antqg144-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Xilinx/Final/main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Xilinx/Final} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "main.ucf" [current_fileset -constrset]
add_files [list {main.ucf}] -fileset [get_property constrset [current_run]]
link_design
