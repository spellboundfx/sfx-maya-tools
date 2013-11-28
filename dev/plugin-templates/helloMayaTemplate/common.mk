AM_CXXFLAGS += 

AM_LDFLAGS += 

if HOST_SYS_LINUX
AM_CXXFLAGS += -I$(MAYA_LOCATION)/include $(OPENMP_CFLAGS) -DBits64_ -m64 -DUNIX -D_BOOL -DLINUX -DFUNCPROTO -D_GNU_SOURCE -DLINUX_64 -fPIC -fno-strict-aliasing -DREQUIRE_IOSTREAM -O3 -Wall -Wno-multichar -Wno-comment -Wno-sign-compare -funsigned-char -pthread -Wno-deprecated -Wno-reorder -ftemplate-depth-25 -fno-gnu-keywords

AM_LDFLAGS += -L$(MAYA_LOCATION)/lib $(OPENMP_CFLAGS) -lOpenMaya -lOpenMayaUI -lOpenMayaAnim -lOpenMayaFX -lOpenMayaRender -lFoundation -lGL -lGLU -Wl,-Bsymbolic -shared -Wl,--version-script=$(MAYA_LOCATION)/devkit/plug-ins/linux_plugin.map 
endif

if HOST_SYS_DARWIN
AM_CXXFLAGS += -I$(MAYA_LOCATION)/include $(OPENMP_CFLAGS) -arch x86_64 -DMAC_PLUGIN -DOSMac_MachO_ -DBits64_ -m64-DUNIX -D_BOOL -DOSMac_ -DFUNCPROTO -D_GNU_SOURCE -fPIC -fno-strict-aliasing -DREQUIRE_IOSTREAM -Wno-deprecated -Wall -Wno-multichar -Wno-comment -Wno-sign-compare -funsigned-char -Wno-reorder -fno-gnu-keywords -ftemplate-depth-25 -pthread -Wno-deprecated -fno-gnu-keywords -g

AM_LDFLAGS += -L$(MAYA_LOCATION)/Maya.app/Contents/MacOS -Wl,-executable_path,$(MAYA_LOCATION)/Maya.app/Contents/MacOS -ldl -shared -framework OpenGL -framework GLUT
endif

if HOST_SYS_WINDOWS
AM_CXXFLAGS += -spam

AM_LDFLAGS += -eggs
endif
