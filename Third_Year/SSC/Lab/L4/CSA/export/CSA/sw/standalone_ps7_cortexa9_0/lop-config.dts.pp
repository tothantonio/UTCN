# 1 "D:/TUCN/UTCN/Third_Year/SSC/Lab/L4/CSA/export/CSA/sw/standalone_ps7_cortexa9_0/lop-config.dts"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "D:/TUCN/UTCN/Third_Year/SSC/Lab/L4/CSA/export/CSA/sw/standalone_ps7_cortexa9_0/lop-config.dts"

/dts-v1/;
/ {
        compatible = "system-device-tree-v1,lop";
        lops {
                lop_0 {
                        compatible = "system-device-tree-v1,lop,load";
                        load = "assists/baremetal_validate_comp_xlnx.py";
                };

                lop_1 {
                    compatible = "system-device-tree-v1,lop,assist-v1";
                    node = "/";
                    outdir = "D:/TUCN/UTCN/Third_Year/SSC/Lab/L4/CSA/export/CSA/sw/standalone_ps7_cortexa9_0";
                    id = "module,baremetal_validate_comp_xlnx";
                    options = "ps7_cortexa9_0 D:/Xilinx/2025.1/Vitis/data/embeddedsw/lib/sw_apps/hello_world/src D:/TUCN/UTCN/Third_Year/SSC/Lab/L4/_ide/.wsdata/.repo.yaml";
                };

        };
    };
