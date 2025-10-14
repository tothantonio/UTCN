# 2025-10-14T16:00:43.326434300
import vitis

client = vitis.create_client()
client.set_workspace(path="L3")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "ZYNQ_GPIO_PS_LAB",hw_design = "$COMPONENT_LOCATION/../GPIO_PS_ZYNQ/design_1_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="ZYNQ_GPIO_PS_LAB")
status = platform.build()

comp = client.create_app_component(name="Lab3_Zynq_GPIO",platform = "$COMPONENT_LOCATION/../ZYNQ_GPIO_PS_LAB/export/ZYNQ_GPIO_PS_LAB/ZYNQ_GPIO_PS_LAB.xpfm",domain = "standalone_ps7_cortexa9_0",template = "hello_world")

vitis.dispose()

