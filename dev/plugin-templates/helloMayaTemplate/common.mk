AM_CXXFLAGS = -I$(MAYA_LOCATION)/include $(OPENMP_CFLAGS) -DBits64_ -m64 -DUNIX -D_BOOL -DLINUX -DFUNCPROTO -D_GNU_SOURCE -DLINUX_64 -fPIC -fno-strict-aliasing -DREQUIRE_IOSTREAM -O3 -Wall -Wno-multichar -Wno-comment -Wno-sign-compare -funsigned-char -pthread -Wno-deprecated -Wno-reorder -ftemplate-depth-25 -fno-gnu-keywords

AM_LDFLAGS = -L$(MAYA_LOCATION)/lib $(OPENMP_CFLAGS) -Wl,-Bsymbolic -shared -Wl,--version-script=$(MAYA_LOCATION)/devkit/plug-ins/linux_plugin.map -lOpenMaya -lOpenMayaUI -lOpenMayaAnim -lOpenMayaFX -lOpenMayaRender -lFoundation -lGL -lGLU
