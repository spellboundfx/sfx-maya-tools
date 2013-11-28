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
AM_CXXFLAGS += /c /I. /I"$(MAYA_LOCATION)\include" /nologo /W3 /WX- /O2 /Ob1 /D NDEBUG /D WIN32 /D _WINDOWS /D _USRDLL /D NT_PLUGIN /D _HAS_ITERATOR_DEBUGGING=0 /D _SECURE_SCL=0 /D _SECURE_SCL_THROWS=0 /D _SECURE_SCL_DEPRECATE=0 /D _CRT_SECURE_NO_DEPRECATE /D TBB_USE_DEBUG=0 /D __TBB_LIB_NAME=tbb.lib /D REQUIRE_IOSTREAM /D AW_NEW_IOSTREAMS /D Bits64_ /D _WINDLL /GF /Gm- /EHsc /MD /GS /Gy /fp:precise /Zc:wchar_t /Zc:forScope /GR /Gd /TP

AM_LDFLAGS += /OUT:"MayaPluginWizard1.mll" /INCREMENTAL:NO /NOLOGO /LIBPATH:"C:\Program Files\Autodesk\Maya2013\lib" Foundation.lib OpenMaya.lib OpenMayaUI.lib OpenMayaAnim.lib OpenMayaFX.lib OpenMayaRender.lib Image.lib libMocap.lib OpenGL32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /SUBSYSTEM:WINDOWS /OPT:REF /OPT:ICF /TLBID:1 /DYNAMICBASE:NO /NXCOMPAT /IMPLIB:"MayaPluginWizard1.lib" /MACHINE:X64 /DLL MayaPluginWizard1Node.obj pluginMain.obj /export:initializePlugin /export:uninitializePlugin
endif
