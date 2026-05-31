# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\TUCN\\UTCN\\Third_Year\\SSC\\Lab\\L3\\ZYNQ_GPIO_PS_LAB\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "D:\\TUCN\\UTCN\\Third_Year\\SSC\\Lab\\L3\\ZYNQ_GPIO_PS_LAB\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "D:\\TUCN\\UTCN\\Third_Year\\SSC\\Lab\\L3\\ZYNQ_GPIO_PS_LAB\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "D:\\TUCN\\UTCN\\Third_Year\\SSC\\Lab\\L3\\ZYNQ_GPIO_PS_LAB\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
