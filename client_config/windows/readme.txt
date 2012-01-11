make client config windows
use winrar sfx
===============================
+ Chtunnel_Config_xXX.exe
  |- config.exe
  |- remove_config.bat
  |- remove_old.bat
+ config.exe
  |+ Chtunnel_Config
  |  |- ca.crt
  |  |- Chtunnel_TCP_443.ovpn
  |  |- Chtunnel_UDP_053.ovpn
  |- about.txt
===============================
make sfx config
I. config.exe
 - path to extract : no
 - Create in the current folder : ok
 - Run before extraction : .\remove_old.bat
II. Chtunnel_Config_xXX.exe 
 - path to extract x86 : %systemdrive%\Program Files\OpenVPN\config
 - path to extract x64 : %systemdrive%\Program Files (x86)\OpenVPN\config
 - Absolute path : ok
 - Run after extraction : .\remove_config.bat
 - Run before extraction : no