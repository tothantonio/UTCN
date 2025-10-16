# 2025-10-16T15:17:43.985142300
import vitis

client = vitis.create_client()
client.set_workspace(path="L3")

platform = client.get_component(name="ZYNQ_GPIO_PS_LAB")
status = platform.build()

comp = client.get_component(name="Lab3_Zynq_GPIO")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

